import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCheck {
  final _connectivity = Connectivity();
  final connectivityStream = StreamController<ConnectivityResult>();

  ConnectivityCheck() {
    _connectivity.onConnectivityChanged.listen((event) {
      connectivityStream.add(event);
    });
  }
}