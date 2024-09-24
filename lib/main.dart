import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapkeep/src/core/constants/themes.dart';
import 'package:snapkeep/src/core/locator/index.dart';

import 'src/core/router/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Snapkeep',
      theme: lightTheme.copyWith(
        textTheme: GoogleFonts.interTightTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routerConfig: router.config(),
    );
  }
}
