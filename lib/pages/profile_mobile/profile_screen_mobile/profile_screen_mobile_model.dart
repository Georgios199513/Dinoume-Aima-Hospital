import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_screen_mobile_widget.dart' show ProfileScreenMobileWidget;
import 'package:flutter/material.dart';

class ProfileScreenMobileModel
    extends FlutterFlowModel<ProfileScreenMobileWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - appPackageInfo] action in EditProfile widget.
  String? appPackageInfo;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    footerModel.dispose();
  }
}
