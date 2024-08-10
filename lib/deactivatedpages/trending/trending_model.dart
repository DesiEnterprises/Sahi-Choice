import '/flutter_flow/flutter_flow_util.dart';
import 'trending_widget.dart' show TrendingWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class TrendingModel extends FlutterFlowModel<TrendingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController1;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController2;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController3;

  @override
  void initState(BuildContext context) {
    swipeableStackController1 = CardSwiperController();
    swipeableStackController2 = CardSwiperController();
    swipeableStackController3 = CardSwiperController();
  }

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
