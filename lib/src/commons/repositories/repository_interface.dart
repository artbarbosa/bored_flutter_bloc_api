  import 'package:flutter_bloc_api/src/commons/models/bored_model.dart';

abstract class IRepository {
    Future<BoredModel> getBoredActivity();
  }

