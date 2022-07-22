import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smash Gift',
      theme: ThemeData(textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme)),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(title: 'Smash Country List'),
      },
    );
  }
}