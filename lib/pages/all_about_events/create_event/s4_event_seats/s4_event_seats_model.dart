import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 's4_event_seats_widget.dart' show S4EventSeatsWidget;
import 'package:flutter/material.dart';

class S4EventSeatsModel extends FlutterFlowModel<S4EventSeatsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Seats widget.
  FocusNode? seatsFocusNode;
  TextEditingController? seatsTextController;
  String? Function(BuildContext, String?)? seatsTextControllerValidator;
  String? _seatsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Απαιτούμενο πεδίο.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    seatsTextControllerValidator = _seatsTextControllerValidator;
  }

  @override
  void dispose() {
    seatsFocusNode?.dispose();
    seatsTextController?.dispose();
  }
}
