import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_bubbles_model.dart';
export 'chat_bubbles_model.dart';

class ChatBubblesWidget extends StatefulWidget {
  const ChatBubblesWidget({
    Key? key,
    required this.messageText,
    required this.gptResponse,
    required this.userMessage,
  }) : super(key: key);

  final String? messageText;
  final bool? gptResponse;
  final bool? userMessage;

  @override
  _ChatBubblesWidgetState createState() => _ChatBubblesWidgetState();
}

class _ChatBubblesWidgetState extends State<ChatBubblesWidget> {
  late ChatBubblesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBubblesModel());

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

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (widget.gptResponse == true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 5.0, 0.0),
                    child: Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.66,
                          constraints: BoxConstraints(
                            maxWidth: 666.0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xB2272A32),
                            borderRadius: BorderRadius.circular(18.0),
                            border: Border.all(
                              color: Color(0xB2272A32),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 10.0),
                                child: SelectionArea(
                                    child: Text(
                                  widget.messageText!,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                )),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 33.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                icon: Icon(
                                  Icons.content_copy,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 14.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CHAT_BUBBLES_content_copy_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_copy_to_clipboard');
                                  await Clipboard.setData(
                                      ClipboardData(text: widget.messageText!));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100.0,
                      height: 20.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ],
              ),
            ),
          if (widget.userMessage == true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100.0,
                      height: 20.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: MouseRegion(
                            opaque: false,
                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x0FFFFFFF),
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(
                                  color: Color(0x0FFFFFFF),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 10.0),
                                    child: SelectionArea(
                                        child: Text(
                                      widget.messageText!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 11.5,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    )),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 33.0,
                                    fillColor: Color(0x00FFFFFF),
                                    icon: Icon(
                                      Icons.content_copy,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 14.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CHAT_BUBBLES_content_copy_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_copy_to_clipboard');
                                      await Clipboard.setData(ClipboardData(
                                          text: widget.messageText!));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered = true);
                            }),
                            onExit: ((event) async {
                              setState(() => _model.mouseRegionHovered = false);
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7.0, 4.0, 7.0, 0.0),
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/1676852949201025.jpg',
                          ).image,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).customColor1,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
