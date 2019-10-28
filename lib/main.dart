import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ui/Deck.dart';

void main() => runApp(SolitareApp());

class SolitareApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: ' Revolutionary Solitaire',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameBoard(title: '27 Red And Black'),
    );
  }
}

