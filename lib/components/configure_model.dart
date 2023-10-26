import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'configure_widget.dart' show ConfigureWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfigureModel extends FlutterFlowModel<ConfigureWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for system widget.
  FocusNode? systemFocusNode;
  TextEditingController? systemController;
  String? Function(BuildContext, String?)? systemControllerValidator;
  // State field(s) for chunksize widget.
  FocusNode? chunksizeFocusNode;
  TextEditingController? chunksizeController;
  String? Function(BuildContext, String?)? chunksizeControllerValidator;
  // State field(s) for overwrap widget.
  FocusNode? overwrapFocusNode;
  TextEditingController? overwrapController;
  String? Function(BuildContext, String?)? overwrapControllerValidator;
  // State field(s) for temp widget.
  FocusNode? tempFocusNode1;
  TextEditingController? tempController1;
  String? Function(BuildContext, String?)? tempController1Validator;
  // State field(s) for temp widget.
  FocusNode? tempFocusNode2;
  TextEditingController? tempController2;
  String? Function(BuildContext, String?)? tempController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    systemFocusNode?.dispose();
    systemController?.dispose();

    chunksizeFocusNode?.dispose();
    chunksizeController?.dispose();

    overwrapFocusNode?.dispose();
    overwrapController?.dispose();

    tempFocusNode1?.dispose();
    tempController1?.dispose();

    tempFocusNode2?.dispose();
    tempController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
