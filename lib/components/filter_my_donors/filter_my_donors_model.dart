import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_my_donors_widget.dart' show FilterMyDonorsWidget;
import 'package:flutter/material.dart';

class FilterMyDonorsModel extends FlutterFlowModel<FilterMyDonorsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DonorName widget.
  FocusNode? donorNameFocusNode;
  TextEditingController? donorNameTextController;
  String? Function(BuildContext, String?)? donorNameTextControllerValidator;
  // State field(s) for Gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    donorNameFocusNode?.dispose();
    donorNameTextController?.dispose();
  }
}
