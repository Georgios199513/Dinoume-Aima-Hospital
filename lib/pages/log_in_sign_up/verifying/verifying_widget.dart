import '/auth/firebase_auth/auth_util.dart';
import '/components/pop_up_message/pop_up_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home_page/home_page_mobile/home_page_mobile_widget.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verifying_model.dart';
export 'verifying_model.dart';

class VerifyingWidget extends StatefulWidget {
  const VerifyingWidget({super.key});

  static String routeName = 'Verifying';
  static String routePath = '/verifying';

  @override
  State<VerifyingWidget> createState() => _VerifyingWidgetState();
}

class _VerifyingWidgetState extends State<VerifyingWidget> {
  late VerifyingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await authManager.refreshUser();
      if (currentUserEmailVerified) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePageMobileWidget(),
          ),
        );
        return;
      } else {
        if (FFAppState().verifyingTimes == 5) {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Color(0x00000000),
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: PopUpMessageWidget(
                    message: 'Ο λογαριασμός σου δεν έχει επιβεβαιωθεί.',
                    description:
                        'Έχεις λάβει έναν σύνδεσμο επιβεβαίωσης στο email σου. Αν έχεις ήδη πατήσει τον σύνδεσμο που σου στέιλαμε προσπάθησε να ξανά πατήσεις το κουμπί ¨Ενεργοποίησα τον λογαριασμό μου\".',
                    button1Text: 'OK',
                    actionName: 'verify',
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        } else {
          FFAppState().verifyingTimes = FFAppState().verifyingTimes + 1;
          safeSetState(() {});
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
              reverseDuration: Duration(milliseconds: 0),
              child: VerifyingWidget(),
            ),
          );
        }

        return;
      }
    });

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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/mozfeqtsxy68/back__02_min.png',
                ),
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Stack(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).transparent,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -0.1),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl:
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/qvgfsn1v5kaz/Banner.png',
                                height: 150.0,
                                fit: BoxFit.cover,
                              ),
                              Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(50.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 8.0, 20.0, 8.0),
                                    child: Text(
                                      'Εφαρμογή των Ν.Υ.Α.',
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 35.0, 0.0, 0.0),
                                child: Text(
                                  'Παρακαλώ περιμένετε...',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL('https://ekea.gr/');
                                },
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl:
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-hospitals-1whx4e/assets/8akd8oh9myu0/ekea-favicon-new.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
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
      ),
    );
  }
}
