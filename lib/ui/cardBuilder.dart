import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/data/data.dart';
import 'package:revolutionary_solitaire/model/playing_card.dart';

class CardBuilder extends StatefulWidget {

  final PlayingCard playingCard;
  final void Function(List) onValueChanged;

  CardBuilder({
    @required this.playingCard,
    @required this.onValueChanged,

  });
  createState() => _cardBuilder();
}

class _cardBuilder extends State<CardBuilder>{

  int position ;
  @override
  void initState() {
    position = widget.playingCard.cellIndex;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return InkWell(
      onTap: (){
        if(widget.playingCard.cardNumber<15){
          _gameHandle();
        }
      },
      child: _card(widget.playingCard.selected),
    );
  }

  void _gameHandle(){
    bool passed=false;
    int emptySpaces=0;
    setState(() {
//      if (!widget.playingCard.selected) {
//        selectedPos.add(widget.playingCard.cellIndex);
//        widget.playingCard.selected = true;
//
//        passed = _checkPassed();
//        if(passed){
//          for(int i=0;i<selectedPos.length;i++){
//            collectedCards.add(deck[selectedPos[i]]);
//            deck[selectedPos[i]] = nullCard;
//            emptyPos.add(selectedPos[i]);
//          }
//
//          for(int i=0;i<deck.length;i++){
//            deck[i].cellIndex = i;
//            if(deck[i]==nullCard){
//              emptySpaces++;
//            }
//          }
//          print("empty " + emptySpaces.toString());
//          print("reserve "+inGameReserve.length.toString());
//          selectedPos = [];
//          widget.onValueChanged(deck);
//        }
//
//
//      }
//      else{
//        selectedPos.removeWhere((item)=>item == position);
//        widget.playingCard.selected = false;
//
//        passed = _checkPassed();
//        if(passed){
//          for(int i=0;i<selectedPos.length;i++){
//            collectedCards.add(deck[selectedPos[i]]);
//            deck[selectedPos[i]] = nullCard;
//            emptyPos.add(selectedPos[i]);
//          }
//
//          for(int i=0;i<deck.length;i++){
//            deck[i].cellIndex = i;
//            if(deck[i]==nullCard){
//              emptySpaces++;
//            }
//          }
//          print("empty " + emptySpaces.toString());
//          print("reserve "+inGameReserve.length.toString());
//          selectedPos = [];
//          widget.onValueChanged(deck);
//        }
//      }
      if (!widget.playingCard.selected) {
        selectedPos.add(widget.playingCard.cellIndex);
        widget.playingCard.selected = true;}
      else{
        selectedPos.removeWhere((item)=>item == position);
       widget.playingCard.selected = false;
      }
              passed = _checkPassed();
        if(passed){
          for(int i=0;i<selectedPos.length;i++){
            collectedCards.add(deck[selectedPos[i]]);
            deck[selectedPos[i]] = nullCard;
            emptyPos.add(selectedPos[i]);
          }

          for(int i=0;i<deck.length;i++){
            deck[i].cellIndex = i;
            if(deck[i]==nullCard){
              emptySpaces++;
            }
          }
          print("empty " + emptySpaces.toString());
          print("reserve "+inGameReserve.length.toString());
          if(emptySpaces == 16 && inGameReserve.length ==0){
            Navigator.pushReplacementNamed(context, '/');
          }
          selectedPos = [];
          widget.onValueChanged(deck);
        }

    });
  }



  bool _checkPassed(){
    selectedPoint =0;
    bool passed=false;
    for(final pos in selectedPos){
      if(deck[pos].cardNumber<=10){
        selectedPoint=selectedPoint+deck[pos].cardNumber;
        List colors=[];
        selectedPos.forEach((pos){
          colors.add(deck[pos].color);
        });


        selectedPoint==27 && _sameColor(colors)? passed=true:passed=false;

      }
      else{
        passed=false;
        break;
      }
    }
    for(final pos in selectedPos){
      if(deck[pos].cardNumber>10){
        List numbers=[];
        List suits=[];
        selectedPos.forEach((pos){
          numbers.add(deck[pos].cardNumber);
          suits.add(deck[pos].cardSuit);
        });
        if(_checkUnique(numbers) && _checkUnique(suits) && selectedPos.length==4){
          passed = true;
        }
      }
      else{
        break;
      }
    }
    return passed;
  }
  bool _sameColor(List c){
    bool same = false;
    c.forEach((color){
      color == c[0]? same = true: same = false;
    });
    return same;
  }


  String _cardSuitToString() {
    switch (widget.playingCard.cardSuit) {
      case CardSuit.Hearts:
        return "Hearts";
      case CardSuit.Diamonds:
        return "Diamonds";
      case CardSuit.Clubs:
        return "Clubs";
      case CardSuit.Spades:
        return "Spades";
      default:
        return null;
    }
  }
  bool _checkUnique(List a){
    var length = a.length;
    var set = new Set();
    for(var i = 0; i < length; i++) {
      if(!set.add(a[i])) {
        return false;
      }
    }
    return true;
  }


  Widget _card(bool selected){
    if(selected){
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: cardWidth,
            height:  cardHeight,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.lightBlue,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 10.0,
                ),
              ],
            ),
          ),

          Container(
              width: selectedCardWidth,
              height:  selectedCardHeight,
              child: Image.asset("assets/"+ _cardSuitToString() +"_"+ widget.playingCard.cardNumber.toString() + ".png",)),

          ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),child: Container(
            width: selectedCardWidth,
            height:  selectedCardHeight,
            color: Colors.lightBlueAccent.withOpacity(0.2),)
          ),
        ],
      );
    }
    return Container(
      width: cardWidth,
      height:  cardHeight,
      child:Image.asset("assets/"+_cardSuitToString()+"_"+ widget.playingCard.cardNumber.toString() + ".png",),
    );
  }
}





