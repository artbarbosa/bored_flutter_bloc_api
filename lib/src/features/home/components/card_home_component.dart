import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return  Center(
          child:Lottie.asset('assets/images/search.json')
        );
      }
      if (state is HomeLoadedState) {
        return Column(
          children: [
            CustomTextWidget(state: state),
            SizedBox(height: currentHeight * 0.28),
            CustomButtonWidget(
              currentHeight: currentHeight,
              currentWidth: currentWidth,
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
