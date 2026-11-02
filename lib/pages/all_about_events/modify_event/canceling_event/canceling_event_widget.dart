import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home_page/home_page_mobile/home_page_mobile_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'canceling_event_model.dart';
export 'canceling_event_model.dart';

class CancelingEventWidget extends StatefulWidget {
  const CancelingEventWidget({
    super.key,
    this.fieldToModify,
  });

  final String? fieldToModify;

  static String routeName = 'CancelingEvent';
  static String routePath = '/cancelingEvent';

  @override
  State<CancelingEventWidget> createState() => _CancelingEventWidgetState();
}

class _CancelingEventWidgetState extends State<CancelingEventWidget> {
  late CancelingEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CancelingEventModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.deletingEvent =
          await EventsRecord.getDocumentOnce(FFAppState().newEvent!);

      await FFAppState().newEvent!.update(createEventsRecordData(
            eventState: 'canceled',
            nameOfEvent: '[Ακυρωμένη] ${_model.deletingEvent?.nameOfEvent}',
          ));
      while (FFAppState().BloodAppointmentsToComplete.length > 0) {
        _model.appointment = await BloodAppointmentRecord.getDocumentOnce(
            FFAppState().BloodAppointmentsToComplete.firstOrNull!);
        _model.user = await UsersRecord.getDocumentOnce(
            _model.appointment!.parentReference);
        _model.bloodAppointmentTime =
            await TimeChunksChoicesRecord.getDocumentOnce(
                _model.appointment!.timeOfAppointment!);
        _model.textsNotification = await queryTextsRecordOnce(
          queryBuilder: (textsRecord) => textsRecord.where(
            'Tags',
            isEqualTo: 'deleteEvent',
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);

        await FFAppState()
            .BloodAppointmentsToComplete
            .firstOrNull!
            .update(createBloodAppointmentRecordData(
              appointmentState: 'canceled',
            ));
        FFAppState().removeFromBloodAppointmentsToComplete(
            FFAppState().BloodAppointmentsToComplete.firstOrNull!);
        safeSetState(() {});
        _model.apiResult1wq = await SendAppointmentModificationCall.call(
          to: _model.user?.email,
          subject: _model.textsNotification?.title,
          textBody: _model.textsNotification?.text,
          nameEvent: _model.deletingEvent?.nameOfEvent,
          addressEvent:
              '${_model.deletingEvent?.address.streetAndNumber}, ${_model.deletingEvent?.address.city} ${_model.deletingEvent?.address.postalCode}',
          dateEvent: dateTimeFormat(
            "d/M/y",
            _model.deletingEvent?.eventDate,
            locale: FFLocalizations.of(context).languageCode,
          ),
          timeEvent: _model.bloodAppointmentTime?.timeChunks.from,
        );
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePageMobileWidget(),
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
                                    formatNumber(
                                      functions.returnProgress(
                                          FFAppState().totalUpdateAmount,
                                          FFAppState()
                                              .BloodAppointmentsToComplete
                                              .length),
                                      formatType: FormatType.percent,
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
