import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pdf_list_drawer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for pdfListDrawer component.
  late PdfListDrawerModel pdfListDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pdfListDrawerModel = createModel(context, () => PdfListDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    pdfListDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
