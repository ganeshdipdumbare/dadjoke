import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({Key? key}) : super(key: key);

  @override
  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-60, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(0, -40),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1200.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 600.ms,
          begin: Offset(0, -40),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  ApiCallResponse? apiResult;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: DadJokeCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final welcomePageDadJokeResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.433,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          valueOrDefault<String>(
                            'https://avatars.dicebear.com/api/big-smile/${dateTimeFormat('jms', getCurrentTimestamp)}.jpg',
                            'test.jpg',
                          ),
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(31),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        width: 2,
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                  Container(
                    width: 100,
                    height: 23.5,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Text(
                      'by Ashley Seo. Licensed under CC BY 4.0',
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.425,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(30, 40, 30, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SelectionArea(
                                  child: Text(
                                'Dad\'s joke ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Merriweather',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation1']!),
                              if (welcomePageDadJokeResponse.succeeded == true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 25, 0, 0),
                                  child: SelectionArea(
                                      child: AutoSizeText(
                                    DadJokeCall.joke(
                                      welcomePageDadJokeResponse.jsonBody,
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Source Sans Pro',
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  )).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation2']!),
                                ),
                              FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  apiResult = await DadJokeCall.call();
                                  _shouldSetState = true;
                                  if (welcomePageDadJokeResponse.succeeded ==
                                      true) {
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Going too fast!'),
                                        content: Text(
                                            'Dad is thinking, give it a time...'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Tell me one more!',
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 50,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 20,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FlutterFlowAdBanner(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          showsTestAd: true,
                          androidAdUnitID:
                              'ca-app-pub-3717412136528196/5030162958',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
