import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'step2_temp_password_widget.dart' show Step2TempPasswordWidget;
import 'package:flutter/material.dart';

class Step2TempPasswordModel extends FlutterFlowModel<Step2TempPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Password widget.
  late FocusNode passwordPasswordVisibilityFocusNode;
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Απαιτούμενο πεδίο';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Send Verification Code)] action in Button widget.
  ApiCallResponse? apiResultwzw;

  @override
  void initState(BuildContext context) {
    passwordPasswordVisibilityFocusNode = FocusNode();
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
    passwordPasswordVisibilityFocusNode.dispose();
  }
}
