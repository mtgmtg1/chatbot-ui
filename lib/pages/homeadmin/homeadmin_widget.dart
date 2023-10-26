import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pdf_list_drawer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homeadmin_model.dart';
export 'homeadmin_model.dart';

class HomeadminWidget extends StatefulWidget {
  const HomeadminWidget({Key? key}) : super(key: key);

  @override
  _HomeadminWidgetState createState() => _HomeadminWidgetState();
}

class _HomeadminWidgetState extends State<HomeadminWidget> {
  late HomeadminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeadminModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Homeadmin'});
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.pdfListDrawerModel,
            updateCallback: () => setState(() {}),
            child: PdfListDrawerWidget(),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: currentUserEmail == 'admin@hoca.dev',
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF09173A),
                    Color(0xFF732295),
                    Color(0xFFEFABAC)
                  ],
                  stops: [0.1, 0.5, 1.0],
                  begin: AlignmentDirectional(1.0, 0.87),
                  end: AlignmentDirectional(-1.0, -0.87),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 50.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 900.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 5.0,
                                                  color: Color(0x00FFFFFF),
                                                  offset: Offset(1.0, 2.0),
                                                )
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xDA25272D),
                                                  Color(0x4231353C)
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    1.0, 0.87),
                                                end: AlignmentDirectional(
                                                    -1.0, -0.87),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0x56FFFFFF),
                                              ),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'HOMEADMIN_CircleImage_r1movnzc_ON_TAP');
                                                      logFirebaseEvent(
                                                          'CircleImage_navigate_to');

                                                      context.pushNamed('home');
                                                    },
                                                    child: Container(
                                                      width: 55.0,
                                                      height: 55.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/shinLogo.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.00, -1.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 44.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        hoverIconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        icon: Icon(
                                                          Icons.list,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'HOMEADMIN_PAGE_list_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_drawer');
                                                          scaffoldKey
                                                              .currentState!
                                                              .openDrawer();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.55,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          height: 200.0,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          11.0,
                                                                          11.0,
                                                                          11.0,
                                                                          11.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textController1,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode1,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFFA5AAB4),
                                                                              fontSize: 11.0,
                                                                            ),
                                                                        hintText:
                                                                            '자료 제목 입력',
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFFA5AAB4),
                                                                              fontSize: 11.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                0.2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                0.2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                0.2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                0.2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Color(0x0FFFFFFF),
                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            15.0,
                                                                            20.0,
                                                                            15.0),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFFA5AAB4),
                                                                            fontSize:
                                                                                11.0,
                                                                          ),
                                                                      validator: _model
                                                                          .textController1Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          11.0,
                                                                          11.0,
                                                                          11.0,
                                                                          11.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textController2,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode2,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFFA5AAB4),
                                                                              fontSize: 11.0,
                                                                            ),
                                                                        hintText:
                                                                            '영문명',
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFFA5AAB4),
                                                                              fontSize: 11.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                0.2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                0.2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                0.2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                0.2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Color(0x0FFFFFFF),
                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            15.0,
                                                                            20.0,
                                                                            15.0),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFFA5AAB4),
                                                                            fontSize:
                                                                                11.0,
                                                                          ),
                                                                      validator: _model
                                                                          .textController2Validator
                                                                          .asValidator(
                                                                              context),
                                                                      inputFormatters: [
                                                                        FilteringTextInputFormatter.allow(
                                                                            RegExp('[a-zA-Z0-9]'))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'HOMEADMIN_PAGE_네임스페이스_만들기_BTN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    var pdfsRecordReference =
                                                                        PdfsRecord
                                                                            .collection
                                                                            .doc();
                                                                    await pdfsRecordReference
                                                                        .set(
                                                                            createPdfsRecordData(
                                                                      create:
                                                                          getCurrentTimestamp,
                                                                      title: _model
                                                                          .textController1
                                                                          .text,
                                                                      pineconeNamespace: _model
                                                                          .textController2
                                                                          .text,
                                                                    ));
                                                                    _model.pdfnew =
                                                                        PdfsRecord.getDocumentFromData(
                                                                            createPdfsRecordData(
                                                                              create: getCurrentTimestamp,
                                                                              title: _model.textController1.text,
                                                                              pineconeNamespace: _model.textController2.text,
                                                                            ),
                                                                            pdfsRecordReference);
                                                                    logFirebaseEvent(
                                                                        'Button_update_app_state');
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .pineconeNamespace =
                                                                          _model
                                                                              .textController2
                                                                              .text;
                                                                    });

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  text:
                                                                      '네임스페이스 만들기',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                FFAppState()
                                                                    .pineconeNamespace,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 390.0,
                                                          height: 121.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child:
                                                              FlutterFlowWebView(
                                                            content: FFAppState()
                                                                    .var1 +
                                                                FFAppState()
                                                                    .pineconeNamespace +
                                                                FFAppState()
                                                                    .var2,
                                                            width: 444.0,
                                                            height: 320.0,
                                                            verticalScroll:
                                                                false,
                                                            horizontalScroll:
                                                                false,
                                                            html: true,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 444.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                  ),
                                                  Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 444.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
