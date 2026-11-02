import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'old_events_widget.dart' show OldEventsWidget;
import 'package:flutter/material.dart';

class OldEventsModel extends FlutterFlowModel<OldEventsWidget> {
  ///  State fields for stateful widgets in this page.

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
