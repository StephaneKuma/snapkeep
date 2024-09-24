import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapkeep/src/core/constants/themes.dart';
import 'package:snapkeep/src/core/locator/index.dart';

import 'src/core/router/index.dart';
import 'src/whatsapp/presentation/bloc/status_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<StatusBloc>()
            ..add(FetchStatusImages())
            ..add(FetchStatusVideos()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Snapkeep',
        theme: lightTheme.copyWith(
          textTheme: GoogleFonts.interTightTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routerConfig: router.config(),
      ),
    );
  }
}
