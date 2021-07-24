import 'package:flutter/material.dart';
import 'package:fluttering_with_andrew/src/view_models/services/api.dart';
import 'package:fluttering_with_andrew/src/view_models/services/network_service.dart';
import 'package:fluttering_with_andrew/src/view_models/services/routes.dart'
    as Rouute;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider(
          create: (BuildContext context) => NetworkService(),
        ),
        ProxyProvider<NetworkService, Api>(
          update: (BuildContext context, NetworkService value, Api? previous) =>
              Api(value),
          create: (context) => Api(context.read<NetworkService>()),
        )
      ],
      child: MaterialApp(
        title: 'API Implementation',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        onGenerateRoute: Rouute.Router().onGenerateRoute,
        // home: LandingScreen(),
      ),
    );
  }
}
