import 'package:flutter/material.dart';

enum CardSuit {
  Spades,
  Hearts,
  Diamonds,
  Clubs,
}

List<int> CardNumer = [2,3,4,5,6,7,8,9,10,11,12,13,14];

class PlayingCard {
  int cardNumber;
  CardSuit cardSuit;
  int cellIndex;
  bool selected;


  PlayingCard({
    @required this.cardSuit,
    this.cardNumber,
    this.selected = false,

  });


}