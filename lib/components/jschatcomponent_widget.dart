import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'jschatcomponent_model.dart';
export 'jschatcomponent_model.dart';

class JschatcomponentWidget extends StatefulWidget {
  const JschatcomponentWidget({Key? key}) : super(key: key);

  @override
  _JschatcomponentWidgetState createState() => _JschatcomponentWidgetState();
}

class _JschatcomponentWidgetState extends State<JschatcomponentWidget> {
  late JschatcomponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JschatcomponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      alignment: AlignmentDirectional(0.00, 0.00),
      child: FlutterFlowWebView(
        content: FFAppState().var1 +
            FFAppState().pineconeNamespace +
            FFAppState().var2,
        width: 555.0,
        height: 469.0,
        verticalScroll: false,
        horizontalScroll: false,
        html: true,
      ),
    );
  }
}
