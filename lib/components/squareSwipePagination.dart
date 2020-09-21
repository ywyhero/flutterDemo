import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class SquareSwipePagination extends SwiperPlugin {
  final Color activeColor;
  final Color color;
  final double activeSize;
  final double size;
  final double space;
  final Key key;

  const SquareSwipePagination({this.activeColor, this.color, this.activeSize: 10, this.size: 10, this.space: 3, this.key});
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    if(config.itemCount > 20) {
      print("The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
    }
    Color activeColor = this.activeColor;
    Color color = this.color;
    if(this.activeColor == null || this.color == null) {
      ThemeData themeData = Theme.of(context);
      activeColor = this.activeColor ?? themeData.primaryColor;
      color = this.color ?? themeData.scaffoldBackgroundColor;
    }
    if(config.indicatorLayout != PageIndicatorLayout.NONE && config.layout == SwiperLayout.DEFAULT) {
      return new PageIndicator(
        count: config.itemCount,
        controller: config.pageController,
        layout: config.indicatorLayout,
        size: size,
        activeColor: activeColor,
        color: color,
        space: space,
      );
    }
    List<Widget> list = [];
    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;
    for(int i = 0; i < itemCount; i++) {
      bool active = i == activeIndex;
      list.add(
        Container(
          key: Key("pagination_$i"),
          margin: EdgeInsets.all(space),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size/2),
              color: active ? activeColor : color
            ),
            width: active ? activeSize * 2 : size,
            height: active ? activeSize : size,
          ),
        )
      );
    }
    if(config.scrollDirection == Axis.vertical) {
      return new Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return new Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list
      );
    }
  }
}                                                                                                                                                                                                                                                                                                                                                                                                        