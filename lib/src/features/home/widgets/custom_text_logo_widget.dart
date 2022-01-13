import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/src/commons/consts/app_color.dart';

class CustomTextLogoWidget extends StatelessWidget {
  const CustomTextLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Bored ?',
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColor.primaryColor,
          fontSize: 65,
          fontStyle: FontStyle.italic,
          shadows: [
            BoxShadow(
              color: AppColor.shadowColorGrey,
              offset: const Offset(2, 2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: AppColor.shadowColorWhiteLogo,
              offset: Offset(-3, -3),
              blurRadius: 5,
              spreadRadius: 1,
            )
          ]),
    );
  }
}
