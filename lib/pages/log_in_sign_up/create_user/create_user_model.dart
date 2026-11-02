import '/flutter_flow/flutter_flow_util.dart';
import 'create_user_widget.dart' show CreateUserWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateUserModel extends FlutterFlowModel<CreateUserWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Υποχρεωτικό πεδίο.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'παρακαλώ ελέγξτε την μορφή του email.';
    }
    return null;
  }

  // State field(s) for Password widget.
  late FocusNode passwordPasswordVisibilityFocusNode;
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Υποχρεωτικό πεδίο.';
    }

    return null;
  }

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Υποχρεωτικό πεδίο.';
    }

    return null;
  }

  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  late MaskTextInputFormatter phoneNumberMask;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // Stores action output result for [Custom Action - addAndEditUserNYA] action in CreateAccount widget.
  String? retunrSingUp;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordPasswordVisibilityFocusNode = FocusNode();
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
    passwordPasswordVisibilityFocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
