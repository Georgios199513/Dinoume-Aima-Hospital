import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modify_chunks_copy_model.dart';
export 'modify_chunks_copy_model.dart';

class ModifyChunksCopyWidget extends StatefulWidget {
  const ModifyChunksCopyWidget({
    super.key,
    this.newEvent,
  });

  final DocumentReference? newEvent;

  static String routeName = 'ModifyChunksCopy';
  static String routePath = '/modifyChunksCopy';

  @override
  State<ModifyChunksCopyWidget> createState() => _ModifyChunksCopyWidgetState();
}

class _ModifyChunksCopyWidgetState extends State<ModifyChunksCopyWidget> {
  late ModifyChunksCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModifyChunksCopyModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondary,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/back__02_min.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 25.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Icon(
                              Icons.chevron_left,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              size: 30.0,
                            ),
                          ),
                          Text(
                            'Επεξεργασία ωραρίου',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 50.0),
                    child: StreamBuilder<EventsRecord>(
                      stream: EventsRecord.getDocument(FFAppState().newEvent!),
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

                        final cardEventsRecord = snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 25.0, 20.0, 25.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectionArea(
                                        child: Text(
                                      'Επιλεγμένα ωράρια',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    )),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: StreamBuilder<
                                          List<TimeChunksChoicesRecord>>(
                                        stream: queryTimeChunksChoicesRecord(
                                          queryBuilder: (timeChunksChoicesRecord) =>
                                              timeChunksChoicesRecord
                                                  .where(
                                                    'Order',
                                                    isGreaterThanOrEqualTo:
                                                        cardEventsRecord
                                                            .timeRange.from,
                                                  )
                                                  .where(
                                                    'Order',
                                                    isLessThanOrEqualTo:
                                                        cardEventsRecord
                                                            .timeRange.to,
                                                  )
                                                  .whereNotIn(
                                                      'Order',
                                                      cardEventsRecord
                                                          .timeSlotOrderToRemove),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<TimeChunksChoicesRecord>
                                              numberSelectedChunksTimeChunksChoicesRecordList =
                                              snapshot.data!;

                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Container(
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF2EA523),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .transparent,
                                                  width: 0.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 5.0, 5.0, 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: SelectionArea(
                                                          child: Text(
                                                        '${formatNumber(
                                                          numberSelectedChunksTimeChunksChoicesRecordList
                                                              .length,
                                                          formatType: FormatType
                                                              .decimal,
                                                        )} ωράρια',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      25.0,
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 100.0,
                                        constraints: BoxConstraints(
                                          maxHeight: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: StreamBuilder<
                                            List<TimeChunksChoicesRecord>>(
                                          stream: queryTimeChunksChoicesRecord(
                                            queryBuilder:
                                                (timeChunksChoicesRecord) =>
                                                    timeChunksChoicesRecord
                                                        .where(
                                                          'Order',
                                                          isGreaterThanOrEqualTo:
                                                              cardEventsRecord
                                                                  .timeRange
                                                                  .from,
                                                        )
                                                        .where(
                                                          'Order',
                                                          isLessThanOrEqualTo:
                                                              cardEventsRecord
                                                                  .timeRange.to,
                                                        )
                                                        .whereNotIn(
                                                            'Order',
                                                            cardEventsRecord
                                                                .timeSlotOrderToRemove),
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
                                            List<TimeChunksChoicesRecord>
                                                gridViewTimeChunksChoicesRecordList =
                                                snapshot.data!;

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 15.0,
                                                mainAxisSpacing: 15.0,
                                                childAspectRatio: 3.0,
                                              ),
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  gridViewTimeChunksChoicesRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, gridViewIndex) {
                                                final gridViewTimeChunksChoicesRecord =
                                                    gridViewTimeChunksChoicesRecordList[
                                                        gridViewIndex];
                                                return Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2EA523),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              gridViewTimeChunksChoicesRecord
                                                                  .timeChunks
                                                                  .from,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                    color: Color(
                                                                        0xFF2EA523),
                                                                    fontSize:
                                                                        18.0,
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
                                                          InkWell(
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
                                                              await cardEventsRecord
                                                                  .reference
                                                                  .update({
                                                                ...createEventsRecordData(
                                                                  updatedTime:
                                                                      getCurrentTimestamp,
                                                                  seatsMax: functions.totalSeatsEvent(
                                                                      cardEventsRecord
                                                                          .seatsTotalPerTimeChunk,
                                                                      functions.numberBetween2TimeChunks(
                                                                          cardEventsRecord
                                                                              .timeRange
                                                                              .from,
                                                                          cardEventsRecord
                                                                              .timeRange
                                                                              .to,
                                                                          cardEventsRecord
                                                                              .timeSlotToRemove
                                                                              .length)),
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'TimeSlotToRemove':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      gridViewTimeChunksChoicesRecord
                                                                          .reference
                                                                    ]),
                                                                    'TimeSlotOrderToRemove':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      gridViewTimeChunksChoicesRecord
                                                                          .order
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.cancel,
                                                              color: Color(
                                                                  0xFF2EA523),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SelectionArea(
                                          child: Text(
                                        'Διαγραφέντα ωράρια',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      )),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .transparent,
                                                width: 0.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 5.0, 5.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      '${cardEventsRecord.timeSlotToRemove.length.toString()} ωράρια',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 25.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 25.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 100.0,
                                          constraints: BoxConstraints(
                                            maxHeight:
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: StreamBuilder<
                                              List<TimeChunksChoicesRecord>>(
                                            stream:
                                                queryTimeChunksChoicesRecord(
                                              queryBuilder:
                                                  (timeChunksChoicesRecord) =>
                                                      timeChunksChoicesRecord
                                                          .whereIn(
                                                              'Order',
                                                              cardEventsRecord
                                                                  .timeSlotOrderToRemove),
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
                                              List<TimeChunksChoicesRecord>
                                                  gridViewTimeChunksChoicesRecordList =
                                                  snapshot.data!;

                                              return GridView.builder(
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 15.0,
                                                  mainAxisSpacing: 15.0,
                                                  childAspectRatio: 3.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    gridViewTimeChunksChoicesRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, gridViewIndex) {
                                                  final gridViewTimeChunksChoicesRecord =
                                                      gridViewTimeChunksChoicesRecordList[
                                                          gridViewIndex];
                                                  return Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                gridViewTimeChunksChoicesRecord
                                                                    .timeChunks
                                                                    .from,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
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
                                                                          18.0,
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
                                                            InkWell(
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
                                                                await cardEventsRecord
                                                                    .reference
                                                                    .update({
                                                                  ...createEventsRecordData(
                                                                    updatedTime:
                                                                        getCurrentTimestamp,
                                                                    seatsMax: functions.totalSeatsEvent(
                                                                        cardEventsRecord
                                                                            .seatsTotalPerTimeChunk,
                                                                        functions.numberBetween2TimeChunks(
                                                                            cardEventsRecord.timeRange.from,
                                                                            cardEventsRecord.timeRange.to,
                                                                            cardEventsRecord.timeSlotToRemove.length)),
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'TimeSlotToRemove':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        gridViewTimeChunksChoicesRecord
                                                                            .reference
                                                                      ]),
                                                                      'TimeSlotOrderToRemove':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        gridViewTimeChunksChoicesRecord
                                                                            .order
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .add_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
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
                        );
                      },
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
