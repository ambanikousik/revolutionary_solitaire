import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revolutionary_solitaire/ui/mainScreen.dart';
import 'ui/Deck.dart';
import 'ui/winningScreen.dart';
import 'ui/mainScreen.dart';

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
        '/'  : (context) => MainScreen(),
        '/deck' : (context) => GameBoard(title: '27 Red And Black'),
        '/win'  : (context) => WinningScreen(),
      },

    );
  }
}

