import '/flutter_flow/flutter_flow_util.dart';
import 'flyerpage_widget.dart' show FlyerpageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FlyerpageModel extends FlutterFlowModel<FlyerpageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [AdMob - Show Interstitial Ad] action in flyerpage widget.
  bool? interstitialAdSuccess;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
