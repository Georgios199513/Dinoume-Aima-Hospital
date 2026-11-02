import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/all_about_events/create_event/s6_preview_event/s6_preview_event_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'bulk_update_event_model.dart';
export 'bulk_update_event_model.dart';

class BulkUpdateEventWidget extends StatefulWidget {
  const BulkUpdateEventWidget({
    super.key,
    required this.fieldToModify,
  });

  final String? fieldToModify;

  static String routeName = 'BulkUpdateEvent';
  static String routePath = '/bulkUpdateEvent';

  @override
  State<BulkUpdateEventWidget> createState() => _BulkUpdateEventWidgetState();
}

class _BulkUpdateEventWidgetState extends State<BulkUpdateEventWidget> {
  late BulkUpdateEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BulkUpdateEventModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (FFAppState().BloodAppointmentsToComplete.length > 0) {
        _model.appointment = await BloodAppointmentRecord.getDocumentOnce(
            FFAppState().BloodAppointmentsToComplete.firstOrNull!);
        _model.user = await UsersRecord.getDocumentOnce(
            _model.appointment!.parentReference);
        _model.event = await EventsRecord.getDocumentOnce(
            _model.appointment!.relatedEvent!);
        _model.timeOfAppointment =
            await TimeChunksChoicesRecord.getDocumentOnce(
                _model.appointment!.timeOfAppointment!);

        await _model.appointment!.reference
            .update(createBloodAppointmentRecordData(
          appointmentModifications: widget.fieldToModify,
        ));
        FFAppState().removeFromBloodAppointmentsToComplete(
            FFAppState().BloodAppointmentsToComplete.firstOrNull!);
        safeSetState(() {});
        _model.texts = await queryTextsRecordOnce(
          queryBuilder: (textsRecord) => textsRecord.where(
            'Tags',
            isEqualTo: widget.fieldToModify,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.emailSend = await SendAppointmentModificationCall.call(
          to: _model.user?.email,
          subject: _model.texts?.title,
          textBody: _model.texts?.text,
          nameEvent: _model.event?.nameOfEvent,
          addressEvent:
              '${_model.event?.address.streetAndNumber}, ${_model.event?.address.postalCode} ${_model.event?.address.city}',
          dateEvent: dateTimeFormat(
            "d/M/y",
            _model.event?.eventDate,
            locale: FFLocalizations.of(context).languageCode,
          ),
          timeEvent: widget.fieldToModify == 'timeRange'
              ? '${_model.timeOfAppointment?.timeChunks.from} (Αυτό το ωράριο δεν πια διαθέσιμο)'
              : _model.timeOfAppointment?.timeChunks.from,
        );
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => S6PreviewEventWidget(
            isNewState: false,
          ),
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/mozfeqtsxy68/back__02_min.png',
                ),
              ),
            ),
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 500.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).transparent,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl:
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/a17u2c6auola/Icons-10.png',
                                  width: 100.0,
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: Container(
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x44F1F4F8),
                                      borderRadius: BorderRadius.circular(40.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    child: LinearPercentIndicator(
                                      percent: valueOrDefault<double>(
                                        functions.returnProgress(
                                            FFAppState().totalUpdateAmount,
                                            FFAppState()
                                                .BloodAppointmentsToComplete
                                                .length),
                                        0.0,
                                      ),
                                      width: 150.0,
                                      lineHeight: 10.0,
                                      animation: false,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).primary,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).ligthRed,
                                      barRadius: Radius.circular(40.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      formatNumber(
                                        functions.returnProgress(
                                            FFAppState().totalUpdateAmount,
                                            FFAppState()
                                                .BloodAppointmentsToComplete
                                                .length),
                                        formatType: FormatType.percent,
                                      ),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
