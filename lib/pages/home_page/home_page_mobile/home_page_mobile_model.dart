import '/backend/backend.dart';
import '/components/chip/chip_widget.dart';
import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_mobile_widget.dart' show HomePageMobileWidget;
import 'package:flutter/material.dart';

class HomePageMobileModel extends FlutterFlowModel<HomePageMobileWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Creat widget.
  EventsRecord? newEvent;
  // Model for Chip component.
  late ChipModel chipModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    chipModel = createModel(context, () => ChipModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    chipModel.dispose();
    footerModel.dispose();
  }
}
