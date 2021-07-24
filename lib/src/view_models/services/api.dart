import 'package:dio/dio.dart';
import 'package:fluttering_with_andrew/src/models/user_m.dart';
import 'package:fluttering_with_andrew/src/view_models/services/network_service.dart';

class Api {
  Api(this._net);

  final NetworkService _net;

  Future<List<UserModel>?> getUsers() async {
    final Response<dynamic>? resp = await _net.request('/users');
    List<UserModel>? users;

    if (resp?.data != null) {
      users = <UserModel>[];
      for (final dynamic data in resp!.data) {
        users.add(UserModel.fromJson(data as Map<String, dynamic>));
      }
    }

    return users;
  }

  Future<UserModel?> getUser(int id) async {
    final Response<dynamic>? resp = await _net.request('/users/$id');
    UserModel? user;

    if (resp?.data != null) {
      user = UserModel.fromJson(resp!.data as Map<String, dynamic>);
    }

    return user;
  }
}
