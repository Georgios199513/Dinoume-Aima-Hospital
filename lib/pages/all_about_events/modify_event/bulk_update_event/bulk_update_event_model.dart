import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'bulk_update_event_widget.dart' show BulkUpdateEventWidget;
import 'package:flutter/material.dart';

class BulkUpdateEventModel extends FlutterFlowModel<BulkUpdateEventWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in BulkUpdateEvent widget.
  BloodAppointmentRecord? appointment;
  // Stores action output result for [Backend Call - Read Document] action in BulkUpdateEvent widget.
  UsersRecord? user;
  // Stores action output result for [Backend Call - Read Document] action in BulkUpdateEvent widget.
  EventsRecord? event;
  // Stores action output result for [Backend Call - Read Document] action in BulkUpdateEvent widget.
  TimeChunksChoicesRecord? timeOfAppointment;
  // Stores action output result for [Firestore Query - Query a collection] action in BulkUpdateEvent widget.
  TextsRecord? texts;
  // Stores action output result for [Backend Call - API (Send Appointment Modification)] action in BulkUpdateEvent widget.
  ApiCallResponse? emailSend;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
