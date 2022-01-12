import 'package:flutter/material.dart';
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
    return BlocProvider(
        create: (context) => HomeBloc(
              RepositoryProvider.of<RepositoryImp>(context),
              RepositoryProvider.of<ConnectivityCheck>(context),
            )..add(LoadApiEvent()),
        child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: CustomTextLogoWidget()),
                      HomeContainerComponent(),
                ],
                
              ),
            ),
          ),
        ));
  }
}
