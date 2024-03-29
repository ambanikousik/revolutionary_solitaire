import 'dart:io' show Platform;
import 'dart:math';

import 'package:revolutionary_solitaire/model/playing_card.dart';

int roundNumber = 0;
int selectedPoint;
int collected = 0;
double height;
double width;

double cardHeight = height * 15;
double cardWidth = width * 22;
double selectedCardHeight = height * 13.7;
double selectedCardWidth = width * 19.5;
double cardSetHeight = height * 65;
double cardSetWidth = width * 97;

List<PlayingCard> deck = [];
List<PlayingCard> collectedCards = [];
List<int> selectedPos = [];
List<int> emptyPos = [];
List<int> availableNumbers = [];
List<int> availableLetters = [];
List<PlayingCard> initRound = [];
List<PlayingCard> inGameReserve;

PlayingCard nullCard = PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 15);

String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/6300978111';
  }
  return null;
}

List<PlayingCard> shuffle(List<PlayingCard> items) {
  final Random random = Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    final int n = random.nextInt(i + 1);

    final PlayingCard temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}
