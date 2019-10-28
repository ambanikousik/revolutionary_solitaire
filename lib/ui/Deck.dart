import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/model/playing_card.dart';
import 'package:revolutionary_solitaire/data/data.dart';
import 'card_cell.dart';

class GameBoard extends StatefulWidget {
  GameBoard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {

  List _deck = [];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialiseGame();
    _deck = deck;
  }




  void onValueChanged(List newList) {
  setState(() {
    _deck = newList;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body:Container(
             width: 450,
              height: 300,
        margin: new EdgeInsets.only(top:40.0,left: 40),
        //color: Colors.amberAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CardCell(card: _deck[0],onValueChanged: onValueChanged,),
                    CardCell(card: _deck[1],onValueChanged: onValueChanged),
                    CardCell(card: _deck[2],onValueChanged: onValueChanged),
                    CardCell(card: _deck[3],onValueChanged: onValueChanged),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CardCell(card: _deck[4],onValueChanged: onValueChanged),
                    CardCell(card: _deck[5],onValueChanged: onValueChanged),
                    CardCell(card: _deck[6],onValueChanged: onValueChanged),
                    CardCell(card: _deck[7],onValueChanged: onValueChanged),

                  ],
                ),
              ],

    ), // This trailing comma makes auto-formatting nicer for build methods.
    )
    );
  }

  //initialise a new game
  void _initialiseGame(){
    deck = [];
    collectedCards = [];
  List round = shuffle(rounds[roundNumber]);
  for(int i=0;i<round.length;i++){

      PlayingCard card = round[i];
      deck.add(
        card
          ..cellIndex=i
      );
  }
  }

}
