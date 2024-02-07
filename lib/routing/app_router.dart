import 'package:demo_app/routing/routing_config.dart';
import 'package:demo_app/ui/Auth/sign_in_screen.dart';
import 'package:demo_app/ui/base_screen.dart';
import 'package:demo_app/ui/onboarding/onboarding_screen.dart';
import 'package:demo_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case splashScreen:
      return MaterialPageRoute(
        // builder: (context) => const SplashScreen(),
        builder: (context) => const SplashScreen(),
      );

    case onboardingScreen:
      return MaterialPageRoute(
        builder: (context) => const OnboardingScreen(),
      );
    case signInScreen:
      return MaterialPageRoute(builder: (_) => const SignInScreen());

    case baseScreen:
      return MaterialPageRoute(
        builder: (context) => const BaseScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${routeSettings.name}',
            ),
          ),
        ),
      );
  }
}
