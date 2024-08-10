import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'flyerpage_model.dart';
export 'flyerpage_model.dart';

class FlyerpageWidget extends StatefulWidget {
  const FlyerpageWidget({
    super.key,
    this.refretailer,
    this.flyerref,
    this.searchref,
  });

  final DocumentReference? refretailer;
  final DocumentReference? flyerref;
  final DocumentReference? searchref;

  @override
  State<FlyerpageWidget> createState() => _FlyerpageWidgetState();
}

class _FlyerpageWidgetState extends State<FlyerpageWidget> {
  late FlyerpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlyerpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      admob.loadInterstitialAd(
        "ca-app-pub-6470097353136252/6381575201",
        "ca-app-pub-6470097353136252/6381575201",
        false,
      );

      unawaited(
        () async {
          _model.interstitialAdSuccess = await admob.showInterstitialAd();
        }(),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RetailerRecord>(
      stream: RetailerRecord.getDocument(widget.refretailer!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 70.0,
                height: 70.0,
                child: SpinKitFadingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 70.0,
                ),
              ),
            ),
          );
        }

        final flyerpageRetailerRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: Text(
                valueOrDefault<String>(
                  flyerpageRetailerRecord.flyername,
                  'flyer title',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 12.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondary,
                    icon: Icon(
                      Icons.search_rounded,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        'searchpage',
                        queryParameters: {
                          'refrence': serializeParam(
                            widget.searchref,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).secondary,
                      FlutterFlowTheme.of(context).primaryBackground
                    ],
                    stops: const [0.0, 1.0],
                    begin: const AlignmentDirectional(0.0, -1.0),
                    end: const AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: StreamBuilder<List<FlyersRecord>>(
                            stream: queryFlyersRecord(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: SpinKitFadingCube(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 70.0,
                                    ),
                                  ),
                                );
                              }
                              List<FlyersRecord> carouselFlyersRecordList =
                                  snapshot.data!;
                              if (carouselFlyersRecordList.isEmpty) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Image.asset(
                                    'assets/images/images.png',
                                    width: double.infinity,
                                    height: 500.0,
                                    fit: BoxFit.fill,
                                  ),
                                );
                              }

                              return SizedBox(
                                width: double.infinity,
                                height: 480.0,
                                child: CarouselSlider.builder(
                                  itemCount: carouselFlyersRecordList.length,
                                  itemBuilder: (context, carouselIndex, _) {
                                    final carouselFlyersRecord =
                                        carouselFlyersRecordList[carouselIndex];
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        carouselFlyersRecord.flyerImages.first,
                                        width: 350.0,
                                        height: 200.0,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                  carouselController:
                                      _model.carouselController ??=
                                          CarouselController(),
                                  options: CarouselOptions(
                                    initialPage: max(
                                        0,
                                        min(
                                            0,
                                            carouselFlyersRecordList.length -
                                                1)),
                                    viewportFraction: 0.85,
                                    disableCenter: true,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.2,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: false,
                                    onPageChanged: (index, _) =>
                                        _model.carouselCurrentIndex = index,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Divider(
                          height: 20.0,
                          thickness: 1.8,
                          indent: 5.0,
                          endIndent: 5.0,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: FlutterFlowAdBanner(
                            width: double.infinity,
                            height: 80.0,
                            showsTestAd: false,
                            iOSAdUnitID:
                                'ca-app-pub-6470097353136252/8696619103',
                            androidAdUnitID:
                                'ca-app-pub-6470097353136252/8696619103',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '0zsgeoem' /* Explore more offers */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: StreamBuilder<List<ProductsRecord>>(
                            stream: queryProductsRecord(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: SpinKitFadingCube(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 70.0,
                                    ),
                                  ),
                                );
                              }
                              List<ProductsRecord> rowProductsRecordList =
                                  snapshot.data!;

                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    rowProductsRecordList.length, (rowIndex) {
                                  final rowProductsRecord =
                                      rowProductsRecordList[rowIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'retailerpage',
                                        queryParameters: {
                                          'homeref': serializeParam(
                                            widget.refretailer,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          rowProductsRecord.image,
                                          width: 142.0,
                                          height: 127.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
