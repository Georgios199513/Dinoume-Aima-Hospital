import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/all_about_events/create_event/s5_between_hours/s5_between_hours_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_time_range_model.dart';
export 'select_time_range_model.dart';

class SelectTimeRangeWidget extends StatefulWidget {
  const SelectTimeRangeWidget({
    super.key,
    this.title,
    this.newEvent,
    this.isFrom,
    this.isNew,
  });

  final String? title;
  final EventsRecord? newEvent;
  final bool? isFrom;
  final bool? isNew;

  @override
  State<SelectTimeRangeWidget> createState() => _SelectTimeRangeWidgetState();
}

class _SelectTimeRangeWidgetState extends State<SelectTimeRangeWidget> {
  late SelectTimeRangeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectTimeRangeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 25.0, 15.0, 25.0),
        child: Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 400.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 25.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
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
                          Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          SelectionArea(
                              child: Text(
                            widget.title!,
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
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
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
                    ),
                    if (widget.isFrom == true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: StreamBuilder<List<TimeChunksChoicesRecord>>(
                          stream: queryTimeChunksChoicesRecord(
                            queryBuilder: (timeChunksChoicesRecord) =>
                                timeChunksChoicesRecord
                                    .where(
                                      'Order',
                                      isLessThan: FFAppState().NewEventOrderTo,
                                    )
                                    .orderBy('Order'),
                          ),
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
                            List<TimeChunksChoicesRecord>
                                fromTimeChunksChoicesRecordList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: fromTimeChunksChoicesRecordList.length,
                              itemBuilder: (context, fromIndex) {
                                final fromTimeChunksChoicesRecord =
                                    fromTimeChunksChoicesRecordList[fromIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().NewEventFromTimeRange =
                                          fromTimeChunksChoicesRecord.reference;
                                      FFAppState().NewEventOrderFrom =
                                          fromTimeChunksChoicesRecord.order;
                                      FFAppState().update(() {});
                                      if (widget.isNew!) {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 300),
                                            reverseDuration:
                                                Duration(milliseconds: 300),
                                            child: S5BetweenHoursWidget(),
                                          ),
                                        );
                                      } else {
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: fromTimeChunksChoicesRecord
                                                    .reference ==
                                                FFAppState()
                                                    .NewEventFromTimeRange
                                            ? FlutterFlowTheme.of(context)
                                                .ligthRed
                                            : FlutterFlowTheme.of(context)
                                                .transparent,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: fromTimeChunksChoicesRecord
                                                      .reference ==
                                                  FFAppState()
                                                      .NewEventFromTimeRange
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 0.0, 15.0),
                                        child: Text(
                                          fromTimeChunksChoicesRecord
                                              .timeChunks.from,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Visibility(
                        visible: widget.isFrom == false,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: StreamBuilder<List<TimeChunksChoicesRecord>>(
                            stream: queryTimeChunksChoicesRecord(
                              queryBuilder: (timeChunksChoicesRecord) =>
                                  timeChunksChoicesRecord
                                      .where(
                                        'Order',
                                        isGreaterThan:
                                            FFAppState().NewEventOrderFrom,
                                      )
                                      .orderBy('Order'),
                            ),
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
                              List<TimeChunksChoicesRecord>
                                  toTimeChunksChoicesRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: toTimeChunksChoicesRecordList.length,
                                itemBuilder: (context, toIndex) {
                                  final toTimeChunksChoicesRecord =
                                      toTimeChunksChoicesRecordList[toIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().NewEventToTimeRange =
                                            toTimeChunksChoicesRecord.reference;
                                        FFAppState().NewEventOrderTo =
                                            toTimeChunksChoicesRecord.order;
                                        FFAppState().update(() {});
                                        if (widget.isNew!) {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              reverseDuration:
                                                  Duration(milliseconds: 300),
                                              child: S5BetweenHoursWidget(),
                                            ),
                                          );
                                        } else {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: toTimeChunksChoicesRecord
                                                      .reference ==
                                                  FFAppState()
                                                      .NewEventToTimeRange
                                              ? FlutterFlowTheme.of(context)
                                                  .ligthRed
                                              : FlutterFlowTheme.of(context)
                                                  .transparent,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: toTimeChunksChoicesRecord
                                                        .reference ==
                                                    FFAppState()
                                                        .NewEventToTimeRange
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 0.0, 15.0),
                                          child: Text(
                                            toTimeChunksChoicesRecord
                                                .timeChunks.from,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
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
                                                  fontSize: 18.0,
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
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
