import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/commons/repositories/repository.dart';
import 'src/commons/utils/connectivity_check.dart';
import 'src/features/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => RepositoryImp(),
          ),
          RepositoryProvider(
            create: (context) => ConnectivityCheck(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
