import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'no_my_donors_model.dart';
export 'no_my_donors_model.dart';

class NoMyDonorsWidget extends StatefulWidget {
  const NoMyDonorsWidget({super.key});

  @override
  State<NoMyDonorsWidget> createState() => _NoMyDonorsWidgetState();
}

class _NoMyDonorsWidgetState extends State<NoMyDonorsWidget> {
  late NoMyDonorsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoMyDonorsModel());

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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          fadeInDuration: Duration(milliseconds: 500),
          fadeOutDuration: Duration(milliseconds: 500),
          imageUrl:
              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dinoume-aima-hospitals-1whx4e/assets/yhlv1qwsbs3e/NoMyUsers-36.png',
          width: MediaQuery.sizeOf(context).width * 0.35,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
          child: Text(
            'Δεν υπάρχουν αιμοδότες',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.roboto(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ),
      ],
    );
  }
}
