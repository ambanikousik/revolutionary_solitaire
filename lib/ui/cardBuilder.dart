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
      setState(() {
        if (!widget.playingCard.selected) {
            selectedPos.add(widget.playingCard.cellIndex);
            print("added:"+widget.playingCard.cardNumber.toString());
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
                if(_checkUnique(numbers) && _checkUnique(suits) && selectedPos.length==4){
                   passed = true;
                }
              }
            });
            print("point: "+selectedPoint.toString());

            if(passed){
              for(int i=0;i<selectedPos.length;i++){
                collectedCards.add(deck[selectedPos[i]]);
                deck[selectedPos[i]] = nullCard;
                emptyPos.add(selectedPos[i]);
                print("pos"+selectedPos[i].toString());
              }

              for(int i=0;i<deck.length;i++){
                deck[i].cellIndex = i;
              }
              selectedPos = [];
              widget.onValueChanged(deck);
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
              //color: Colors.redAccent.withOpacity(0.6),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 10.0,
                  //offset: new Offset(2.0, 2.0,),
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





