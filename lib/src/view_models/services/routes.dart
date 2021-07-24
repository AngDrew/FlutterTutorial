import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttering_with_andrew/src/view_models/auth_vm.dart';
import 'package:fluttering_with_andrew/src/view_models/services/api.dart';
import 'package:fluttering_with_andrew/src/view_models/splash_vm.dart';
import 'package:fluttering_with_andrew/src/views/layouts/mobile/auth/auth_v.dart';
import 'package:fluttering_with_andrew/src/views/layouts/mobile/splash/splash_v.dart';
import 'package:provider/provider.dart';

const String rootRoute = '/'; // buat splash screen
const String authRoute = '/auth';
const String landingRoute = '/landing';
const String commentRoute = '/comment';
const String profileRoute = '/profile';

class Router {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) => ChangeNotifierProvider(
            create: (BuildContext context) => SplashViewModel(),
            child: SplashScreen(),
          ),
        );
      case authRoute:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => AuthViewModel(context.read<Api>()),
            child: AuthScreen(),
          ),
        );
      // case landingRoute:
      //   // return ;
      // case commentRoute:
      //   // return ;
      // case profileRoute:
      //   // return ;
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Route not found for ${settings.name}'),
            ),
          ),
        );
    }
    //
  }
}
