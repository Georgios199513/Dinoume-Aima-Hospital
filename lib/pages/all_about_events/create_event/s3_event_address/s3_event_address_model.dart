import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 's3_event_address_widget.dart' show S3EventAddressWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class S3EventAddressModel extends FlutterFlowModel<S3EventAddressWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;
  String? _streetTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Υποχρεωτικό πεδίο';
    }

    return null;
  }

  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  String? _cityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Υποχρεωτικό πεδίο';
    }

    return null;
  }

  // State field(s) for PostalCode widget.
  FocusNode? postalCodeFocusNode;
  TextEditingController? postalCodeTextController;
  late MaskTextInputFormatter postalCodeMask;
  String? Function(BuildContext, String?)? postalCodeTextControllerValidator;
  String? _postalCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Υποχρεωτικό πεδίο';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsTextController;
  String? Function(BuildContext, String?)? detailsTextControllerValidator;
  // Stores action output result for [Backend Call - API (Get LatLng from address)] action in Button widget.
  ApiCallResponse? latlong;

  @override
  void initState(BuildContext context) {
    streetTextControllerValidator = _streetTextControllerValidator;
    cityTextControllerValidator = _cityTextControllerValidator;
    postalCodeTextControllerValidator = _postalCodeTextControllerValidator;
  }

  @override
  void dispose() {
    streetFocusNode?.dispose();
    streetTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    postalCodeFocusNode?.dispose();
    postalCodeTextController?.dispose();

    detailsFocusNode?.dispose();
    detailsTextController?.dispose();
  }
}
