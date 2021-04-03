import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/model/playing_card.dart';
import 'card_builder.dart';

class CardCell extends StatefulWidget {
  final PlayingCard card;
  final void Function(List<PlayingCard>) onValueChanged;

  const CardCell({
    @required this.card,
    @required this.onValueChanged,
  });
  @override
  CardCellState createState() => CardCellState();
}

class CardCellState extends State<CardCell> {
  @override
  Widget build(BuildContext context) {
    return CardBuilder(
      playingCard: widget.card,
      onValueChanged: widget.onValueChanged,
    );
  }
}
