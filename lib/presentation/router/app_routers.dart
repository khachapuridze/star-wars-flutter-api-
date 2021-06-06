import 'package:flutter/material.dart';
import 'package:flutter_learning/presentation/screens/home_screen.dart';
import 'package:flutter_learning/presentation/screens/planet.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => HomeScreen());
    } else if (settings.name == '/home-planet') {
      var planetUrl = settings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => PlanetScreen(
                planetUrl: planetUrl.toString(),
              ));
    } else {
      return null;
    }
  }
}
