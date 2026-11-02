import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_edit_appointments_widget.dart' show NewEditAppointmentsWidget;
import 'package:flutter/material.dart';

class NewEditAppointmentsModel
    extends FlutterFlowModel<NewEditAppointmentsWidget> {
  ///  Local state fields for this page.

  List<String> stateList = ['pending', 'completed'];
  void addToStateList(String item) => stateList.add(item);
  void removeFromStateList(String item) => stateList.remove(item);
  void removeAtIndexFromStateList(int index) => stateList.removeAt(index);
  void insertAtIndexInStateList(int index, String item) =>
      stateList.insert(index, item);
  void updateStateListAtIndex(int index, Function(String) updateFn) =>
      stateList[index] = updateFn(stateList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
