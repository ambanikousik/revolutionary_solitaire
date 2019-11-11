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
  List<PlayingCard> inGameReserve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    score=0;
    _initialiseGame();
    _deck = deck;
  }


  void onValueChanged(List newList) {
  setState(() {
    score=collectedCards.length;
    reserved = inGameReserve.length;
    print(reserved);
    _deck = newList;
  });
}
  void onInit(List newList) {
    setState(() {
      score=0;
      reserved = inGameReserve.length;
      _deck = newList;
    });
  }

  Widget _cardSet(){
  return  Container(
      width: cardSetWidth,
      height: cardSetHeight,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CardCell(card: _deck[8],onValueChanged: onValueChanged),
              CardCell(card: _deck[9],onValueChanged: onValueChanged),
              CardCell(card: _deck[10],onValueChanged: onValueChanged),
              CardCell(card: _deck[11],onValueChanged: onValueChanged),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CardCell(card: _deck[12],onValueChanged: onValueChanged),
              CardCell(card: _deck[13],onValueChanged: onValueChanged),
              CardCell(card: _deck[14],onValueChanged: onValueChanged),
              CardCell(card: _deck[15],onValueChanged: onValueChanged),

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
            child: Column(
              children: <Widget>[
                SizedBox(height:height *2,),

                ShadowText('27 Red & Black',
                        style:TextStyle(fontSize:width *13,
                            color: Colors.redAccent,
                            fontStyle:FontStyle.italic),
                      ),
                SizedBox(height:height *5,),
                Row(
                  children: <Widget>[
                    SizedBox(width:width *2,),
                    RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Reserved: ', style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.w300, fontSize:SizeConfig.blockSizeHorizontal *5.5),),
                            TextSpan(text: reserved.toString(), style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w500, fontSize:SizeConfig.blockSizeHorizontal *5.5),),
                          ]
                      ),
                    ),
                    SizedBox(width:width *7),

                    InkWell(
                   onTap: (){
                     _unfoldCard();
                   },
                   child: Container(
                     alignment: Alignment.center,
                     height: height*4,
                     width: width*20,
                     child: Text('Unfold',style: TextStyle(fontSize: height*3),),
                     decoration: BoxDecoration(
                         color: Colors.redAccent.withOpacity(0.6),
                         borderRadius: BorderRadius.all(Radius.circular(5))
                     ),
                   ),
                 ),

                  ],
                ),
                SizedBox(height:height *1,),
                _cardSet(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(children: <Widget>[
                      FlatButton(
                        child: Container(
                          width: width* 20,
                          child: Image.asset("assets/restartbutton.png",),
                        ),
                        onPressed:() {
                          _initialiseGame();
                        }
                        ,
                      ),
                      FlatButton(
                        child: Container(
                          width: width* 24,
                          child: Image.asset("assets/menubutton.png",),
                        ),
                        onPressed:() {
                          Navigator.pushReplacementNamed(context, '/');                        }
                        ,
                      ),
                    ],),
                    Container(
                      alignment: Alignment.center,
                      height: height*7,
                      width: width *40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: Colors.lightBlueAccent,
                          width: 2,
                        ),
                      ),
                      child: RichText(
                        text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: 'Collected: ', style: TextStyle(color:Colors.white, fontSize:SizeConfig.blockSizeHorizontal *6),),
                              TextSpan(text: score.toString(), style: TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.w700, fontSize:SizeConfig.blockSizeHorizontal *6.5),),
                            ]
                        ),
                      ),

                    ),
                    SizedBox(width:width *3,),
                  ],
                ),

              ],
            ), // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }

  //initialise a new game
  void _initialiseGame(){
    inGameReserve = [];
    initRound = initRoundx;
    emptyPos = [];
    deck = [];
    collectedCards = [];
    selectedPoint=0;
    selectedPos = [];
    inGameReserve =[
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 13),
      PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 7),
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 8),
      PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 9),
      PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 10),
      PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 13),
      PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 5),
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 6),
      PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 7),
      PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber:10),
      PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 4),
      PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 14),
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 12),
      PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 9),
      PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 4),
      PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 3),
      PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 11),
      PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 6),
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 7),
      PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 6),
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 8),
      PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 12),
      PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 13),
      PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 14),
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 11),
      PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 2),
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 2),
      PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 8),
      PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 13),
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 14),
      PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 12),
      PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 11),
      PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 2),
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 4),
      PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 3),
      PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 3),
    ];
    List round = shuffle(initRound);
  for(int i=0;i<round.length;i++){
      PlayingCard card = round[i];
      deck.add(
        card
          ..cellIndex=i
            ..selected =false
      );
  }
    onInit(deck);
    print(reserved);
    print(inGameReserve.length.toString()+"current");
    print(inGameReservex.length);

  }
   void _unfoldCard(){
  int empty = emptyPos.length;
  int reserve = inGameReserve.length;
  if(empty !=0 && reserve !=0){
    List round = shuffle(inGameReserve);
    if(reserve>=empty){
      for(int i=0;i<empty;i++){
        deck[emptyPos[i]] = round[i];
        round.removeAt(i);
      }
      emptyPos = [];
    }
    else{
      for(int i=0;i<reserve;i++){
        deck[emptyPos[i]] = round[i];
        round.removeAt(i);
      }
    }

    for(int i=0;i<deck.length;i++){
      deck[i].cellIndex = i;
    }
    onValueChanged(deck);
    print('unfold');
  }
  else{
    print(emptyPos.length.toString()+" "+inGameReserve.length.toString());
  }
}
}
