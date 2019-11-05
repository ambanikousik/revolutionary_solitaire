import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/model/playing_card.dart';
import 'package:revolutionary_solitaire/data/data.dart';
import 'card_cell.dart';
import 'ShadowText.dart';
import 'package:revolutionary_solitaire/data/size_config.dart';

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
  void onInit(List newList) {
    setState(() {
      score=0;
      reserved = 44;
      _deck = newList;
    });
  }

  Widget _cardSet(){
  return  Container(
      width: SizeConfig.blockSizeHorizontal *60,
      height: SizeConfig.blockSizeVertical *85,
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
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFF333366),
      body:Container(
        alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                SizedBox(width:SizeConfig.blockSizeHorizontal *2,),
                _cardSet(),
                SizedBox(width: SizeConfig.blockSizeHorizontal *2,),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ShadowText('27 Red & Black',
                        style:TextStyle(fontSize:SizeConfig.blockSizeHorizontal *4.7,
                            color: Colors.redAccent,
                            fontStyle:FontStyle.italic),
                      ),
                      SizedBox(height:SizeConfig.blockSizeVertical *5,),
                      Container(
                        height: SizeConfig.blockSizeVertical *20,
                        width: SizeConfig.blockSizeHorizontal *25,
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
                                  fontSize: SizeConfig.blockSizeHorizontal *3,
                                   ),),
                              Text(reserved.toString(),
                                style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: SizeConfig.blockSizeHorizontal *3.5,
                                  fontWeight: FontWeight.w700
                                ),),
                            ],
                          )
                      ),
                      RichText(
                        text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: 'Collected \nCards: ', style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.w300, fontSize:SizeConfig.blockSizeHorizontal *3.5),),
                              TextSpan(text: score.toString(), style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w500, fontSize:SizeConfig.blockSizeHorizontal *3.5),),
                            ]
                        ),
                      ),
                      SizedBox(height:SizeConfig.blockSizeVertical *10,),
                      FlatButton(
                        child: Container(
                          height:  SizeConfig.blockSizeVertical *8,
                          child: Image.asset("assets/restartbutton.png",),
                        ),
                        onPressed:() {
                          _initialiseGame();
                        }
                        ,
                      ),
                      FlatButton(
                        child: Container(
                          height:  SizeConfig.blockSizeVertical *8,
                          child: Image.asset("assets/menubutton.png",),
                        ),
                        onPressed:() {
                          Navigator.pushReplacementNamed(context, '/');                        }
                        ,
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
    roundNumber=0;
    deck = [];
    collectedCards = [];
    selectedPoint=0;
    selectedPos = [];
  List round = shuffle(rounds[roundNumber]);
  for(int i=0;i<round.length;i++){
      PlayingCard card = round[i];
      deck.add(
        card
          ..cellIndex=i
            ..selected =false
      );
  }
    onInit(deck);
  }

}
