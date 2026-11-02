import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/no_my_donors/no_my_donors_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/my_donors/donor_details/donor_details_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_donors_model.dart';
export 'my_donors_model.dart';

class MyDonorsWidget extends StatefulWidget {
  const MyDonorsWidget({
    super.key,
    this.donorName,
    this.donorGender,
  });

  final String? donorName;
  final String? donorGender;

  static String routeName = 'MyDonors';
  static String routePath = '/myDonors';

  @override
  State<MyDonorsWidget> createState() => _MyDonorsWidgetState();
}

class _MyDonorsWidgetState extends State<MyDonorsWidget> {
  late MyDonorsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyDonorsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().CurrentRegion == '') &&
          (loggedIn == true)) {
        FFAppState().CurrentRegion =
            valueOrDefault(currentUserDocument?.region, '');
        FFAppState().update(() {});
        return;
      } else {
        return;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).transparent,
          automaticallyImplyLeading: false,
          title: Container(
            constraints: BoxConstraints(
              maxWidth: 500.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).transparent,
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: SelectionArea(
                  child: Text(
                'Οι αιμοδότες μου',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              )),
            ),
          ),
          actions: [],
          centerTitle: true,
          toolbarHeight: 70.0,
          elevation: 0.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 500.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).transparent,
            ),
            child: Stack(
              children: [
                AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<HospitalsCreatedRecord>(
                    stream: HospitalsCreatedRecord.getDocument(
                        currentUserDocument!.nYAUserHospital!),
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

                      final mainHospitalsCreatedRecord = snapshot.data!;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 5.0, 15.0, 30.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 15.0, 10.0, 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 6.0,
                                            color: Color(0x33000000),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.search,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController,
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textController',
                                                      Duration(
                                                          milliseconds: 100),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
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
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                    ),
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
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.name,
                                                    validator: _model
                                                        .textControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (_model.textController.text !=
                                                    '')
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  safeSetState(() {
                                                    _model.textController
                                                        ?.clear();
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0x7F000000),
                                                  size: 20.0,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Text(
                                    'Αν δεν βίσκεται το χρήστη που ψάχνετε δοκιμάστε να γράψετε το όνομα του στα λατινικά.',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(
                                queryBuilder: (usersRecord) => usersRecord
                                    .where(
                                      'isNyaUser',
                                      isEqualTo: false,
                                    )
                                    .where(
                                      'isAdmin',
                                      isEqualTo: false,
                                    )
                                    .orderBy('display_name'),
                              ),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRecord> listViewUsersRecordList =
                                    snapshot.data!;
                                if (listViewUsersRecordList.isEmpty) {
                                  return NoMyDonorsWidget();
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewUsersRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewUsersRecord =
                                        listViewUsersRecordList[listViewIndex];
                                    return Visibility(
                                      visible: mainHospitalsCreatedRecord.donors
                                              .contains(listViewUsersRecord
                                                  .reference) &&
                                          functions.showSearchResult(
                                              _model.textController.text,
                                              listViewUsersRecord.displayName),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType
                                                    .bottomToTop,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                reverseDuration:
                                                    Duration(milliseconds: 300),
                                                child: DonorDetailsWidget(
                                                  donor: listViewUsersRecord,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .transparent,
                                            elevation: 0.0,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                StreamBuilder<GenderRecord>(
                                                  stream:
                                                      GenderRecord.getDocument(
                                                          listViewUsersRecord
                                                              .gender!),
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

                                                    final imageGenderRecord =
                                                        snapshot.data!;

                                                    return CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: valueOrDefault<
                                                          String>(
                                                        imageGenderRecord
                                                            .genderSelection,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/tlltx1ivhnaw/GenderSelection-Other.png',
                                                      ),
                                                      width: 60.0,
                                                      height: 60.0,
                                                      fit: BoxFit.cover,
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SelectionArea(
                                                          child: Text(
                                                        listViewUsersRecord
                                                            .displayName,
                                                        style:
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
                                                      )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          'Ημ/νία εγγραφής: ${dateTimeFormat(
                                                            "d/M/y",
                                                            listViewUsersRecord
                                                                .createdTime,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}${dateTimeFormat(
                                                            "jm",
                                                            listViewUsersRecord
                                                                .createdTime,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 12.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).transparent,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.footerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: FooterWidget(
                            backOneColor:
                                FlutterFlowTheme.of(context).transparent,
                            iconTwoColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            backTwoColor:
                                FlutterFlowTheme.of(context).transparent,
                            iconThreeColor:
                                FlutterFlowTheme.of(context).primary,
                            backThreeColor: Color(0x33FF7E67),
                            iconFourColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            backFourColor:
                                FlutterFlowTheme.of(context).transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
