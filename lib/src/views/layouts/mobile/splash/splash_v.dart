import 'package:flutter/material.dart';
import 'package:fluttering_with_andrew/src/view_models/services/routes.dart';
import 'package:fluttering_with_andrew/src/view_models/splash_vm.dart';
import 'package:fluttering_with_andrew/src/views/base_v.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onReady: (SplashViewModel vm) async {
        bool isSucceed = await vm.init();

        if (isSucceed) {
          onSuccess();
        } else {
          while (!isSucceed) {
            await Future.delayed(const Duration(seconds: 3));
            isSucceed = await vm.init();
            if (isSucceed) {
              onSuccess();
            }
          }
        }
      },
      builder: (BuildContext context, SplashViewModel vm, _) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void onSuccess() {
    Navigator.pushReplacementNamed(context, authRoute);
  }
}
