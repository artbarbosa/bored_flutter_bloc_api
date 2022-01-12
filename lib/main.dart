import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/src/commons/repositories/repository.dart';
import 'package:flutter_bloc_api/src/commons/utils/connectivity_check.dart';

import 'src/features/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => RepositoryImp(),
          ),
          RepositoryProvider(
            create: (context) => ConnectivityCheck(),
          )
        ],
        child: const HomePage(),
      ),
    );
  }
}
