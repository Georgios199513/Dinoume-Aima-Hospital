import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'no_yet_events_model.dart';
export 'no_yet_events_model.dart';

class NoYetEventsWidget extends StatefulWidget {
  const NoYetEventsWidget({super.key});

  @override
  State<NoYetEventsWidget> createState() => _NoYetEventsWidgetState();
}

class _NoYetEventsWidgetState extends State<NoYetEventsWidget> {
  late NoYetEventsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoYetEventsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 500),
              fadeOutDuration: Duration(milliseconds: 500),
              imageUrl:
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-6o5lnp/assets/hpd68e9nxeul/PassesAppointment.png',
              width: MediaQuery.sizeOf(context).width * 0.3,
              fit: BoxFit.contain,
            ),
          if (responsiveVisibility(
            context: context,
            phone: false,
          ))
            Image.asset(
              'assets/images/PassesAppointment.png',
              width: 150.0,
              fit: BoxFit.contain,
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
            child: Text(
              'Δεν έχει ολοκληρωθεί καμία αιμοδοσία',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.roboto(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
