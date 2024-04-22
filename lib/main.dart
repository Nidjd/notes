import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/utils/router_app.dart';
import 'package:notes/features/splash_screen/presentation/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: primaryColor),
      routerConfig: AppRouter.router,
    );
  }
}
