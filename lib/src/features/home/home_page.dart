import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/src/commons/consts/app_color.dart';
import 'package:flutter_bloc_api/src/commons/repositories/repository.dart';
import 'package:flutter_bloc_api/src/commons/utils/connectivity_check.dart';
import 'package:flutter_bloc_api/src/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_api/src/features/home/components/home_container_component.dart';

import 'widgets/custom_text_logo_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (context) => HomeBloc(
              RepositoryProvider.of<RepositoryImp>(context),
              RepositoryProvider.of<ConnectivityCheck>(context),
            )..add(LoadApiEvent()),
        child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: currentHeight * 0.08),
                  const CustomTextLogoWidget(),
                  SizedBox(height: currentHeight * 0.03),
                  HomeContainerComponent(
                      currentHeight: currentHeight, currentWidth: currentWidth)
                ],
              ),
            ),
          ),
        ));
  }
}
