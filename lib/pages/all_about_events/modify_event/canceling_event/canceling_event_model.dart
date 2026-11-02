import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'canceling_event_widget.dart' show CancelingEventWidget;
import 'package:flutter/material.dart';

class CancelingEventModel extends FlutterFlowModel<CancelingEventWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CancelingEvent widget.
  EventsRecord? deletingEvent;
  // Stores action output result for [Backend Call - Read Document] action in CancelingEvent widget.
  BloodAppointmentRecord? appointment;
  // Stores action output result for [Backend Call - Read Document] action in CancelingEvent widget.
  UsersRecord? user;
  // Stores action output result for [Backend Call - Read Document] action in CancelingEvent widget.
  TimeChunksChoicesRecord? bloodAppointmentTime;
  // Stores action output result for [Firestore Query - Query a collection] action in CancelingEvent widget.
  TextsRecord? textsNotification;
  // Stores action output result for [Backend Call - API (Send Appointment Modification)] action in CancelingEvent widget.
  ApiCallResponse? apiResult1wq;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
