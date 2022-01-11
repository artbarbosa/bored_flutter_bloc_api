import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/services/bored_service.dart';
import 'package:flutter_bloc_api/services/connectivity_service.dart';

import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => BoredService(),
            ),
            RepositoryProvider(
              create: (context) => ConnectivityService(),
            )
          ],
          child: const HomePage(),
        ));
  }
}
