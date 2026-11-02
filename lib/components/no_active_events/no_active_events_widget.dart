import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'no_active_events_model.dart';
export 'no_active_events_model.dart';

class NoActiveEventsWidget extends StatefulWidget {
  const NoActiveEventsWidget({
    super.key,
    String? text,
  }) : this.text = text ?? 'Δεν υπάρχουν ενεργές εξορμήσεις';

  final String text;

  @override
  State<NoActiveEventsWidget> createState() => _NoActiveEventsWidgetState();
}

class _NoActiveEventsWidgetState extends State<NoActiveEventsWidget> {
  late NoActiveEventsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoActiveEventsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 0.0,
            child: Container(
              height: 150.0,
              constraints: BoxConstraints(
                minWidth: 200.0,
                maxWidth: 250.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).transparent,
              ),
              child: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 500),
                fadeOutDuration: Duration(milliseconds: 500),
                imageUrl:
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-hospitals-1whx4e/assets/4eueci1rl3zq/NoActiveEvents.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
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
