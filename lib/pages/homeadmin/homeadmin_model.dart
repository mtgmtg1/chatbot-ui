import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pdf_list_drawer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'homeadmin_widget.dart' show HomeadminWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeadminModel extends FlutterFlowModel<HomeadminWidget> {
  ///  Local state fields for this page.

  List<MessagesRecord> initialMessages = [];
  void addToInitialMessages(MessagesRecord item) => initialMessages.add(item);
  void removeFromInitialMessages(MessagesRecord item) =>
      initialMessages.remove(item);
  void removeAtIndexFromInitialMessages(int index) =>
      initialMessages.removeAt(index);
  void insertAtIndexInInitialMessages(int index, MessagesRecord item) =>
      initialMessages.insert(index, item);
  void updateInitialMessagesAtIndex(
          int index, Function(MessagesRecord) updateFn) =>
      initialMessages[index] = updateFn(initialMessages[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PdfsRecord? pdfnew;
  // Model for pdfListDrawer component.
  late PdfListDrawerModel pdfListDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pdfListDrawerModel = createModel(context, () => PdfListDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    pdfListDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
