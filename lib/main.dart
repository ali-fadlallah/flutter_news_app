import 'package:flutter/material.dart';
import 'package:news/ui/home_screen/home_screen.dart';
import 'package:news/ui/splash_screen/splash_screen.dart';
import 'package:news/utils/customTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyCustomTheme.lightTheme,
      darkTheme: MyCustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
