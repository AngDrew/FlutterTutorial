import 'package:fluttering_with_andrew/src/models/user_m.dart';
import 'package:fluttering_with_andrew/src/view_models/base_vm.dart';
import 'package:fluttering_with_andrew/src/view_models/services/api.dart';
import 'package:fluttering_with_andrew/src/view_models/services/network_service.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel(this._api);

  Api _api;

  UserModel? user;

  Future<bool> doAuth(int id) async {
    setStateBusy();

    user = await _api.getUser(id);

    setStateIdle();

    return user != null;
  }
}
