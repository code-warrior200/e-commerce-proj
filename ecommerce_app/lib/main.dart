import 'package:ecommerce_app/Providers/auth_provider.dart';
import 'package:ecommerce_app/Screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/Screens/home_screen.dart';
import 'package:ecommerce_app/Screens/login_screen.dart';
import 'package:ecommerce_app/Screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'ShoppiVerse',
        debugShowCheckedModeBanner: false,  // Removes the debug banner
        initialRoute: '/onboarding', // Set the initial route to OnboardingScreen
        routes: {
          '/onboarding': (context) => OnboardingScreen(), // Add the OnboardingScreen route
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
