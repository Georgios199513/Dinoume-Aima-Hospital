import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pop_up_input_widget.dart' show PopUpInputWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PopUpInputModel extends FlutterFlowModel<PopUpInputWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for Street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for PostalCode widget.
  FocusNode? postalCodeFocusNode;
  TextEditingController? postalCodeTextController;
  late MaskTextInputFormatter postalCodeMask;
  String? Function(BuildContext, String?)? postalCodeTextControllerValidator;
  // State field(s) for regions widget.
  String? regionsValue;
  FormFieldController<String>? regionsValueController;
  // State field(s) for Details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsTextController;
  String? Function(BuildContext, String?)? detailsTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // Stores action output result for [Backend Call - API (Get LatLng from address)] action in ActionFromTime widget.
  ApiCallResponse? apiResultmww;
  // Stores action output result for [Backend Call - Read Document] action in ActionFromTime widget.
  TimeChunksChoicesRecord? newFrom;
  // Stores action output result for [Backend Call - Read Document] action in ActionFromTime widget.
  TimeChunksChoicesRecord? newTo;
  // Stores action output result for [Backend Call - Read Document] action in ActionFromTime widget.
  TimeChunksChoicesRecord? newFrom2;
  // Stores action output result for [Backend Call - Read Document] action in ActionFromTime widget.
  TimeChunksChoicesRecord? newTo2;
  // Stores action output result for [Firestore Query - Query a collection] action in ActionFromTime widget.
  List<TimeChunksChoicesRecord>? filterTimeChunk;
  // Stores action output result for [Firestore Query - Query a collection] action in ActionFromTime widget.
  List<BloodAppointmentRecord>? filterAppointments;
  // Stores action output result for [Backend Call - Read Document] action in ActionFromTime widget.
  BloodAppointmentRecord? firstAppointment;
  // Stores action output result for [Backend Call - Read Document] action in ActionFromTime widget.
  TimeChunksChoicesRecord? firstAppointmentTimeOf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    streetFocusNode?.dispose();
    streetTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    postalCodeFocusNode?.dispose();
    postalCodeTextController?.dispose();

    detailsFocusNode?.dispose();
    detailsTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }
}
