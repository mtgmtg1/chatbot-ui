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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'chat_normal_model.dart';
export 'chat_normal_model.dart';

class ChatNormalWidget extends StatefulWidget {
  const ChatNormalWidget({
    Key? key,
    this.chatRef,
    this.pdfref,
    this.pdfdoc,
  }) : super(key: key);

  final DocumentReference? chatRef;
  final DocumentReference? pdfref;
  final PdfsRecord? pdfdoc;

  @override
  _ChatNormalWidgetState createState() => _ChatNormalWidgetState();
}

class _ChatNormalWidgetState extends State<ChatNormalWidget>
    with TickerProviderStateMixin {
  late ChatNormalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 410.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 410.ms,
          begin: Offset(0.0, 17.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatNormalModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ChatNormal'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_NORMAL_ChatNormal_ON_INIT_STATE');
      logFirebaseEvent('ChatNormal_update_app_state');
      setState(() {
        FFAppState().awaitingReply = false;
      });
      logFirebaseEvent('ChatNormal_update_app_state');
      setState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return StreamBuilder<List<ConfigureRecord>>(
      stream: queryConfigureRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ConfigureRecord> chatNormalConfigureRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final chatNormalConfigureRecord =
            chatNormalConfigureRecordList.isNotEmpty
                ? chatNormalConfigureRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Container(
              width: 275.0,
              child: Drawer(
                elevation: 12.0,
                child: wrapWithModel(
                  model: _model.pdfListDrawerModel,
                  updateCallback: () => setState(() {}),
                  child: PdfListDrawerWidget(),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<MessagesRecord>>(
                stream: queryMessagesRecord(
                  queryBuilder: (messagesRecord) => messagesRecord
                      .where(
                        'uid',
                        isEqualTo: currentUserReference,
                      )
                      .where(
                        'pineconeNamespace',
                        isEqualTo: FFAppState().pineconeNamespace,
                      )
                      .orderBy('timestamp', descending: true),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<MessagesRecord> gradientMessagesRecordList =
                      snapshot.data!;
                  return Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
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
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            constraints: BoxConstraints(
                              maxWidth: 1100.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 30.0),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
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
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 4.0,
                                                      buttonSize: 35.0,
                                                      fillColor:
                                                          Color(0x00FFFFFF),
                                                      hoverColor:
                                                          Color(0xA62E313C),
                                                      hoverIconColor:
                                                          Colors.white,
                                                      icon: Icon(
                                                        Icons.menu_rounded,
                                                        color:
                                                            Color(0xFFBBC5D3),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'CHAT_NORMAL_PAGE_menu_rounded_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_drawer');
                                                        scaffoldKey
                                                            .currentState!
                                                            .openDrawer();
                                                      },
                                                    ),
                                                  ),
                                                  Text(
                                                    FFAppState()
                                                        .pineconeNamespace,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: 33.0,
                                                    height: 33.0,
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ],
                                              ),
                                              ClipRRect(
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.754,
                                                  height: 28.0,
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible:
                                                        valueOrDefault<bool>(
                                                      FFAppState()
                                                          .awaitingReply,
                                                      false,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Lottie.network(
                                                        'https://lottie.host/bfeb5df1-933d-4dff-bdbb-4ecfca0d250d/fYqSuobRDk.json',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.55,
                                                        height: 44.0,
                                                        fit: BoxFit.cover,
                                                        animate: true,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 10.0,
                                                          15.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 100.0,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 700.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final message =
                                                            gradientMessagesRecordList
                                                                .toList();
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          reverse: true,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              message.length,
                                                          itemBuilder: (context,
                                                              messageIndex) {
                                                            final messageItem =
                                                                message[
                                                                    messageIndex];
                                                            return ChatBubblesWidget(
                                                              key: Key(
                                                                  'Keyp3s_${messageIndex}_of_${message.length}'),
                                                              messageText:
                                                                  messageItem
                                                                      .message,
                                                              gptResponse:
                                                                  !messageItem
                                                                      .user,
                                                              userMessage:
                                                                  messageItem
                                                                      .user,
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (FFAppState().awaitingReply)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 5.0, 15.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 700.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.auto_awesome,
                                                            color: Colors.white,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Lottie.asset(
                                                          'assets/lottie_animations/6652-dote-typing-animation.json',
                                                          width: 38.0,
                                                          height: 72.0,
                                                          fit: BoxFit.fitHeight,
                                                          animate: true,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 25.0, 0.0, 30.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 750.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: ClipRRect(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 66.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode,
                                                                  onFieldSubmitted:
                                                                      (_) async {
                                                                    logFirebaseEvent(
                                                                        'CHAT_NORMAL_TextField_cei2tn9o_ON_TEXTFI');
                                                                    logFirebaseEvent(
                                                                        'TextField_update_app_state');
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .pineconeNamespace =
                                                                          widget
                                                                              .pdfdoc!
                                                                              .pineconeNamespace;
                                                                      FFAppState()
                                                                              .prompt =
                                                                          _model
                                                                              .textController
                                                                              .text;
                                                                      FFAppState()
                                                                              .awaitingReply =
                                                                          true;
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'TextField_backend_call');

                                                                    var chatsRecordReference =
                                                                        ChatsRecord
                                                                            .collection
                                                                            .doc();
                                                                    await chatsRecordReference
                                                                        .set(
                                                                            createChatsRecordData(
                                                                      uid:
                                                                          currentUserReference,
                                                                      timestamp:
                                                                          getCurrentTimestamp,
                                                                      email:
                                                                          currentUserEmail,
                                                                      pineconeNamespace:
                                                                          FFAppState()
                                                                              .pineconeNamespace,
                                                                      title: widget
                                                                          .pdfdoc
                                                                          ?.title,
                                                                    ));
                                                                    _model.chasasCopy13 =
                                                                        ChatsRecord.getDocumentFromData(
                                                                            createChatsRecordData(
                                                                              uid: currentUserReference,
                                                                              timestamp: getCurrentTimestamp,
                                                                              email: currentUserEmail,
                                                                              pineconeNamespace: FFAppState().pineconeNamespace,
                                                                              title: widget.pdfdoc?.title,
                                                                            ),
                                                                            chatsRecordReference);
                                                                    logFirebaseEvent(
                                                                        'TextField_backend_call');

                                                                    var messagesRecordReference1 =
                                                                        MessagesRecord.createDoc(_model
                                                                            .chasasCopy13!
                                                                            .reference);
                                                                    await messagesRecordReference1
                                                                        .set(
                                                                            createMessagesRecordData(
                                                                      timestamp:
                                                                          getCurrentTimestamp,
                                                                      firstMessage:
                                                                          true,
                                                                      message:
                                                                          FFAppState()
                                                                              .prompt,
                                                                      uid:
                                                                          currentUserReference,
                                                                      user:
                                                                          true,
                                                                      email:
                                                                          currentUserEmail,
                                                                      pineconeNamespace:
                                                                          FFAppState()
                                                                              .pineconeNamespace,
                                                                      title: widget
                                                                          .pdfdoc
                                                                          ?.title,
                                                                    ));
                                                                    _model.msg13 =
                                                                        MessagesRecord.getDocumentFromData(
                                                                            createMessagesRecordData(
                                                                              timestamp: getCurrentTimestamp,
                                                                              firstMessage: true,
                                                                              message: FFAppState().prompt,
                                                                              uid: currentUserReference,
                                                                              user: true,
                                                                              email: currentUserEmail,
                                                                              pineconeNamespace: FFAppState().pineconeNamespace,
                                                                              title: widget.pdfdoc?.title,
                                                                            ),
                                                                            messagesRecordReference1);
                                                                    logFirebaseEvent(
                                                                        'TextField_clear_text_fields_pin_codes');
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .textController
                                                                          ?.clear();
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'TextField_wait__delay');
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            1000));
                                                                    logFirebaseEvent(
                                                                        'TextField_backend_call');
                                                                    _model.gptResponsett13 =
                                                                        await LoadtestoneCall
                                                                            .call(
                                                                      question:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        FFAppState()
                                                                            .prompt,
                                                                        '자료를 요약하라.',
                                                                      ),
                                                                      temperature:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        FFAppState()
                                                                            .temperature,
                                                                        0.0,
                                                                      ),
                                                                      modelName:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        FFAppState()
                                                                            .model,
                                                                        'gpt-4',
                                                                      ),
                                                                      systemMessagePrompt:
                                                                          FFAppState()
                                                                              .system,
                                                                      maxTokens:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        FFAppState()
                                                                            .maxtoken,
                                                                        3000,
                                                                      ),
                                                                      basePath:
                                                                          FFAppState()
                                                                              .pineconeNamespace,
                                                                    );
                                                                    if ((_model
                                                                            .gptResponsett13
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'TextField_backend_call');

                                                                      await MessagesRecord.createDoc(_model
                                                                              .chasasCopy13!
                                                                              .reference)
                                                                          .set(
                                                                              createMessagesRecordData(
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                        firstMessage:
                                                                            false,
                                                                        message:
                                                                            (_model.gptResponsett13?.jsonBody ?? '').toString(),
                                                                        uid:
                                                                            currentUserReference,
                                                                        user:
                                                                            false,
                                                                        email:
                                                                            currentUserEmail,
                                                                        pineconeNamespace:
                                                                            FFAppState().pineconeNamespace,
                                                                        title: widget
                                                                            .pdfdoc
                                                                            ?.title,
                                                                      ));
                                                                      logFirebaseEvent(
                                                                          'TextField_update_app_state');
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().awaitingReply =
                                                                            false;
                                                                      });
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'TextField_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: PopupWidget(
                                                                                title: '실패',
                                                                                txt: '호출에 실패하였습니다.',
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));

                                                                      logFirebaseEvent(
                                                                          'TextField_update_app_state');
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().awaitingReply =
                                                                            false;
                                                                      });
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .send,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        '입력',
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  validator: _model
                                                                      .textControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      22.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'CHAT_NORMAL_PAGE_전송_BTN_ON_TAP');
                                                              var _shouldSetState =
                                                                  false;
                                                              logFirebaseEvent(
                                                                  'Button_update_app_state');
                                                              setState(() {
                                                                FFAppState()
                                                                        .pineconeNamespace =
                                                                    widget
                                                                        .pdfdoc!
                                                                        .pineconeNamespace;
                                                                FFAppState()
                                                                        .prompt =
                                                                    _model
                                                                        .textController
                                                                        .text;
                                                                FFAppState()
                                                                        .awaitingReply =
                                                                    true;
                                                              });
                                                              logFirebaseEvent(
                                                                  'Button_backend_call');

                                                              var chatsRecordReference =
                                                                  ChatsRecord
                                                                      .collection
                                                                      .doc();
                                                              await chatsRecordReference
                                                                  .set(
                                                                      createChatsRecordData(
                                                                uid:
                                                                    currentUserReference,
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                email:
                                                                    currentUserEmail,
                                                                pineconeNamespace:
                                                                    FFAppState()
                                                                        .pineconeNamespace,
                                                                title: widget
                                                                    .pdfdoc
                                                                    ?.title,
                                                              ));
                                                              _model.chasas = ChatsRecord
                                                                  .getDocumentFromData(
                                                                      createChatsRecordData(
                                                                        uid:
                                                                            currentUserReference,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                        email:
                                                                            currentUserEmail,
                                                                        pineconeNamespace:
                                                                            FFAppState().pineconeNamespace,
                                                                        title: widget
                                                                            .pdfdoc
                                                                            ?.title,
                                                                      ),
                                                                      chatsRecordReference);
                                                              _shouldSetState =
                                                                  true;
                                                              logFirebaseEvent(
                                                                  'Button_backend_call');

                                                              var messagesRecordReference1 =
                                                                  MessagesRecord
                                                                      .createDoc(_model
                                                                          .chasas!
                                                                          .reference);
                                                              await messagesRecordReference1
                                                                  .set(
                                                                      createMessagesRecordData(
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                firstMessage:
                                                                    true,
                                                                message:
                                                                    FFAppState()
                                                                        .prompt,
                                                                uid:
                                                                    currentUserReference,
                                                                user: true,
                                                                email:
                                                                    currentUserEmail,
                                                                pineconeNamespace:
                                                                    FFAppState()
                                                                        .pineconeNamespace,
                                                                title: widget
                                                                    .pdfdoc
                                                                    ?.title,
                                                              ));
                                                              _model.msg1Copy2CopyCopy =
                                                                  MessagesRecord
                                                                      .getDocumentFromData(
                                                                          createMessagesRecordData(
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            firstMessage:
                                                                                true,
                                                                            message:
                                                                                FFAppState().prompt,
                                                                            uid:
                                                                                currentUserReference,
                                                                            user:
                                                                                true,
                                                                            email:
                                                                                currentUserEmail,
                                                                            pineconeNamespace:
                                                                                FFAppState().pineconeNamespace,
                                                                            title:
                                                                                widget.pdfdoc?.title,
                                                                          ),
                                                                          messagesRecordReference1);
                                                              _shouldSetState =
                                                                  true;
                                                              logFirebaseEvent(
                                                                  'Button_clear_text_fields_pin_codes');
                                                              setState(() {
                                                                _model
                                                                    .textController
                                                                    ?.clear();
                                                              });
                                                              logFirebaseEvent(
                                                                  'Button_backend_call');
                                                              _model.gptResponseCopy4CopyCopy =
                                                                  await LoadtestoneCall
                                                                      .call(
                                                                question:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  FFAppState()
                                                                      .prompt,
                                                                  '자료를 요약하라.',
                                                                ),
                                                                temperature:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  FFAppState()
                                                                      .temperature,
                                                                  0.0,
                                                                ),
                                                                modelName:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  FFAppState()
                                                                      .model,
                                                                  'gpt-4',
                                                                ),
                                                                systemMessagePrompt:
                                                                    FFAppState()
                                                                        .system,
                                                                maxTokens:
                                                                    FFAppState()
                                                                        .maxtoken,
                                                                basePath:
                                                                    FFAppState()
                                                                        .pineconeNamespace,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .gptResponseCopy4CopyCopy
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                logFirebaseEvent(
                                                                    'Button_backend_call');

                                                                await MessagesRecord.createDoc(_model
                                                                        .chasas!
                                                                        .reference)
                                                                    .set(
                                                                        createMessagesRecordData(
                                                                  timestamp:
                                                                      getCurrentTimestamp,
                                                                  firstMessage:
                                                                      false,
                                                                  message: (_model
                                                                              .gptResponseCopy4CopyCopy
                                                                              ?.jsonBody ??
                                                                          '')
                                                                      .toString(),
                                                                  uid:
                                                                      currentUserReference,
                                                                  user: false,
                                                                  email:
                                                                      currentUserEmail,
                                                                  pineconeNamespace:
                                                                      widget
                                                                          .pdfdoc
                                                                          ?.pineconeNamespace,
                                                                  title: widget
                                                                      .pdfdoc
                                                                      ?.title,
                                                                ));
                                                                logFirebaseEvent(
                                                                    'Button_update_app_state');
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .awaitingReply =
                                                                      false;
                                                                });
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Button_show_snack_bar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Oops, looks like that didn\'t go through. Let\'s try again!',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                logFirebaseEvent(
                                                                    'Button_update_app_state');
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .awaitingReply =
                                                                      false;
                                                                });
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                            },
                                                            text: '전송',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation']!),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
