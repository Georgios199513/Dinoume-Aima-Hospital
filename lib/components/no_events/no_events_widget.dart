import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'no_events_model.dart';
export 'no_events_model.dart';

class NoEventsWidget extends StatefulWidget {
  const NoEventsWidget({super.key});

  @override
  State<NoEventsWidget> createState() => _NoEventsWidgetState();
}

class _NoEventsWidgetState extends State<NoEventsWidget> {
  late NoEventsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoEventsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ))
          Image.asset(
            'assets/images/NoEvents-67.png',
            width: MediaQuery.sizeOf(context).width * 0.75,
            fit: BoxFit.contain,
          ),
        if (responsiveVisibility(
          context: context,
          phone: false,
        ))
          Image.asset(
            'assets/images/NoEvents-67.png',
            width: 300.0,
            fit: BoxFit.contain,
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
          child: Text(
            'Δεν έχετε δημιουργήσει καμία αιμοδοσία ακόμη',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: isWeb ? 14.0 : 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ),
      ],
    );
  }
}
