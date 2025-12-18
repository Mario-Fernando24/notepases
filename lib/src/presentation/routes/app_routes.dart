import 'package:flutter/material.dart';
import 'package:notepases/src/presentation/pages/onboarding/onboarding_page.dart';
import 'route_names.dart';

class AppRoutes {
  
  static final Map<String, WidgetBuilder> routes = {

    RouteNames.onboarding: (_) => OnbordingPage(),

  };
}
