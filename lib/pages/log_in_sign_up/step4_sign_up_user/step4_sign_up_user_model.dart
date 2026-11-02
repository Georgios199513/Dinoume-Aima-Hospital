import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'step4_sign_up_user_widget.dart' show Step4SignUpUserWidget;
import 'package:flutter/material.dart';

class Step4SignUpUserModel extends FlutterFlowModel<Step4SignUpUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Password widget.
  late FocusNode passwordPasswordVisibilityFocusNode;
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Custom Action - authFlutterFire] action in ActiveNext widget.
  String? login;

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
