import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/model/playing_card.dart';
import 'cardBuilder.dart';


class CardCell extends StatefulWidget{

  final PlayingCard card;
 final void Function(List) onValueChanged;


  CardCell({
    @required this.card,
    @required this.onValueChanged,


  }
      );
   @override
  _cardCell createState()=> _cardCell();
}

class _cardCell extends State<CardCell>{
  @override
  Widget build(BuildContext context) {
    return CardBuilder(playingCard: widget.card,onValueChanged: widget.onValueChanged,);
  }

}









