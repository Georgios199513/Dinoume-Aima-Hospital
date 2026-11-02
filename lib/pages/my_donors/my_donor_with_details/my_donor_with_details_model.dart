import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_donor_with_details_widget.dart' show MyDonorWithDetailsWidget;
import 'package:flutter/material.dart';

class MyDonorWithDetailsModel
    extends FlutterFlowModel<MyDonorWithDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    footerModel.dispose();
  }
}
