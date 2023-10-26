import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/configure_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pdf_list_drawer_model.dart';
export 'pdf_list_drawer_model.dart';

class PdfListDrawerWidget extends StatefulWidget {
  const PdfListDrawerWidget({Key? key}) : super(key: key);

  @override
  _PdfListDrawerWidgetState createState() => _PdfListDrawerWidgetState();
}

class _PdfListDrawerWidgetState extends State<PdfListDrawerWidget> {
  late PdfListDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfListDrawerModel());

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

    return StreamBuilder<List<PdfsRecord>>(
      stream: queryPdfsRecord(
        queryBuilder: (pdfsRecord) =>
            pdfsRecord.orderBy('create', descending: true),
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
        List<PdfsRecord> containerPdfsRecordList = snapshot.data!;
        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          constraints: BoxConstraints(
            maxWidth: 444.0,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 30.0, 15.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('PDF_LIST_DRAWER_COMP_lightMode_ON_TAP');
                    logFirebaseEvent('lightMode_navigate_to');

                    context.pushNamed('home');
                  },
                  child: Image.asset(
                    'assets/images/shinLogo.png',
                    width: 44.0,
                    height: 44.0,
                    fit: BoxFit.contain,
                    alignment: Alignment(0.00, 0.00),
                  ),
                ),
                if (currentUserEmail == 'admin@hoca.dev')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'PDF_LIST_DRAWER_COMP_자료_추가_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.goNamed(
                          'Homeadmin',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                      text: '자료 추가',
                      icon: Icon(
                        Icons.library_add,
                        size: 16.0,
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00AFB5BF),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFA8B1BD),
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(18.0),
                        hoverColor: Color(0xFF262B33),
                        hoverTextColor: Colors.white,
                        hoverElevation: 0.0,
                      ),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                    child: Builder(
                      builder: (context) {
                        final pdfs = containerPdfsRecordList.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: pdfs.length,
                          itemBuilder: (context, pdfsIndex) {
                            final pdfsItem = pdfs[pdfsIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PDF_LIST_DRAWER_Container_tnx0jqk9_ON_TA');
                                  logFirebaseEvent(
                                      'Container_update_app_state');
                                  setState(() {
                                    FFAppState().awaitingReply = false;
                                    FFAppState().pineconeNamespace =
                                        pdfsItem.pineconeNamespace;
                                    FFAppState().model = pdfsItem.model;
                                    FFAppState().chunksize = pdfsItem.chunkSize;
                                    FFAppState().chunkoverwrap =
                                        pdfsItem.chunkoverwrap;
                                    FFAppState().temperature =
                                        pdfsItem.temperature;
                                    FFAppState().system = pdfsItem.system;
                                    FFAppState().maxtoken = pdfsItem.maxtoken;
                                  });
                                  logFirebaseEvent('Container_backend_call');

                                  var chatsRecordReference =
                                      ChatsRecord.collection.doc();
                                  await chatsRecordReference
                                      .set(createChatsRecordData(
                                    uid: currentUserReference,
                                    timestamp: getCurrentTimestamp,
                                    email: currentUserEmail,
                                    pineconeNamespace:
                                        pdfsItem.pineconeNamespace,
                                    title: pdfsItem.title,
                                  ));
                                  _model.newchat =
                                      ChatsRecord.getDocumentFromData(
                                          createChatsRecordData(
                                            uid: currentUserReference,
                                            timestamp: getCurrentTimestamp,
                                            email: currentUserEmail,
                                            pineconeNamespace:
                                                pdfsItem.pineconeNamespace,
                                            title: pdfsItem.title,
                                          ),
                                          chatsRecordReference);
                                  logFirebaseEvent('Container_navigate_to');

                                  context.goNamed(
                                    'ChatNormal',
                                    queryParameters: {
                                      'pdfdoc': serializeParam(
                                        pdfsItem,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'pdfdoc': pdfsItem,
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );

                                  setState(() {});
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.88,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 0.25,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        pdfsItem.title,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                      ),
                                      Text(
                                        dateTimeFormat('yMd', pdfsItem.create!),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          if (currentUserEmail ==
                                              'admin@hoca.dev')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 33.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                icon: Icon(
                                                  Icons
                                                      .restore_from_trash_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 16.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'PDF_LIST_DRAWER_restore_from_trash_outli');
                                                  logFirebaseEvent(
                                                      'IconButton_backend_call');
                                                  await pdfsItem.reference
                                                      .delete();
                                                },
                                              ),
                                            ),
                                          if (currentUserEmail ==
                                              'admin@hoca.dev')
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 33.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                icon: Icon(
                                                  Icons.confirmation_num,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 17.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'PDF_LIST_DRAWER_confirmation_num_ICN_ON_');
                                                  logFirebaseEvent(
                                                      'IconButton_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: ConfigureWidget(
                                                          pdf: pdfsItem,
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  fillColor: Color(0x00AFB5BF),
                  hoverColor: Color(0x8C191921),
                  hoverIconColor: Colors.white,
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Color(0xFFA8B1BD),
                    size: 20.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('PDF_LIST_DRAWER_exit_to_app_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_auth');
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('SignIn', context.mounted);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
