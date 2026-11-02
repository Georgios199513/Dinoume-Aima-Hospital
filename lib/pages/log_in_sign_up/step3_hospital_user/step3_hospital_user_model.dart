import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'step3_hospital_user_widget.dart' show Step3HospitalUserWidget;
import 'package:flutter/material.dart';

class Step3HospitalUserModel extends FlutterFlowModel<Step3HospitalUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Password widget.
  late FocusNode passwordPasswordVisibilityFocusNode;
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordPasswordVisibilityFocusNode = FocusNode();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
    passwordPasswordVisibilityFocusNode.dispose();
  }
}
