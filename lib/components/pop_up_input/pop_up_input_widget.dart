import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/pop_up_message/pop_up_message_widget.dart';
import '/components/select_time_range/select_time_range_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'pop_up_input_model.dart';
export 'pop_up_input_model.dart';

class PopUpInputWidget extends StatefulWidget {
  const PopUpInputWidget({
    super.key,
    this.title,
    this.fieldToModify,
    this.event,
    this.isNew,
    this.fromTimeRef,
  });

  final String? title;
  final String? fieldToModify;
  final EventsRecord? event;
  final bool? isNew;
  final DocumentReference? fromTimeRef;

  @override
  State<PopUpInputWidget> createState() => _PopUpInputWidgetState();
}

class _PopUpInputWidgetState extends State<PopUpInputWidget> {
  late PopUpInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpInputModel());

    _model.nameTextController ??=
        TextEditingController(text: widget.event?.nameOfEvent);
    _model.nameFocusNode ??= FocusNode();

    _model.streetTextController ??=
        TextEditingController(text: widget.event?.address.streetAndNumber);
    _model.streetFocusNode ??= FocusNode();

    _model.cityTextController ??=
        TextEditingController(text: widget.event?.address.city);
    _model.cityFocusNode ??= FocusNode();

    _model.postalCodeTextController ??=
        TextEditingController(text: widget.event?.address.postalCode);
    _model.postalCodeFocusNode ??= FocusNode();

    _model.postalCodeMask = MaskTextInputFormatter(mask: '### ##');
    _model.detailsTextController ??=
        TextEditingController(text: widget.event?.details);
    _model.detailsFocusNode ??= FocusNode();

    _model.textController6 ??= TextEditingController(
        text: widget.event?.seatsTotalPerTimeChunk.toString());
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 25.0, 15.0, 25.0),
        child: StreamBuilder<EventsRecord>(
          stream: EventsRecord.getDocument(widget.event!.reference),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }

            final containerEventsRecord = snapshot.data!;

            return Material(
              color: Colors.transparent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 400.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: widget.title!,
                          icon: Icon(
                            Icons.chevron_left_rounded,
                            size: 28.0,
                          ),
                          options: FFButtonOptions(
                            padding: EdgeInsets.all(0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 3.0, 0.0),
                            color: FlutterFlowTheme.of(context).transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 30.0),
                          child: Builder(
                            builder: (context) {
                              if (widget.fieldToModify == 'name') {
                                return TextFormField(
                                  controller: _model.nameTextController,
                                  focusNode: _model.nameFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.nameTextController',
                                    Duration(milliseconds: 500),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Ονομασία ',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF949697),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFE0E0E0),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.roboto(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  maxLines: null,
                                  keyboardType: TextInputType.name,
                                  validator: _model.nameTextControllerValidator
                                      .asValidator(context),
                                );
                              } else if (widget.fieldToModify == 'date') {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    // Select Date
                                    final _datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: functions.getTodayDate(),
                                      firstDate: functions.getTodayDate(),
                                      lastDate: DateTime(2050),
                                    );

                                    if (_datePickedDate != null) {
                                      safeSetState(() {
                                        _model.datePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                        );
                                      });
                                    } else if (_model.datePicked != null) {
                                      safeSetState(() {
                                        _model.datePicked =
                                            functions.getTodayDate();
                                      });
                                    }
                                    FFAppState().selectedDate =
                                        _model.datePicked;
                                    FFAppState().update(() {});
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .transparent,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.calendar_today,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 5.0, 5.0),
                                                child: Container(
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            dateTimeFormat(
                                                              "d/M/y",
                                                              FFAppState()
                                                                  .selectedDate,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          )),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_down_sharp,
                                                          color: Colors.black,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else if (widget.fieldToModify == 'address') {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: SelectionArea(
                                                    child: Text(
                                                  'Οδός και Αριθμός',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                )),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: TextFormField(
                                                  controller: _model
                                                      .streetTextController,
                                                  focusNode:
                                                      _model.streetFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.streetTextController',
                                                    Duration(milliseconds: 50),
                                                    () => safeSetState(() {}),
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .roboto(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .roboto(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFE0E0E0),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    suffixIcon: _model
                                                            .streetTextController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .streetTextController
                                                                  ?.clear();
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: Color(
                                                                  0xFF757575),
                                                              size: 22.0,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  maxLines: null,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  validator: _model
                                                      .streetTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 15.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      'Πόλη',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .roboto(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    )),
                                                  ),
                                                  Container(
                                                    width: 200.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .cityTextController,
                                                      focusNode:
                                                          _model.cityFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.cityTextController',
                                                        Duration(
                                                            milliseconds: 500),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFE0E0E0),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        suffixIcon: _model
                                                                .cityTextController!
                                                                .text
                                                                .isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .cityTextController
                                                                      ?.clear();
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: Color(
                                                                      0xFF757575),
                                                                  size: 22.0,
                                                                ),
                                                              )
                                                            : null,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      validator: _model
                                                          .cityTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'Τ.Κ.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  )),
                                                ),
                                                Container(
                                                  width: 200.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .postalCodeTextController,
                                                    focusNode: _model
                                                        .postalCodeFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.postalCodeTextController',
                                                      Duration(
                                                          milliseconds: 500),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE0E0E0),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      suffixIcon: _model
                                                              .postalCodeTextController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .postalCodeTextController
                                                                    ?.clear();
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: Color(
                                                                    0xFF757575),
                                                                size: 22.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: _model
                                                        .postalCodeTextControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      _model.postalCodeMask
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: SelectionArea(
                                                child: Text(
                                              'Περιφέρεια',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            )),
                                          ),
                                          StreamBuilder<List<RegionsRecord>>(
                                            stream: queryRegionsRecord(
                                              queryBuilder: (regionsRecord) =>
                                                  regionsRecord
                                                      .orderBy('order'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 24.0,
                                                    height: 24.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<RegionsRecord>
                                                  regionsRegionsRecordList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .regionsValueController ??=
                                                    FormFieldController<String>(
                                                  _model.regionsValue ??=
                                                      widget.event?.address
                                                          .region,
                                                ),
                                                options:
                                                    regionsRegionsRecordList
                                                        .map(
                                                            (e) => e.regionName)
                                                        .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                        .regionsValue = val),
                                                height: 50.0,
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.black,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                fillColor: Color(0xFFF5F5F5),
                                                elevation: 2.0,
                                                borderColor: Color(0xFFE0E0E0),
                                                borderWidth: 1.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'Διευκρινίσεις',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  )),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .transparent,
                                                  ),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .detailsTextController,
                                                    focusNode:
                                                        _model.detailsFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.detailsTextController',
                                                      Duration(
                                                          milliseconds: 500),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: false,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE0E0E0),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      suffixIcon: _model
                                                              .detailsTextController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .detailsTextController
                                                                    ?.clear();
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: Color(
                                                                    0xFF757575),
                                                                size: 22.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    maxLines: null,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    validator: _model
                                                        .detailsTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              } else if (widget.fieldToModify == 'seats') {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 15.0, 5.0, 15.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-hospitals-1whx4e/assets/xkjmct4qiacr/EventsSeats-67.png',
                                                  width: 30.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 5.0, 5.0),
                                                  child: Container(
                                                    height: 70.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          10.0,
                                                                          5.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController6,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textController6',
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                    () => safeSetState(
                                                                        () {}),
                                                                  ),
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.roboto(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE0E0E0),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .roboto(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  keyboardType: const TextInputType
                                                                      .numberWithOptions(
                                                                      signed:
                                                                          true,
                                                                      decimal:
                                                                          true),
                                                                  validator: _model
                                                                      .textController6Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: SelectionArea(
                                                                child: AutoSizeText(
                                                              'άτομα / 30 λεπτά',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .roboto(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.info_outlined,
                                            color: Color(0xFF9F9F9F),
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: SelectionArea(
                                                  child: Text(
                                                'Δεν μπορείτε να επιλέξετε μικρότερη διαθεσιμότητα από τον αριθμό τον κλεισμένων συναντήσεων: Έχετε ${widget.event?.bloodAppointmentList.length.toString()} κλεισμένες συναντήσεις.',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF9F9F9F),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Color(0x4D000000),
                                                barrierColor: Color(0x00000000),
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        SelectTimeRangeWidget(
                                                      title: 'Ξεκινάει από...',
                                                      isFrom: true,
                                                      newEvent: widget.event,
                                                      isNew: false,
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'Ξεκινάει από...',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  )),
                                                ),
                                                StreamBuilder<
                                                    TimeChunksChoicesRecord>(
                                                  stream: TimeChunksChoicesRecord
                                                      .getDocument(FFAppState()
                                                          .NewEventFromTimeRange!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final containerTimeChunksChoicesRecord =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .ligthGrey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFE0E0E0),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                containerTimeChunksChoicesRecord
                                                                    .timeChunks
                                                                    .from,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .arrow_right_outlined,
                                                              color:
                                                                  Colors.black,
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor: Color(0x00000000),
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        SelectTimeRangeWidget(
                                                      title: 'Μέχρι...',
                                                      newEvent: widget.event,
                                                      isFrom: false,
                                                      isNew: false,
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'Μέχρι..',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  )),
                                                ),
                                                StreamBuilder<
                                                    TimeChunksChoicesRecord>(
                                                  stream: TimeChunksChoicesRecord
                                                      .getDocument(FFAppState()
                                                          .NewEventToTimeRange!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final toTimeChunksChoicesRecord =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .ligthGrey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFE0E0E0),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                toTimeChunksChoicesRecord
                                                                    .timeChunks
                                                                    .from,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .arrow_right_outlined,
                                                              color:
                                                                  Colors.black,
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child:
                                  StreamBuilder<List<BloodAppointmentRecord>>(
                                stream: queryBloodAppointmentRecord(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<BloodAppointmentRecord>
                                      appointmentsBloodAppointmentRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .transparent,
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: !() {
                                        if (widget.fieldToModify == 'name') {
                                          return (_model
                                                  .nameTextController.text !=
                                              containerEventsRecord
                                                  .nameOfEvent);
                                        } else if (widget.fieldToModify ==
                                            'address') {
                                          return ((_model.streetTextController
                                                      .text !=
                                                  containerEventsRecord.address
                                                      .streetAndNumber) ||
                                              (_model.cityTextController.text !=
                                                  containerEventsRecord
                                                      .address.city) ||
                                              (_model.postalCodeTextController
                                                      .text !=
                                                  containerEventsRecord
                                                      .address.postalCode) ||
                                              (_model.regionsValue !=
                                                  containerEventsRecord
                                                      .address.region) ||
                                              (_model.detailsTextController
                                                      .text !=
                                                  containerEventsRecord
                                                      .details));
                                        } else if (widget.fieldToModify ==
                                            'seats') {
                                          return functions.testIfUpdate(
                                              int.tryParse(
                                                  _model.textController6.text),
                                              containerEventsRecord
                                                  .seatsTotalPerTimeChunk)!;
                                        } else if (widget.fieldToModify ==
                                            'timeRange') {
                                          return ((FFAppState()
                                                      .NewEventOrderFrom !=
                                                  containerEventsRecord
                                                      .timeRange.from) ||
                                              (FFAppState().NewEventOrderTo !=
                                                  containerEventsRecord
                                                      .timeRange.to));
                                        } else if (widget.fieldToModify ==
                                            'date') {
                                          return (containerEventsRecord
                                                  .eventDate !=
                                              FFAppState().selectedDate);
                                        } else {
                                          return false;
                                        }
                                      }()
                                          ? null
                                          : () async {
                                              var _shouldSetState = false;
                                              if (widget.fieldToModify ==
                                                  'address') {
                                                _model.apiResultmww =
                                                    await GetLatLngFromAddressCall
                                                        .call(
                                                  address:
                                                      '${_model.streetTextController.text}, ${_model.cityTextController.text} ${_model.postalCodeTextController.text}',
                                                );

                                                _shouldSetState = true;
                                                if ((_model.apiResultmww
                                                        ?.succeeded ??
                                                    true)) {
                                                  await widget.event!.reference
                                                      .update(
                                                          createEventsRecordData(
                                                    address:
                                                        createAddressStruct(
                                                      city: _model
                                                          .cityTextController
                                                          .text,
                                                      postalCode: _model
                                                          .postalCodeTextController
                                                          .text,
                                                      streetAndNumber: _model
                                                          .streetTextController
                                                          .text,
                                                      region:
                                                          _model.regionsValue,
                                                      clearUnsetFields: false,
                                                    ),
                                                    details: _model
                                                        .detailsTextController
                                                        .text,
                                                    location: functions
                                                        .convertToGeopoint(
                                                            GetLatLngFromAddressCall
                                                                .latidute(
                                                              (_model.apiResultmww
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!,
                                                            GetLatLngFromAddressCall
                                                                .longitude(
                                                              (_model.apiResultmww
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!),
                                                  ));
                                                } else {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Color(0x00000000),
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            PopUpMessageWidget(
                                                          message:
                                                              'Παρακαλώ ελέγξτε την διεύθυνσή σας.',
                                                          button1Text: 'ΟΚ',
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }

                                                FFAppState().CurrentRegion =
                                                    'Done';
                                                safeSetState(() {});
                                              } else if (widget
                                                      .fieldToModify ==
                                                  'name') {
                                                await widget.event!.reference
                                                    .update(
                                                        createEventsRecordData(
                                                  nameOfEvent: _model
                                                      .nameTextController.text,
                                                ));
                                              } else if (widget
                                                      .fieldToModify ==
                                                  'seats') {
                                                if (((int newSeatsNumber,
                                                            int oldSeatsNumber) {
                                                      return newSeatsNumber >=
                                                          oldSeatsNumber;
                                                    }(
                                                        int.parse(_model
                                                            .textController6
                                                            .text),
                                                        containerEventsRecord
                                                            .bloodAppointmentList
                                                            .length)) &&
                                                    (_model.textController6
                                                            .text !=
                                                        '0')) {
                                                  await widget.event!.reference
                                                      .update(
                                                          createEventsRecordData(
                                                    seatsTotalPerTimeChunk:
                                                        int.tryParse(_model
                                                            .textController6
                                                            .text),
                                                    seatsMax: functions.totalSeatsEvent(
                                                        int.parse(_model
                                                            .textController6
                                                            .text),
                                                        functions.numberBetween2TimeChunks(
                                                            containerEventsRecord
                                                                .timeRange.from,
                                                            containerEventsRecord
                                                                .timeRange.to,
                                                            0)),
                                                  ));
                                                } else {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Color(0x4F000000),
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            PopUpMessageWidget(
                                                          message:
                                                              'Παρακαλώ επιλέξτε περισσότερες θέσεις.',
                                                          button1Text: 'ΟΚ',
                                                          description:
                                                              'Προκειμένου να διασφαλιστεί η διαθεσιμότητα ραντεβού για όλους τους αιτούντες, είναι απαραίτητο ο αριθμός των διαθέσιμων θέσεων να υπερβαίνει τον αριθμό των ήδη κλεισμένων ραντεβού (${containerEventsRecord.bloodAppointmentList.length.toString()}) .',
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }
                                              } else if (widget
                                                      .fieldToModify ==
                                                  'date') {
                                                await widget.event!.reference
                                                    .update(
                                                        createEventsRecordData(
                                                  eventDate: _model.datePicked,
                                                ));
                                              } else if (widget
                                                      .fieldToModify ==
                                                  'timeRange') {
                                                _model.newFrom =
                                                    await TimeChunksChoicesRecord
                                                        .getDocumentOnce(
                                                            FFAppState()
                                                                .NewEventFromTimeRange!);
                                                _shouldSetState = true;
                                                _model.newTo =
                                                    await TimeChunksChoicesRecord
                                                        .getDocumentOnce(
                                                            FFAppState()
                                                                .NewEventToTimeRange!);
                                                _shouldSetState = true;

                                                await widget.event!.reference
                                                    .update(
                                                        createEventsRecordData(
                                                  seatsMax: functions.totalSeatsEvent(
                                                      int.parse(_model
                                                          .textController6
                                                          .text),
                                                      functions.numberBetween2TimeChunks(
                                                          FFAppState()
                                                              .NewEventOrderFrom,
                                                          FFAppState()
                                                              .NewEventOrderTo,
                                                          0)),
                                                  timeRange:
                                                      createChunkOrderRangeStruct(
                                                    from: _model.newFrom?.order,
                                                    to: _model.newTo?.order,
                                                    fromTime: _model.newFrom
                                                        ?.timeChunks.from,
                                                    separator: ' - ',
                                                    toTime: _model
                                                        .newTo?.timeChunks.to,
                                                    fromRef: _model
                                                        .newFrom?.reference,
                                                    toRef:
                                                        _model.newTo?.reference,
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              }

                                              if (widget.isNew!) {
                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              } else {
                                                if (containerEventsRecord
                                                        .bloodAppointmentList
                                                        .length >
                                                    0) {
                                                  if (widget.fieldToModify ==
                                                      'timeRange') {
                                                    _model.newFrom2 =
                                                        await TimeChunksChoicesRecord
                                                            .getDocumentOnce(
                                                                FFAppState()
                                                                    .NewEventFromTimeRange!);
                                                    _shouldSetState = true;
                                                    _model.newTo2 =
                                                        await TimeChunksChoicesRecord
                                                            .getDocumentOnce(
                                                                FFAppState()
                                                                    .NewEventToTimeRange!);
                                                    _shouldSetState = true;
                                                    _model.filterTimeChunk =
                                                        await queryTimeChunksChoicesRecordOnce(
                                                      queryBuilder:
                                                          (timeChunksChoicesRecord) =>
                                                              timeChunksChoicesRecord
                                                                  .where(
                                                                    'Order',
                                                                    isGreaterThanOrEqualTo: _model
                                                                        .newFrom2
                                                                        ?.order,
                                                                  )
                                                                  .where(
                                                                    'Order',
                                                                    isLessThanOrEqualTo: _model
                                                                        .newTo2
                                                                        ?.order,
                                                                  ),
                                                    );
                                                    _shouldSetState = true;
                                                    FFAppState()
                                                            .TimeChunksList =
                                                        _model.filterTimeChunk!
                                                            .map((e) =>
                                                                e.reference)
                                                            .toList()
                                                            .cast<
                                                                DocumentReference>();
                                                    safeSetState(() {});
                                                    _model.filterAppointments =
                                                        await queryBloodAppointmentRecordOnce(
                                                      queryBuilder: (bloodAppointmentRecord) =>
                                                          bloodAppointmentRecord
                                                              .where(
                                                                'RelatedEvent',
                                                                isEqualTo:
                                                                    containerEventsRecord
                                                                        .reference,
                                                              )
                                                              .where(
                                                                'appointmentState',
                                                                isEqualTo:
                                                                    'pending',
                                                              )
                                                              .whereNotIn(
                                                                  'TimeOfAppointment',
                                                                  FFAppState()
                                                                      .TimeChunksList),
                                                    );
                                                    _shouldSetState = true;
                                                    FFAppState()
                                                            .BloodAppointmentToCheck =
                                                        _model
                                                            .filterAppointments!
                                                            .map((e) =>
                                                                e.reference)
                                                            .toList()
                                                            .cast<
                                                                DocumentReference>();
                                                    safeSetState(() {});
                                                    while (FFAppState()
                                                            .BloodAppointmentToCheck
                                                            .length >
                                                        0) {
                                                      _model.firstAppointment =
                                                          await BloodAppointmentRecord
                                                              .getDocumentOnce(
                                                                  FFAppState()
                                                                      .BloodAppointmentToCheck
                                                                      .firstOrNull!);
                                                      _shouldSetState = true;
                                                      _model.firstAppointmentTimeOf =
                                                          await TimeChunksChoicesRecord
                                                              .getDocumentOnce(_model
                                                                  .firstAppointment!
                                                                  .timeOfAppointment!);
                                                      _shouldSetState = true;
                                                      if ((_model.firstAppointmentTimeOf!
                                                                  .order >=
                                                              _model.newFrom2!
                                                                  .order) &&
                                                          (_model.firstAppointmentTimeOf!
                                                                  .order <=
                                                              _model.newTo2!
                                                                  .order)) {
                                                        FFAppState()
                                                            .removeFromBloodAppointmentToCheck(
                                                                _model
                                                                    .firstAppointment!
                                                                    .reference);
                                                        safeSetState(() {});
                                                      } else {
                                                        FFAppState()
                                                            .removeFromBloodAppointmentToCheck(
                                                                _model
                                                                    .firstAppointment!
                                                                    .reference);
                                                        FFAppState()
                                                            .addToBloodAppointmentsToComplete(
                                                                _model
                                                                    .firstAppointment!
                                                                    .reference);
                                                        safeSetState(() {});
                                                      }
                                                    }
                                                    FFAppState()
                                                            .totalUpdateAmount =
                                                        _model
                                                            .filterAppointments!
                                                            .length;
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                            .BloodAppointmentsToComplete =
                                                        containerEventsRecord
                                                            .bloodAppointmentList
                                                            .toList()
                                                            .cast<
                                                                DocumentReference>();
                                                    FFAppState()
                                                            .totalUpdateAmount =
                                                        containerEventsRecord
                                                            .bloodAppointmentList
                                                            .length;
                                                    safeSetState(() {});
                                                  }

                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          BulkUpdateEventWidget(
                                                        fieldToModify: widget
                                                            .fieldToModify!,
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                      reverseDuration: Duration(
                                                          milliseconds: 0),
                                                      child:
                                                          S6PreviewEventWidget(
                                                        isNewState:
                                                            widget.isNew,
                                                      ),
                                                    ),
                                                  );
                                                }
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                      text: 'Αποθήκευση',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 45.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        disabledColor: Color(0xFFD7D7D7),
                                        disabledTextColor: Color(0xFF595959),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        if (containerEventsRecord.bloodAppointmentList.length !=
                            0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              'Mε την αποθήκευση των νέων στοιχείων θα σταλθεί ενημερωτικό email σε όλους τους χρήστες που έχουν ραντεβού. ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.normal,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
