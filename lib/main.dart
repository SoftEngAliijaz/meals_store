import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_store/screens/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meals Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: const Color.fromARGB(255, 131, 57, 0)),
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        home: TabsViewScreen());
  }
}
