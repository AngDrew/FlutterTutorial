import 'package:flutter/foundation.dart';
import 'package:fluttering_with_andrew/src/view_models/base_vm.dart';

class SplashViewModel extends BaseViewModel {
  Future<bool> init() async {
    // setStateBusy();

    await Future.delayed(const Duration(seconds: 1));

    // setStateIdle();
    return true;
  }
}
