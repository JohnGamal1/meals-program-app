import 'package:dafitzone/app/widgets/presis_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DaFitZone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
        fontFamily: 'Cairo',
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.orange,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
          unselectedLabelStyle: TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
          dividerColor: Colors.black,
        ),
      ),
      locale: const Locale('ar'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar')],
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBottomAppBar();
  }
}
