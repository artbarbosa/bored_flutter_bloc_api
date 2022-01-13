import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/src/commons/consts/app_color.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({Key? key, required this.state}) : super(key: key);

  final state;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(text: state.activityName),
      strutStyle: const StrutStyle(),
      maxLines: 3,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: AppColor.textHomeColor,
        fontSize: 25,
        leadingDistribution: TextLeadingDistribution.proportional,
      ),
    );
  }
}
