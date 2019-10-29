import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/model/playing_card.dart';
import 'package:revolutionary_solitaire/data/data.dart';
import 'card_cell.dart';
import 'ShadowText.dart';


class GameBoard extends StatefulWidget {
  GameBoard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List _deck = [];
  int reserved,score;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    reserved = 44;
    score=0;
    _initialiseGame();
    _deck = deck;
  }


  void onValueChanged(List newList) {
  setState(() {
    score=score+4;
    reserved = reserved-4;
    _deck = newList;
  });
}

  Widget _cardSet(){
  return Container(
    width: 480,
    height: 330,
    decoration: BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
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
      // This trailing comma makes auto-formatting nicer for build methods.
      ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333366),
      body:Container(
        alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                SizedBox(width: 20,),
                _cardSet(),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ShadowText('27 Red & Black',
                      style:TextStyle(fontSize:30,color: Colors.redAccent,fontStyle:FontStyle.italic),
                    ),
                    SizedBox(height:20,),
                    Container(
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: Colors.lightBlueAccent,
                          width: 2,
                        ),
                      ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Reserved Cards",
                              style: TextStyle(
                                  color: Colors.white,
                                fontSize: 25,
                                 ),),
                            Text(reserved.toString(),
                              style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 25,
                                fontWeight: FontWeight.w700
                              ),),
                          ],
                        )
                    ),
                    SizedBox(height:100,),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: 'Collected \nCards: ', style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.w300, fontSize:25),),
                          TextSpan(text: score.toString(), style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w500, fontSize:25),),
                        ]
                      ),
                    ),
                  ],
                ),
              ],
            ), // This trailing comma makes auto-formatting nicer for build methods.
    ),
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
