import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pdf_list_drawer_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'table_model.dart';
export 'table_model.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  late TableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'table'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TABLE_PAGE_table_ON_INIT_STATE');
      logFirebaseEvent('table_update_app_state');
      setState(() {
        FFAppState().filterDone = false;
      });
      if (currentUserEmail != 'admin@hoca.dev') {
        logFirebaseEvent('table_navigate_to');

        context.goNamed('home');
      }
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).primaryText,
            hoverIconColor: FlutterFlowTheme.of(context).alternate,
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('TABLE_PAGE_menu_ICN_ON_TAP');
              logFirebaseEvent('IconButton_drawer');
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('TABLE_PAGE_Text_axkmj8hd_ON_TAP');
              logFirebaseEvent('Text_navigate_to');

              context.goNamed('table');
            },
            child: Text(
              '어드민',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Product Sans',
                    color: Colors.white,
                    fontSize: 22.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
            child: StreamBuilder<List<MessagesRecord>>(
              stream: queryMessagesRecord(),
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
                List<MessagesRecord> containerMessagesRecordList =
                    snapshot.data!;
                return Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(),
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
                            List<UsersRecord> containerUsersRecordList =
                                snapshot.data!;
                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          11.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDownValueController1 ??=
                                                FormFieldController<String>(
                                          _model.dropDownValue1 ??=
                                              FFAppState().emailDropdown,
                                        ),
                                        options: containerUsersRecordList
                                            .map((e) => e.email)
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.dropDownValue1 = val);
                                          logFirebaseEvent(
                                              'TABLE_DropDown_em10l73j_ON_FORM_WIDGET_S');
                                          logFirebaseEvent(
                                              'DropDown_update_app_state');
                                          setState(() {
                                            FFAppState().emailDropdown =
                                                valueOrDefault<String>(
                                              _model.dropDownValue1,
                                              'admin@hoca.dev',
                                            );
                                          });
                                        },
                                        width: 300.0,
                                        height: 50.0,
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: '이메일 필터',
                                        searchHintText: '아이디 검색',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDownValueController2 ??=
                                                FormFieldController<String>(
                                          _model.dropDownValue2 ??= '선택',
                                        ),
                                        options: ['User', 'Assistant', '선택'],
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.dropDownValue2 = val);
                                          logFirebaseEvent(
                                              'TABLE_DropDown_tj6wu14i_ON_FORM_WIDGET_S');
                                          if (_model.dropDownValue2 == 'User') {
                                            logFirebaseEvent(
                                                'DropDown_update_app_state');
                                            setState(() {
                                              FFAppState().userW = 'True';
                                            });
                                          } else if (_model.dropDownValue2 ==
                                              '전체') {
                                            logFirebaseEvent(
                                                'DropDown_update_app_state');
                                            setState(() {
                                              FFAppState().userW = '전체';
                                            });
                                            logFirebaseEvent(
                                                'DropDown_navigate_to');

                                            context.goNamed('table');
                                          } else {
                                            logFirebaseEvent(
                                                'DropDown_update_app_state');
                                            setState(() {
                                              FFAppState().userW = 'False';
                                            });
                                          }
                                        },
                                        width: 300.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: '질문 필터',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'TABLE_PAGE_필터_BTN_ON_TAP');
                                      logFirebaseEvent(
                                          'Button_firestore_query');
                                      _model.filterQuery1 =
                                          await queryMessagesRecordOnce(
                                        queryBuilder: (messagesRecord) =>
                                            messagesRecord
                                                .where(
                                          'email',
                                          isEqualTo: FFAppState().emailDropdown,
                                        )
                                                .where(
                                          'user',
                                          isEqualTo: () {
                                            if (FFAppState().userW == 'True') {
                                              return true;
                                            } else if (FFAppState().userW ==
                                                'False') {
                                              return false;
                                            } else if (FFAppState().userW ==
                                                '전체') {
                                              return null;
                                            } else {
                                              return null;
                                            }
                                          }(),
                                        ).orderBy('timestamp',
                                                    descending: true),
                                      );
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      setState(() {
                                        FFAppState().filterDone = true;
                                      });

                                      setState(() {});
                                    },
                                    text: '필터',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            logFirebaseEvent(
                                                'TABLE_TextField_1glhyyvy_ON_TEXTFIELD_CH');
                                            logFirebaseEvent(
                                                'TextField_update_app_state');
                                            setState(() {
                                              FFAppState().message =
                                                  _model.textController.text;
                                            });
                                          },
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '자료 검색',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        11.0, 0.0, 11.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'TABLE_PAGE_검색_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_simple_search');
                                        safeSetState(() {
                                          _model
                                              .simpleSearchResults = TextSearch(
                                            containerMessagesRecordList
                                                .map(
                                                  (record) => TextSearchItem(
                                                      record, [
                                                    record.message!,
                                                    record.title!,
                                                    record.email!,
                                                    record.pineconeNamespace!
                                                  ]),
                                                )
                                                .toList(),
                                          )
                                              .search(
                                                  _model.textController.text)
                                              .map((r) => r.object)
                                              .toList();
                                          ;
                                        });
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        setState(() {
                                          FFAppState().filterDone = true;
                                        });
                                      },
                                      text: '검색',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Email',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'User/Assistant',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '제목',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        '메세지',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            11.0, 0.0, 11.0, 0.0),
                                        child: Text(
                                          '시간',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final searchList =
                                  _model.simpleSearchResults.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchList.length,
                                itemBuilder: (context, searchListIndex) {
                                  final searchListItem =
                                      searchList[searchListIndex];
                                  return Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              searchListItem.email,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
                                              searchListItem.user
                                                  ? 'User'
                                                  : 'Assistant',
                                              'All',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            searchListItem.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            searchListItem.message,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    11.0, 0.0, 11.0, 0.0),
                                            child: Text(
                                              dateTimeFormat('M/d H:mm',
                                                  searchListItem.timestamp!),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        if (FFAppState().filterDone != true)
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: PagedListView<DocumentSnapshot<Object?>?,
                                MessagesRecord>(
                              pagingController: _model.setListViewController3(
                                MessagesRecord.collection()
                                    .orderBy('timestamp', descending: true),
                              ),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              reverse: false,
                              scrollDirection: Axis.vertical,
                              builderDelegate:
                                  PagedChildBuilderDelegate<MessagesRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
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
                                // Customize what your widget looks like when it's loading another page.
                                newPageProgressIndicatorBuilder: (_) => Center(
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

                                itemBuilder: (context, _, listViewIndex) {
                                  final listViewMessagesRecord = _model
                                      .listViewPagingController3!
                                      .itemList![listViewIndex];
                                  return Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              listViewMessagesRecord.email,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
                                              listViewMessagesRecord.user
                                                  ? 'User'
                                                  : 'Assistant',
                                              'All',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            listViewMessagesRecord.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            listViewMessagesRecord.message,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    11.0, 0.0, 11.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                  'M/d H:mm',
                                                  listViewMessagesRecord
                                                      .timestamp!),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
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
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final filterList =
                                  _model.filterQuery1?.toList() ?? [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: filterList.length,
                                itemBuilder: (context, filterListIndex) {
                                  final filterListItem =
                                      filterList[filterListIndex];
                                  return Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              filterListItem.email,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
                                              filterListItem.user
                                                  ? 'User'
                                                  : 'Assistant',
                                              'All',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            filterListItem.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            filterListItem.message,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    11.0, 0.0, 11.0, 0.0),
                                            child: Text(
                                              dateTimeFormat('M/d H:mm',
                                                  filterListItem.timestamp!),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
