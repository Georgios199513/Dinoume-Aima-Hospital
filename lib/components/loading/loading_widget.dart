import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/all_about_events/create_event/s1_event_name/s1_event_name_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_model.dart';
export 'loading_model.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  late LoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var eventsRecordReference = EventsRecord.collection.doc();
      await eventsRecordReference.set(createEventsRecordData(
        eventHospitalPlanner: currentUserDocument?.nYAUserHospital,
        eventUserPlanner: currentUserReference,
        createdTime: getCurrentTimestamp,
        updatedTime: getCurrentTimestamp,
        newNotifiaction: 0,
        timeRange: createChunkOrderRangeStruct(
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
      _model.newEvent = EventsRecord.getDocumentFromData(
          createEventsRecordData(
            eventHospitalPlanner: currentUserDocument?.nYAUserHospital,
            eventUserPlanner: currentUserReference,
            createdTime: getCurrentTimestamp,
            updatedTime: getCurrentTimestamp,
            newNotifiaction: 0,
            timeRange: createChunkOrderRangeStruct(
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
          ),
          eventsRecordReference);
      FFAppState().newEvent = _model.newEvent?.reference;
      FFAppState().NewEventOrderFrom = 1;
      FFAppState().NewEventOrderTo = 36;
      FFAppState().NewEventFromTimeRange = FirebaseFirestore.instance
          .doc('/TimeChunksChoices/4WGPN58crqtZcL6g7zMz');
      FFAppState().NewEventToTimeRange = FirebaseFirestore.instance
          .doc('/TimeChunksChoices/7AWa8v4PMK3bD85G6tet');
      FFAppState().update(() {});
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => S1EventNameWidget(),
        ),
      );
    });

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
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
        child: StreamBuilder<List<UsersRecord>>(
          stream: queryUsersRecord(
            queryBuilder: (usersRecord) => usersRecord.whereIn(
                'uid', FFAppState().userList.map((e) => e.id).toList()),
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
            List<UsersRecord> containerUsersRecordList = snapshot.data!;

            return Material(
              color: Colors.transparent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                width: 150.0,
                height: 150.0,
                constraints: BoxConstraints(
                  maxWidth: 500.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 25.0, 15.0, 25.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          width: 183.4,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Lottie.network(
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/080bxiw3xknk/DinoumeAimaLogo.json',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
