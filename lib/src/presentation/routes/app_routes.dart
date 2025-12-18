import 'package:flutter/material.dart';
import 'package:notepases/src/presentation/pages/auth/auth_page.dart';
import 'package:notepases/src/presentation/pages/onboarding/onboarding_page.dart';
import 'route_names.dart';

class AppRoutes {

  static final Map<String, WidgetBuilder> routes = {

    RouteNames.onboarding: (_) => OnbordingPage(),
    RouteNames.auth: (_) => AuthPage(),


  };
}
