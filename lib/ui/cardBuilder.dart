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

  var _card ;
  int position ;
  @override
  void initState() {
    position = widget.playingCard.cellIndex;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(!widget.playingCard.selected){
      _card =  Container(
        width: 100,
        height:  139.4,
        child:Image.asset("assets/"+_cardSuitToString()+"_"+ widget.playingCard.cardNumber.toString() + ".png",),
      );
    }
    else{
      _card = Stack(
          children: <Widget>[
            Container(width: 102,
                height:  141,
                child: Image.asset("assets/"+ _cardSuitToString() +"_"+ widget.playingCard.cardNumber.toString() + ".png",)),
    ClipRRect(
    borderRadius: BorderRadius.all(
     Radius.circular(8.0),
    ),child: Container(
      width: 102,
      height:  141,
      color: Colors.redAccent.withOpacity(0.6),)
            ),
          ],
      );
    }



    // TODO: implement build
    return InkWell(
      onTap: (){
        _gameHandle();
      },
      child: _card,
    );
  }

  void _gameHandle(){
      setState(() {
        if (!widget.playingCard.selected) {
          print("tapped");
          if(selectedPos.length<4 && roundNumber<=11) {
            selectedPos.add(widget.playingCard.cellIndex);
            print("added:"+position.toString());
            widget.playingCard.selected = true;
            bool passed=false;
            selectedPoint =0;
            selectedPos.forEach((pos){
              if(deck[pos].cardNumber<=10){
                selectedPoint=selectedPoint+deck[pos].cardNumber;
                selectedPoint==27?passed=true:passed=false;
              }
              else{
                List numbers=[];
                List suits=[];
                selectedPos.forEach((pos){
                  numbers.add(deck[pos].cardNumber);
                  suits.add(deck[pos].cardSuit);
                });
                if(_checkUnique(numbers) && _checkUnique(suits)){
                   passed = true;
                }
              }
            });
            print("point: "+selectedPoint.toString());

            if(selectedPos.length==4 && passed){
              roundNumber++;
              print(roundNumber);
              List round = shuffle(rounds[roundNumber]);
              for(int i=0;i<selectedPos.length;i++){
                deck[selectedPos[i]] = round[i];
                print("pos"+selectedPos[i].toString());
              }

              for(int i=0;i<deck.length;i++){
                deck[i].cellIndex = i;
              }
              selectedPos = [];
              widget.onValueChanged(deck);
            }

          }
        }
        else{
          print("removed:"+position.toString());
          selectedPos.removeWhere((item)=>item == position);
          widget.playingCard.selected = false;
        }
      });
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
      //statistics++;
      if(!set.add(a[i])) {
        return false;
      }
    }
    return true;
  }
}





