import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/src/commons/consts/app_color.dart';
import 'package:flutter_bloc_api/src/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_api/src/features/home/widgets/custom_button_widget.dart';
import 'package:flutter_bloc_api/src/features/home/widgets/custom_text_widget.dart';
import 'package:lottie/lottie.dart';

class CardHomeComponent extends StatelessWidget {
  const CardHomeComponent(
      {Key? key, required this.currentHeight, required this.currentWidth})
      : super(key: key);

  final double currentHeight;
  final double currentWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoadingState) {
        return Column(
          children: [
            Center(child: Lottie.asset('assets/images/search.json')),
            SizedBox(height: currentHeight * 0.05),
            CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          ],
        );
      }
      if (state is HomeLoadedState) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: CustomTextWidget(state: state),
            ),
            Padding(
              padding: EdgeInsets.only(top: currentHeight * 0.38),
              child: CustomButtonWidget(
                currentHeight: currentHeight,
                currentWidth: currentWidth,
              ),
            ),
          ],
        );
      }
      if (state is HomeNoInternetState) {
        return const Text('no internet :(');
      }
      return Container();
    });
  }
}
