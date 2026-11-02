import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DisplayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for Gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for PhoneNumberUser widget.
  FocusNode? phoneNumberUserFocusNode;
  TextEditingController? phoneNumberUserTextController;
  String? Function(BuildContext, String?)?
      phoneNumberUserTextControllerValidator;
  String? _phoneNumberUserTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Απαιτούμενη πεδίο';
    }

    if (!RegExp('^\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}\$')
        .hasMatch(val)) {
      return 'Ο αριθμός τηλεφώνου πρέπει υποχρεωτικά να περιέχει 10 ψηφία';
    }
    return null;
  }

  // State field(s) for EmailHospital widget.
  FocusNode? emailHospitalFocusNode;
  TextEditingController? emailHospitalTextController;
  String? Function(BuildContext, String?)? emailHospitalTextControllerValidator;
  String? _emailHospitalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Απαιτούμενη πεδίο';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Παρακαλώ προσθέστε ένα σωστό email.';
    }
    return null;
  }

  // State field(s) for PhoneNumberHospital widget.
  FocusNode? phoneNumberHospitalFocusNode;
  TextEditingController? phoneNumberHospitalTextController;
  String? Function(BuildContext, String?)?
      phoneNumberHospitalTextControllerValidator;
  // State field(s) for StreetANDNumber widget.
  FocusNode? streetANDNumberFocusNode;
  TextEditingController? streetANDNumberTextController;
  String? Function(BuildContext, String?)?
      streetANDNumberTextControllerValidator;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for PostCOde widget.
  FocusNode? postCOdeFocusNode;
  TextEditingController? postCOdeTextController;
  String? Function(BuildContext, String?)? postCOdeTextControllerValidator;
  // State field(s) for Region widget.
  String? regionValue;
  FormFieldController<String>? regionValueController;

  @override
  void initState(BuildContext context) {
    phoneNumberUserTextControllerValidator =
        _phoneNumberUserTextControllerValidator;
    emailHospitalTextControllerValidator =
        _emailHospitalTextControllerValidator;
  }

  @override
  void dispose() {
    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberUserFocusNode?.dispose();
    phoneNumberUserTextController?.dispose();

    emailHospitalFocusNode?.dispose();
    emailHospitalTextController?.dispose();

    phoneNumberHospitalFocusNode?.dispose();
    phoneNumberHospitalTextController?.dispose();

    streetANDNumberFocusNode?.dispose();
    streetANDNumberTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    postCOdeFocusNode?.dispose();
    postCOdeTextController?.dispose();
  }
}
