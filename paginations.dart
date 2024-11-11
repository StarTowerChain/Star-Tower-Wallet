import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SwiperCustomPagination createPagination(BuildContext context) {
  return SwiperCustomPagination(
      builder: (BuildContext context, SwiperPluginConfig? config) {
    List<Widget> list = [];

    int itemCount = config?.itemCount ?? 0;
    int activeIndex = config?.activeIndex ?? 0;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(Opacity(
        opacity: active ? 1 : 0.5,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: active ? 20.w : 10.w,
          height: 10.w,
          margin: EdgeInsets.only(left: 10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.w),
              color: active
                  ? const Color(0xff667DF6)
                  : Colors.white.withOpacity(0.5)),
        ),
      ));
    }

    if (config?.scrollDirection == Axis.vertical) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return Align(
        alignment: const Alignment(0,0.85),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: list,
        ),
      );
    }
  });
}
