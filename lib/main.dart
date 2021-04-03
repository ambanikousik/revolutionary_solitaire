import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revolutionary_solitaire/ui/main_screen.dart';

import 'ui/deck.dart';
import 'ui/main_screen.dart';
import 'ui/winning_screen.dart';

void main() => runApp(SolitareApp());

class SolitareApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: ' Revolutionary Solitaire',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/deck': (context) => const GameBoard(title: '27 Red And Black'),
        '/win': (context) => WinningScreen(),
      },
    );
  }
}
