import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/src/commons/consts/app_color.dart';
import 'package:flutter_bloc_api/src/features/home/components/card_home_component.dart';

class HomeContainerComponent extends StatelessWidget {
  const HomeContainerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      height: currentHeight * 0.6,
      width: currentWidth * 0.7,
      child: CardHomeComponent(
          currentHeight: currentHeight, currentWidth: currentWidth),
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColorGrey,
              offset: const Offset(5, 5),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: AppColor.shadowColorWhite,
              offset: Offset(-5, -5),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ]),
    );
  }
}
