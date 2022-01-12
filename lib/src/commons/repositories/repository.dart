import 'package:flutter_bloc_api/src/commons/models/bored_model.dart';
import 'package:flutter_bloc_api/src/commons/repositories/repository_interface.dart';
import 'package:http/http.dart';

class RepositoryImp implements IRepository {
  @override
  Future<BoredModel> getBoredActivity() async {
    final response =
        await get(Uri.parse('https://www.boredapi.com/api/activity'));
    final activity = boredActivityFromJson(response.body);
    return activity;
  }
}
