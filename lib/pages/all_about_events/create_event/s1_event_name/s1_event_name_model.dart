import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 's1_event_name_widget.dart' show S1EventNameWidget;
import 'package:flutter/material.dart';

class S1EventNameModel extends FlutterFlowModel<S1EventNameWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
