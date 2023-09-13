import 'package:flutter/material.dart';
import 'package:movies_clean_app/core/get_it/service_locator.dart';
import 'package:movies_clean_app/modules/movie/presenter/pages/movies_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        brightness: Brightness.dark,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MoviesPage(),
    );
  }
}
