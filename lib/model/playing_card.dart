import 'package:flutter/material.dart';

enum CardSuit {
  spades,
  hearts,
  diamonds,
  clubs,
}

enum CardColor {
  red,
  black,
}

List<int> cardNumer = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

class PlayingCard {
  int cardNumber;
  CardSuit cardSuit;
  int cellIndex;
  bool selected;
  CardColor color;

  PlayingCard({
    @required this.cardSuit,
    this.cardNumber,
    this.selected = false,
    this.color,
  });
}
