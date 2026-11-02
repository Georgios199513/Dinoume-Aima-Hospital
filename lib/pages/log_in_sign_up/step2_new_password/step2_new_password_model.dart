import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'step2_new_password_widget.dart' show Step2NewPasswordWidget;
import 'package:flutter/material.dart';

class Step2NewPasswordModel extends FlutterFlowModel<Step2NewPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NewPassword widget.
  late FocusNode newPasswordPasswordVisibilityFocusNode;
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // State field(s) for VerifyPassword widget.
  late FocusNode verifyPasswordPasswordVisibilityFocusNode;
  FocusNode? verifyPasswordFocusNode;
  TextEditingController? verifyPasswordTextController;
  late bool verifyPasswordVisibility;
  String? Function(BuildContext, String?)?
      verifyPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    newPasswordPasswordVisibilityFocusNode = FocusNode();
    newPasswordVisibility = false;
    verifyPasswordPasswordVisibilityFocusNode = FocusNode();
    verifyPasswordVisibility = false;
  }

  @override
  void dispose() {
    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();
    newPasswordPasswordVisibilityFocusNode.dispose();
    verifyPasswordFocusNode?.dispose();
    verifyPasswordTextController?.dispose();
    verifyPasswordPasswordVisibilityFocusNode.dispose();
  }
}
