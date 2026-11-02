import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/filter/filter_widget.dart';
import '/components/footer/footer_widget.dart';
import '/components/no_events/no_events_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'old_events_model.dart';
export 'old_events_model.dart';

class OldEventsWidget extends StatefulWidget {
  const OldEventsWidget({super.key});

  static String routeName = 'OldEvents';
  static String routePath = '/oldEvents';

  @override
  State<OldEventsWidget> createState() => _OldEventsWidgetState();
}

class _OldEventsWidgetState extends State<OldEventsWidget> {
  late OldEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OldEventsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!loggedIn) {
        await authManager.signOut();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EntryPageWidget(),
          ),
        );
      }
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFEFEFEF),
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 500.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).transparent,
            ),
            child: Stack(
              alignment: AlignmentDirectional(0.0, -1.0),
              children: [
                Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 45.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 25.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Αρχείο εξορμήσεων',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 28.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            if (FFAppState().CurrentRegion !=
                                                    '')
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().CurrentRegion =
                                                      '';
                                                  FFAppState().update(() {});
                                                },
                                                child: Container(
                                                  width: 60.0,
                                                  height: 53.3,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .transparent,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl:
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-hospitals-1whx4e/assets/du3r57z6zw9e/HD_Filter_Off-71.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        if (FFAppState().CurrentRegion != '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SelectionArea(
                                                    child: Text(
                                                  'σε ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                )),
                                                SelectionArea(
                                                    child: Text(
                                                  FFAppState().CurrentRegion,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                )),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) =>
                                        StreamBuilder<List<EventsRecord>>(
                                      stream: queryEventsRecord(
                                        queryBuilder: (eventsRecord) =>
                                            eventsRecord
                                                .where(
                                                  'EventHospitalPlanner',
                                                  isEqualTo: currentUserDocument
                                                      ?.nYAUserHospital,
                                                )
                                                .orderBy('EventDate',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 24.0,
                                              height: 24.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<EventsRecord>
                                            containerEventsRecordList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .transparent,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final archivedEvents =
                                                  containerEventsRecordList
                                                      .map((e) => e)
                                                      .toList()
                                                      .where((e) =>
                                                          (e.eventDate! <
                                                              functions
                                                                  .getTodayDate()) ||
                                                          (e.eventState ==
                                                              'canceled'))
                                                      .toList();
                                              if (archivedEvents.isEmpty) {
                                                return Center(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.75,
                                                    child: NoEventsWidget(),
                                                  ),
                                                );
                                              }

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    archivedEvents.length,
                                                itemBuilder: (context,
                                                    archivedEventsIndex) {
                                                  final archivedEventsItem =
                                                      archivedEvents[
                                                          archivedEventsIndex];
                                                  return Visibility(
                                                    visible: functions
                                                        .showSearchResult(
                                                            FFAppState()
                                                                .CurrentRegion,
                                                            archivedEventsItem
                                                                .address
                                                                .region),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState().newEvent =
                                                            archivedEventsItem
                                                                .reference;
                                                        FFAppState()
                                                            .update(() {});
                                                        Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .bottomToTop,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            reverseDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        300),
                                                            child:
                                                                EventDetailsWidget(),
                                                          ),
                                                        );
                                                      },
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        35.0,
                                                                        15.0,
                                                                        25.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    BloodAppointmentRecord>>(
                                                              stream:
                                                                  queryBloodAppointmentRecord(
                                                                queryBuilder:
                                                                    (bloodAppointmentRecord) =>
                                                                        bloodAppointmentRecord
                                                                            .where(
                                                                  'RelatedEvent',
                                                                  isEqualTo:
                                                                      archivedEventsItem
                                                                          .reference,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          24.0,
                                                                      height:
                                                                          24.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<BloodAppointmentRecord>
                                                                    eventCardBloodAppointmentRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth: double
                                                                        .infinity,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image:
                                                                          CachedNetworkImageProvider(
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-hospitals-1whx4e/assets/10ntmeoqbyr6/Horizontal_Background-68.png',
                                                                      ),
                                                                    ),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            15.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                        spreadRadius:
                                                                            10.0,
                                                                      )
                                                                    ],
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary
                                                                      ],
                                                                      stops: [
                                                                        0.0,
                                                                        1.0
                                                                      ],
                                                                      begin: AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                      end: AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            50.0,
                                                                            15.0,
                                                                            15.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              archivedEventsItem.nameOfEvent,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                    font: GoogleFonts.roboto(
                                                                                      fontWeight: FlutterFlowTheme.of(context).displaySmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFFEFEFEF),
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).displaySmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(archivedEventsItem.eventUserPlanner!),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 24.0,
                                                                                      height: 24.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }

                                                                                final creatorUsersRecord = snapshot.data!;

                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  'Δημιουργός: ${creatorUsersRecord.displayName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.roboto(
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ));
                                                                              },
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  SelectionArea(
                                                                                      child: Text(
                                                                                    dateTimeFormat(
                                                                                      "d/M/y",
                                                                                      archivedEventsItem.eventDate!,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.roboto(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                          fontSize: 20.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  )),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            if (archivedEventsItem.eventState ==
                                                                                'canceled')
                                                                              Container(
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).transparent,
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    child: SelectionArea(
                                                                                        child: Text(
                                                                                      'Ακυρωμένη',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontWeight: FontWeight.w900,
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                    )),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (archivedEventsItem.seatsMax ==
                                                                                eventCardBloodAppointmentRecordList.length)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  height: 28.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF22DD00),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                      child: SelectionArea(
                                                                                          child: Text(
                                                                                        'Πλήρες',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.roboto(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 1.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      )),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              fadeOutDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              imageUrl:
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-hospitals-1whx4e/assets/xh66i3h72v6c/CompletedEvents-12.png',
                                                              width: 75.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x4C000000),
                              barrierColor: Color(0x00000000),
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: FilterWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          text: 'Φίλτρα',
                          icon: Icon(
                            Icons.filter_list_rounded,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.footerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: FooterWidget(
                            backOneColor:
                                FlutterFlowTheme.of(context).transparent,
                            iconTwoColor: FlutterFlowTheme.of(context).primary,
                            backTwoColor: Color(0x33FF7E67),
                            iconThreeColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            backThreeColor:
                                FlutterFlowTheme.of(context).transparent,
                            iconFourColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            backFourColor:
                                FlutterFlowTheme.of(context).transparent,
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
