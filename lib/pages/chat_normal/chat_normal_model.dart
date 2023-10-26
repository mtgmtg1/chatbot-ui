import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/chat_bubbles/chat_bubbles_widget.dart';
import '/components/pdf_list_drawer_widget.dart';
import '/components/popup_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'chat_normal_widget.dart' show ChatNormalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ChatNormalModel extends FlutterFlowModel<ChatNormalWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  ChatsRecord? chasasCopy13;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  MessagesRecord? msg13;
  // Stores action output result for [Backend Call - API (loadtestone)] action in TextField widget.
  ApiCallResponse? gptResponsett13;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? chasas;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MessagesRecord? msg1Copy2CopyCopy;
  // Stores action output result for [Backend Call - API (loadtestone)] action in Button widget.
  ApiCallResponse? gptResponseCopy4CopyCopy;
  // Model for pdfListDrawer component.
  late PdfListDrawerModel pdfListDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pdfListDrawerModel = createModel(context, () => PdfListDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    pdfListDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
