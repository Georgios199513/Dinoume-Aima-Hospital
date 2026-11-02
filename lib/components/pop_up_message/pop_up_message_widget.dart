import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/developer_mode/developer_mode_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pop_up_message_model.dart';
export 'pop_up_message_model.dart';

class PopUpMessageWidget extends StatefulWidget {
  const PopUpMessageWidget({
    super.key,
    this.message,
    this.button1Text,
    this.button2Text,
    this.button1IconVisibility,
    this.button2IconVisibility,
    this.actionName,
    this.newEvent,
    this.selectedEvent,
    this.currentUserAppointment,
    this.description,
    this.currentBloodAppointment,
  });

  final String? message;
  final String? button1Text;
  final String? button2Text;
  final Widget? button1IconVisibility;
  final Widget? button2IconVisibility;
  final String? actionName;
  final DocumentReference? newEvent;
  final EventsRecord? selectedEvent;
  final DocumentReference? currentUserAppointment;
  final String? description;
  final DocumentReference? currentBloodAppointment;

  @override
  State<PopUpMessageWidget> createState() => _PopUpMessageWidgetState();
}

class _PopUpMessageWidgetState extends State<PopUpMessageWidget> {
  late PopUpMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpMessageModel());

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
                width: double.infinity,
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Text(
                          widget.message!,
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      if (widget.description != null &&
                          widget.description != '')
                        Text(
                          widget.description!,
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (widget.button1Text != null &&
                                widget.button1Text != '')
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      if (widget.actionName ==
                                          'saveForLater') {
                                        _model.eventUnderCreation =
                                            await EventsRecord.getDocumentOnce(
                                                widget.newEvent!);
                                        _shouldSetState = true;

                                        await FFAppState()
                                            .newEvent!
                                            .update(createEventsRecordData(
                                              eventHospitalPlanner:
                                                  currentUserDocument
                                                      ?.nYAUserHospital,
                                              nameOfEvent: _model
                                                              .eventUnderCreation
                                                              ?.nameOfEvent ==
                                                          null ||
                                                      _model.eventUnderCreation
                                                              ?.nameOfEvent ==
                                                          ''
                                                  ? ''
                                                  : _model.eventUnderCreation
                                                      ?.nameOfEvent,
                                              eventState: 'underConstruction',
                                            ));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomePageMobileWidget(),
                                          ),
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        if (widget.actionName ==
                                            'activateEvent') {
                                          await widget.newEvent!
                                              .update(createEventsRecordData(
                                            eventState: 'active',
                                          ));
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePageMobileWidget(),
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          if (widget.actionName ==
                                              'newAccountSkipEdit') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePageMobileWidget(),
                                              ),
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            if (widget.actionName ==
                                                'logOut') {
                                              await authManager.signOut();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Step1ChooseNYAWidget(),
                                                ),
                                              );
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              if (widget.actionName ==
                                                  'deleteEvent') {
                                                FFAppState().totalUpdateAmount =
                                                    widget
                                                        .selectedEvent!
                                                        .bloodAppointmentList
                                                        .length;
                                                FFAppState()
                                                        .BloodAppointmentsToComplete =
                                                    widget.selectedEvent!
                                                        .bloodAppointmentList
                                                        .toList()
                                                        .cast<
                                                            DocumentReference>();
                                                FFAppState().newEvent = widget
                                                    .selectedEvent?.reference;
                                                safeSetState(() {});
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CancelingEventWidget(
                                                      fieldToModify:
                                                          'deleteEvent',
                                                    ),
                                                  ),
                                                );
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              } else {
                                                if (widget.actionName ==
                                                    'deleteAppointment') {
                                                  _model.texts =
                                                      await queryTextsRecordOnce();
                                                  _shouldSetState = true;
                                                  _model.currentUserAppointment =
                                                      await UsersRecord
                                                          .getDocumentOnce(widget
                                                              .currentUserAppointment!);
                                                  _shouldSetState = true;

                                                  await FFAppState()
                                                      .newEvent!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'UsersParticipated':
                                                            FieldValue
                                                                .arrayRemove([
                                                          widget
                                                              .currentUserAppointment
                                                        ]),
                                                        'bloodAppointmentList':
                                                            FieldValue
                                                                .arrayRemove([
                                                          widget
                                                              .currentBloodAppointment
                                                        ]),
                                                        'UsersParticipatedEmailsList':
                                                            FieldValue
                                                                .arrayRemove([
                                                          _model
                                                              .currentUserAppointment
                                                              ?.email
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  _model.correspondingEvent =
                                                      await EventsRecord
                                                          .getDocumentOnce(
                                                              widget
                                                                  .newEvent!);
                                                  _shouldSetState = true;
                                                  _model.currentAppointment =
                                                      await BloodAppointmentRecord
                                                          .getDocumentOnce(widget
                                                              .currentBloodAppointment!);
                                                  _shouldSetState = true;
                                                  _model.currentAppointmentTimechunk =
                                                      await TimeChunksChoicesRecord
                                                          .getDocumentOnce(_model
                                                              .currentAppointment!
                                                              .timeOfAppointment!);
                                                  _shouldSetState = true;
                                                  _model.deleteNotif = await actions
                                                      .deleteScheduledPushNotification(
                                                    _model
                                                        .currentUserAppointment
                                                        ?.reference,
                                                    functions.substructTime(
                                                        _model
                                                            .correspondingEvent
                                                            ?.eventDate,
                                                        0,
                                                        0,
                                                        0,
                                                        1),
                                                  );
                                                  _shouldSetState = true;
                                                  await CancelScheduledEmailCall
                                                      .call(
                                                    id: _model
                                                        .currentAppointment
                                                        ?.abracadaloScheduledEmailId,
                                                  );

                                                  await SendAppointmentCancellationCall
                                                      .call(
                                                    to: _model
                                                        .currentUserAppointment
                                                        ?.email,
                                                    subject: _model.texts
                                                        ?.where((e) =>
                                                            e.tags ==
                                                            'cancelAppointment')
                                                        .toList()
                                                        .firstOrNull
                                                        ?.title,
                                                    textBody: _model.texts
                                                        ?.where((e) =>
                                                            e.tags ==
                                                            'cancelAppointment')
                                                        .toList()
                                                        .firstOrNull
                                                        ?.text,
                                                    nameEvent: _model
                                                        .correspondingEvent
                                                        ?.nameOfEvent,
                                                    addressEvent:
                                                        '${_model.correspondingEvent?.address.streetAndNumber}, ${_model.correspondingEvent?.address.city} ${_model.correspondingEvent?.address.postalCode}',
                                                    dateEvent: dateTimeFormat(
                                                      "d/M/y",
                                                      _model.correspondingEvent
                                                          ?.eventDate,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    timeEvent: _model
                                                        .currentAppointmentTimechunk
                                                        ?.timeChunks
                                                        .from,
                                                  );

                                                  _model.numberOfBloodAppointments =
                                                      await queryBloodAppointmentRecordCount(
                                                    parent: _model
                                                        .currentUserAppointment
                                                        ?.reference,
                                                  );
                                                  _shouldSetState = true;

                                                  await widget
                                                      .currentUserAppointment!
                                                      .update({
                                                    ...createUsersRecordData(
                                                      inAppointment: _model
                                                                  .numberOfBloodAppointments! >
                                                              0
                                                          ? 'false'
                                                          : 'first_appointment',
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'eventsPaticipated':
                                                            FieldValue
                                                                .arrayRemove([
                                                          _model
                                                              .correspondingEvent
                                                              ?.reference
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await widget
                                                      .currentBloodAppointment!
                                                      .update(
                                                          createBloodAppointmentRecordData(
                                                    appointmentState:
                                                        'canceled',
                                                  ));

                                                  await _model
                                                      .correspondingEvent!
                                                      .eventHospitalPlanner!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'Donors': FieldValue
                                                            .arrayRemove([
                                                          _model
                                                              .currentUserAppointment
                                                              ?.reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          NewEditAppointmentsWidget(),
                                                    ),
                                                    (r) => false,
                                                  );
                                                } else {
                                                  if (widget.actionName ==
                                                      'verify') {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Step5VerifyEmailWidget(),
                                                      ),
                                                    );
                                                  } else {
                                                    Navigator.pop(context);
                                                  }
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                            }
                                          }
                                        }
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: widget.button1Text!,
                                    icon: widget.button1IconVisibility,
                                    options: FFButtonOptions(
                                      width: 130.0,
                                      height: 40.0,
                                      padding: EdgeInsets.all(0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                ),
                              ),
                            if (widget.button2Text != null &&
                                widget.button2Text != '')
                              Expanded(
                                flex: 1,
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (widget.actionName == 'saveForLater') {
                                      await FFAppState().newEvent!.delete();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomePageMobileWidget(),
                                        ),
                                      );
                                    } else {
                                      if (widget.actionName ==
                                          'activateEvent') {
                                        await widget.newEvent!
                                            .update(createEventsRecordData(
                                          eventState: 'inactive',
                                        ));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomePageMobileWidget(),
                                          ),
                                        );
                                      } else {
                                        Navigator.pop(context);
                                      }
                                    }
                                  },
                                  text: widget.button2Text!,
                                  icon: widget.button2IconVisibility,
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
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                ),
                              ),
                          ],
                        ),
                      ),
                      if ((valueOrDefault<bool>(
                                  currentUserDocument?.isDeveloper, false) ==
                              true) &&
                          (widget.actionName == 'activateEvent'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Divider(
                                  height: 5.0,
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: DeveloperModeWidget(),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    text: 'Δοκιμαστική αιμοδοσία',
                                    icon: Icon(
                                      Icons.science_outlined,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      padding: EdgeInsets.all(0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .transparent,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                                ),
                              ],
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
