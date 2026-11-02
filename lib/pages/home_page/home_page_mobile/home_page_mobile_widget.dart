import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chip/chip_widget.dart';
import '/components/filter/filter_widget.dart';
import '/components/footer/footer_widget.dart';
import '/components/no_events/no_events_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_mobile_model.dart';
export 'home_page_mobile_model.dart';

class HomePageMobileWidget extends StatefulWidget {
  const HomePageMobileWidget({super.key});

  static String routeName = 'HomePageMobile';
  static String routePath = '/homePageMobile';

  @override
  State<HomePageMobileWidget> createState() => _HomePageMobileWidgetState();
}

class _HomePageMobileWidgetState extends State<HomePageMobileWidget> {
  late HomePageMobileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageMobileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (isWeb) {
        if (!loggedIn) {
          await authManager.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EntryPageWidget(),
            ),
          );
        }
      } else {
        await requestPermission(notificationsPermission);
        if (FFAppState().newEvent != null) {
          FFAppState().newEvent = null;
          safeSetState(() {});
        }
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
        backgroundColor: Color(0xFFF5F5F5),
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 0.0,
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 185.0, 0.0, 70.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var eventsRecordReference =
                                              EventsRecord.collection.doc();
                                          await eventsRecordReference
                                              .set(createEventsRecordData(
                                            eventHospitalPlanner:
                                                currentUserDocument
                                                    ?.nYAUserHospital,
                                            eventUserPlanner:
                                                currentUserReference,
                                            createdTime: getCurrentTimestamp,
                                            updatedTime: getCurrentTimestamp,
                                            newNotifiaction: 0,
                                            timeRange:
                                                createChunkOrderRangeStruct(
                                              from: 1,
                                              to: 36,
                                              fromTime: '6:00',
                                              separator: '-',
                                              toTime: '00:00',
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            developerMode: false,
                                            eventState: 'underConstruction',
                                          ));
                                          _model.newEvent =
                                              EventsRecord.getDocumentFromData(
                                                  createEventsRecordData(
                                                    eventHospitalPlanner:
                                                        currentUserDocument
                                                            ?.nYAUserHospital,
                                                    eventUserPlanner:
                                                        currentUserReference,
                                                    createdTime:
                                                        getCurrentTimestamp,
                                                    updatedTime:
                                                        getCurrentTimestamp,
                                                    newNotifiaction: 0,
                                                    timeRange:
                                                        createChunkOrderRangeStruct(
                                                      from: 1,
                                                      to: 36,
                                                      fromTime: '6:00',
                                                      separator: '-',
                                                      toTime: '00:00',
                                                      clearUnsetFields: false,
                                                      create: true,
                                                    ),
                                                    developerMode: false,
                                                    eventState:
                                                        'underConstruction',
                                                  ),
                                                  eventsRecordReference);
                                          FFAppState().newEvent =
                                              _model.newEvent?.reference;
                                          FFAppState().NewEventOrderFrom = 1;
                                          FFAppState().NewEventOrderTo = 36;
                                          FFAppState().NewEventFromTimeRange =
                                              FirebaseFirestore.instance.doc(
                                                  '/TimeChunksChoices/4WGPN58crqtZcL6g7zMz');
                                          FFAppState().NewEventToTimeRange =
                                              FirebaseFirestore.instance.doc(
                                                  '/TimeChunksChoices/7AWa8v4PMK3bD85G6tet');
                                          FFAppState().update(() {});
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  S1EventNameWidget(),
                                            ),
                                          );

                                          safeSetState(() {});
                                        },
                                        text: 'Δημιουργία εξόρμηση',
                                        icon: Icon(
                                          Icons.add,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 95.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .ligthRed,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    StreamBuilder<
                                                        List<EventsRecord>>(
                                                  stream: queryEventsRecord(
                                                    queryBuilder:
                                                        (eventsRecord) =>
                                                            eventsRecord
                                                                .where(
                                                                  'eventState',
                                                                  isEqualTo:
                                                                      'underConstruction',
                                                                )
                                                                .where(
                                                                  'EventHospitalPlanner',
                                                                  isEqualTo:
                                                                      currentUserDocument
                                                                          ?.nYAUserHospital,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<EventsRecord>
                                                        containerEventsRecordList =
                                                        snapshot.data!;

                                                    return Material(
                                                      color: Colors.transparent,
                                                      elevation: 0.0,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .transparent,
                                                        ),
                                                        child: Visibility(
                                                          visible: containerEventsRecordList
                                                                  .where((e) =>
                                                                      e.eventState ==
                                                                      'underConstruction')
                                                                  .toList()
                                                                  .length !=
                                                              0,
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              Navigator.push(
                                                                context,
                                                                PageTransition(
                                                                  type: PageTransitionType
                                                                      .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  reverseDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              300),
                                                                  child:
                                                                      EventUnderConstructionWidget(),
                                                                ),
                                                              );
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 3.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0),
                                                              ),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    image: Image
                                                                        .asset(
                                                                      'assets/images/CreateEvent-67.png',
                                                                    ).image,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .transparent,
                                                                    width: 0.0,
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          8.0,
                                                                          5.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                        '${containerEventsRecordList.where((e) => e.eventState == 'underConstruction').toList().length.toString()} υπό δημιουργίας',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.roboto(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      )),
                                                                      Icon(
                                                                        Icons
                                                                            .arrow_forward,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
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
                              Builder(
                                builder: (context) {
                                  if (FFAppState().isActiveEventChip == true) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 25.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 25.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            'Ενεργές εξορμήσεις',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          )),
                                                        ),
                                                        if (FFAppState()
                                                                    .CurrentRegion !=
                                                                '')
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                'σε ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              )),
                                                              SelectionArea(
                                                                  child: Text(
                                                                FFAppState()
                                                                    .CurrentRegion,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (FFAppState()
                                                              .CurrentRegion !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
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
                                                          FFAppState()
                                                              .CurrentRegion = '';
                                                          FFAppState()
                                                              .update(() {});
                                                        },
                                                        child: Container(
                                                          width: 60.0,
                                                          height: 53.3,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .transparent,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    14.0),
                                                            child: Image.asset(
                                                              'assets/images/HD_Filter_Off-71.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            AuthUserStreamWidget(
                                              builder: (context) =>
                                                  StreamBuilder<
                                                      List<EventsRecord>>(
                                                stream: queryEventsRecord(
                                                  queryBuilder:
                                                      (eventsRecord) =>
                                                          eventsRecord
                                                              .where(
                                                                'eventState',
                                                                isEqualTo:
                                                                    'active',
                                                              )
                                                              .where(
                                                                'DeveloperMode',
                                                                isEqualTo:
                                                                    false,
                                                              )
                                                              .where(
                                                                'EventDate',
                                                                isGreaterThanOrEqualTo:
                                                                    functions
                                                                        .getTodayDate(),
                                                              )
                                                              .where(
                                                                'EventHospitalPlanner',
                                                                isEqualTo:
                                                                    currentUserDocument
                                                                        ?.nYAUserHospital,
                                                              ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 24.0,
                                                        height: 24.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<EventsRecord>
                                                      activeEventEventsRecordList =
                                                      snapshot.data!;

                                                  return AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.easeIn,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .transparent,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final events = activeEventEventsRecordList
                                                            .map((e) => e)
                                                            .toList()
                                                            .where((e) => FFAppState()
                                                                            .CurrentRegion !=
                                                                        ''
                                                                ? (e.address
                                                                        .region ==
                                                                    FFAppState()
                                                                        .CurrentRegion)
                                                                : true)
                                                            .toList();
                                                        if (events.isEmpty) {
                                                          return Center(
                                                            child:
                                                                NoEventsWidget(),
                                                          );
                                                        }

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children:
                                                              List.generate(
                                                                  events.length,
                                                                  (eventsIndex) {
                                                            final eventsItem =
                                                                events[
                                                                    eventsIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                        .newEvent =
                                                                    eventsItem
                                                                        .reference;
                                                                FFAppState()
                                                                        .toComplete =
                                                                    false;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            25.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            BloodAppointmentRecord>>(
                                                                      stream:
                                                                          queryBloodAppointmentRecord(
                                                                        queryBuilder:
                                                                            (bloodAppointmentRecord) =>
                                                                                bloodAppointmentRecord.where(
                                                                          'RelatedEvent',
                                                                          isEqualTo:
                                                                              eventsItem.reference,
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<BloodAppointmentRecord>
                                                                            eventCardBloodAppointmentRecordList =
                                                                            snapshot.data!;

                                                                        return Container(
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                double.infinity,
                                                                            maxHeight:
                                                                                double.infinity,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.fill,
                                                                              image: CachedNetworkImageProvider(
                                                                                '',
                                                                              ),
                                                                            ),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 8.0,
                                                                                color: Color(0x335A5A5A),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  2.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(25.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0x33F79E8F),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: CachedNetworkImage(
                                                                                        fadeInDuration: Duration(milliseconds: 500),
                                                                                        fadeOutDuration: Duration(milliseconds: 500),
                                                                                        imageUrl: 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/51y2498f5q1o/Dinoume_Aima_App_LOGO.png',
                                                                                        width: 55.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    eventsItem.nameOfEvent,
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                          font: GoogleFonts.roboto(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).displaySmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 18.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).displaySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                        child: StreamBuilder<UsersRecord>(
                                                                                                          stream: UsersRecord.getDocument(eventsItem.eventUserPlanner!),
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

                                                                                                            return Text(
                                                                                                              'Δημιουργός: ${creatorUsersRecord.displayName}',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.roboto(
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    fontSize: 13.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ),
                                                                                                      Builder(
                                                                                                        builder: (context) {
                                                                                                          if (eventsItem.bloodAppointmentList.length == eventsItem.seatsMax) {
                                                                                                            return Container(
                                                                                                              height: 28.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF22DD00),
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                              child: Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
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
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          } else {
                                                                                                            return Container(
                                                                                                              height: 28.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFFFFA13F),
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                              child: Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    'Διαθέσιμο',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          font: GoogleFonts.roboto(
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          fontSize: 12.0,
                                                                                                                          letterSpacing: 1.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                        },
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-hospitals-1whx4e/assets/npwgjr1nz51f/Chunk_LD.png',
                                                                                                      height: 26.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                          child: Text(
                                                                                                            'Ημερομηνία',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.roboto(
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          dateTimeFormat(
                                                                                                            "d/M/y",
                                                                                                            eventsItem.eventDate!,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.roboto(
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Image.asset(
                                                                                                    'assets/images/gynecology.png',
                                                                                                    height: 24.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                          child: Text(
                                                                                                            'Διαθεσιμότητα',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.roboto(
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          '${valueOrDefault<String>(
                                                                                                            (eventCardBloodAppointmentRecordList.unique((e) => e.parentReference).where((e) => (e.appointmentState == 'pending') || (e.appointmentState == 'completed')).toList().length +
                                                                                                                    valueOrDefault<int>(
                                                                                                                      eventCardBloodAppointmentRecordList.unique((e) => e.parentReference).where((e) => (e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, 15)! >= getCurrentTimestamp)).toList().length,
                                                                                                                      0,
                                                                                                                    ))
                                                                                                                .toString(),
                                                                                                            '0',
                                                                                                          )}/${eventsItem.seatsMax.toString()} θέσεις',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.roboto(
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: Color(0xFF282828),
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
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
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }),
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
                                    );
                                  } else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 25.0, 0.0, 25.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 25.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        2.0),
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              'Aνενεργές εξορμήσεις',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .roboto(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            )),
                                                          ),
                                                          if (FFAppState()
                                                                      .CurrentRegion !=
                                                                  '')
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                SelectionArea(
                                                                    child: Text(
                                                                  'σε ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .roboto(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            20.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                )),
                                                                SelectionArea(
                                                                    child: Text(
                                                                  FFAppState()
                                                                      .CurrentRegion,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .roboto(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            20.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                )),
                                                              ],
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                                .CurrentRegion !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                .CurrentRegion = '';
                                                            FFAppState()
                                                                .update(() {});
                                                          },
                                                          child: Container(
                                                            width: 60.0,
                                                            height: 53.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .transparent,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          14.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/HD_Filter_Off-71.png',
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) =>
                                                    StreamBuilder<
                                                        List<EventsRecord>>(
                                                  stream: queryEventsRecord(
                                                    queryBuilder:
                                                        (eventsRecord) =>
                                                            eventsRecord
                                                                .where(
                                                                  'eventState',
                                                                  isEqualTo:
                                                                      'inactive',
                                                                )
                                                                .where(
                                                                  'EventHospitalPlanner',
                                                                  isEqualTo:
                                                                      currentUserDocument
                                                                          ?.nYAUserHospital,
                                                                )
                                                                .where(
                                                                  'EventDate',
                                                                  isGreaterThanOrEqualTo:
                                                                      functions
                                                                          .getTodayDate(),
                                                                )
                                                                .where(
                                                                  'DeveloperMode',
                                                                  isEqualTo:
                                                                      false,
                                                                )
                                                                .orderBy(
                                                                    'EventDate'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<EventsRecord>
                                                        inactiveEventsEventsRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .transparent,
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final inactiveEvents =
                                                              inactiveEventsEventsRecordList
                                                                  .where((e) =>
                                                                      e.eventState ==
                                                                      'inactive')
                                                                  .toList();
                                                          if (inactiveEvents
                                                              .isEmpty) {
                                                            return Center(
                                                              child:
                                                                  NoEventsWidget(),
                                                            );
                                                          }

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                inactiveEvents
                                                                    .length,
                                                                (inactiveEventsIndex) {
                                                              final inactiveEventsItem =
                                                                  inactiveEvents[
                                                                      inactiveEventsIndex];
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  FFAppState()
                                                                          .newEvent =
                                                                      inactiveEventsItem
                                                                          .reference;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .bottomToTop,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              500),
                                                                      reverseDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      child:
                                                                          EventDetailsWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Stack(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          35.0,
                                                                          15.0,
                                                                          25.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              BloodAppointmentRecord>>(
                                                                        stream:
                                                                            queryBloodAppointmentRecord(
                                                                          queryBuilder: (bloodAppointmentRecord) =>
                                                                              bloodAppointmentRecord.where(
                                                                            'RelatedEvent',
                                                                            isEqualTo:
                                                                                inactiveEventsItem.reference,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<BloodAppointmentRecord>
                                                                              eventCardBloodAppointmentRecordList =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: double.infinity,
                                                                              maxHeight: double.infinity,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.fill,
                                                                                image: CachedNetworkImageProvider(
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-hospitals-1whx4e/assets/xdztcjz1ydst/poster-1.png',
                                                                                ),
                                                                              ),
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 15.0,
                                                                                  color: Color(0x33000000),
                                                                                  offset: Offset(
                                                                                    0.0,
                                                                                    2.0,
                                                                                  ),
                                                                                  spreadRadius: 10.0,
                                                                                )
                                                                              ],
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                  FlutterFlowTheme.of(context).secondary
                                                                                ],
                                                                                stops: [
                                                                                  0.0,
                                                                                  1.0
                                                                                ],
                                                                                begin: AlignmentDirectional(0.0, -1.0),
                                                                                end: AlignmentDirectional(0, 1.0),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                            ),
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 15.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        inactiveEventsItem.nameOfEvent,
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
                                                                                        stream: UsersRecord.getDocument(inactiveEventsItem.eventUserPlanner!),
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
                                                                                                inactiveEventsItem.eventDate!,
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
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Image.asset(
                                                                                                  'assets/images/EventsSeats-67.png',
                                                                                                  height: 30.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: SelectionArea(
                                                                                                      child: Text(
                                                                                                    '${valueOrDefault<String>(
                                                                                                      (eventCardBloodAppointmentRecordList.unique((e) => e.parentReference).where((e) => (e.appointmentState == 'pending') || (e.appointmentState == 'completed')).toList().length + eventCardBloodAppointmentRecordList.where((e) => (e.relatedEvent == inactiveEventsItem.reference) && (e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, 30)! >= getCurrentTimestamp)).toList().length).toString(),
                                                                                                      '0',
                                                                                                    )}/${inactiveEventsItem.seatsMax.toString()} θέσεις',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.roboto(
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  )),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      if (inactiveEventsItem.seatsMax == inactiveEventsItem.bloodAppointmentList.length)
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          32.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/a17u2c6auola/Icons-10.png',
                                                                        width:
                                                                            75.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }),
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
                                        if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.isDeveloper,
                                                false) ==
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 100.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 25.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            2.0),
                                                                child:
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                  'Developer εξορμήσεις',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .roboto(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            20.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<EventsRecord>>(
                                                    stream: queryEventsRecord(
                                                      queryBuilder:
                                                          (eventsRecord) =>
                                                              eventsRecord
                                                                  .where(
                                                                    'DeveloperMode',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .orderBy(
                                                                      'EventDate',
                                                                      descending:
                                                                          true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .transparent,
                                                        ),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final event =
                                                                containerEventsRecordList
                                                                    .toList();

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  event.length,
                                                                  (eventIndex) {
                                                                final eventItem =
                                                                    event[
                                                                        eventIndex];
                                                                return Visibility(
                                                                  visible: functions.showSearchResult(
                                                                      FFAppState()
                                                                          .CurrentRegion,
                                                                      eventItem
                                                                          .address
                                                                          .region),
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            35.0,
                                                                            15.0,
                                                                            25.0),
                                                                        child: StreamBuilder<
                                                                            List<BloodAppointmentRecord>>(
                                                                          stream:
                                                                              queryBloodAppointmentRecord(
                                                                            queryBuilder: (bloodAppointmentRecord) =>
                                                                                bloodAppointmentRecord.where(
                                                                              'RelatedEvent',
                                                                              isEqualTo: eventItem.reference,
                                                                            ),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<BloodAppointmentRecord>
                                                                                eventCardBloodAppointmentRecordList =
                                                                                snapshot.data!;

                                                                            return InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                FFAppState().newEvent = eventItem.reference;
                                                                                FFAppState().update(() {});
                                                                                Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.bottomToTop,
                                                                                    duration: Duration(milliseconds: 500),
                                                                                    reverseDuration: Duration(milliseconds: 500),
                                                                                    child: EventDetailsWidget(),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: double.infinity,
                                                                                  maxHeight: double.infinity,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.fill,
                                                                                    image: CachedNetworkImageProvider(
                                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-hospitals-1whx4e/assets/xdztcjz1ydst/poster-1.png',
                                                                                    ),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 15.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        2.0,
                                                                                      ),
                                                                                      spreadRadius: 10.0,
                                                                                    )
                                                                                  ],
                                                                                  gradient: LinearGradient(
                                                                                    colors: [
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                      FlutterFlowTheme.of(context).secondary
                                                                                    ],
                                                                                    stops: [
                                                                                      0.0,
                                                                                      1.0
                                                                                    ],
                                                                                    begin: AlignmentDirectional(0.0, -1.0),
                                                                                    end: AlignmentDirectional(0, 1.0),
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                ),
                                                                                child: Stack(
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 15.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            eventItem.nameOfEvent,
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
                                                                                            stream: UsersRecord.getDocument(eventItem.eventUserPlanner!),
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
                                                                                                    eventItem.eventDate!,
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
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Image.asset(
                                                                                                      'assets/images/EventsSeats-67.png',
                                                                                                      height: 30.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: SelectionArea(
                                                                                                          child: Text(
                                                                                                        '${valueOrDefault<String>(
                                                                                                          (eventCardBloodAppointmentRecordList.unique((e) => e.parentReference).where((e) => (e.appointmentState == 'pending') || (e.appointmentState == 'completed')).toList().length +
                                                                                                                  valueOrDefault<int>(
                                                                                                                    eventCardBloodAppointmentRecordList.unique((e) => e.parentReference).where((e) => (e.appointmentState == 'underCreation') && (functions.addTime(e.createdTime, 0, 30)! >= getCurrentTimestamp)).toList().length,
                                                                                                                    0,
                                                                                                                  ))
                                                                                                              .toString(),
                                                                                                          '0',
                                                                                                        )}/${eventItem.seatsMax.toString()} θέσεις',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.roboto(
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            32.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/a17u2c6auola/Icons-10.png',
                                                                          width:
                                                                              75.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 180.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 45.0, 20.0, 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: StreamBuilder<List<EventsRecord>>(
                                  stream: queryEventsRecord(
                                    singleRecord: true,
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
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<EventsRecord> textEventsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final textEventsRecord =
                                        textEventsRecordList.isNotEmpty
                                            ? textEventsRecordList.first
                                            : null;

                                    return Text(
                                      'Αιμοδοσίες',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.chipModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ChipWidget(),
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Color(0x4D000000),
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
                              backOneColor: Color(0x33FF7E67),
                              iconTwoColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              backTwoColor:
                                  FlutterFlowTheme.of(context).transparent,
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
      ),
    );
  }
}
