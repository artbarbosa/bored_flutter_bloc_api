import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/src/commons/consts/app_color.dart';
import 'package:flutter_bloc_api/src/features/home/bloc/home_bloc.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key? key, required this.currentHeight, required this.currentWidth})
      : super(key: key);

  final double currentHeight;
  final double currentWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child:  const Text("Let's find you something to do", style: TextStyle(color: Colors.white),),
      onPressed: () => BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()),
      style: ElevatedButton.styleFrom(
        elevation: 6,
        side: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
        shadowColor: AppColor.shadowColorGrey,
        fixedSize: Size(currentWidth * 0.65, currentWidth * 0.15),
        primary: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
