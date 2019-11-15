import 'package:revolutionary_solitaire/model/playing_card.dart';
import 'dart:math';
import 'dart:io' show Platform;

int roundNumber=0;
int selectedPoint;
int collected = 0;
double height;
double width;


double cardHeight = height *15;
double cardWidth = width *22;
double selectedCardHeight = height *13.7;
double selectedCardWidth = width *19.5;
double cardSetHeight = height *65;
double cardSetWidth = width*97;


List<PlayingCard> deck = [];
List<PlayingCard> collectedCards = [];
List<int> selectedPos = [];
List<int> emptyPos = [];
List<int> availableNumbers = [];
List<int> availableLetters = [];
List<PlayingCard> initRound = [];
//List<PlayingCard> inGameReserve = [];


PlayingCard nullCard =   PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber:15 );


List<PlayingCard> initRoundx = [
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 10 ),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 5 ),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 5 ),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber:7),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 4),
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 6),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 9),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 12),
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 14),
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 5),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 3),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 8),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 11),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 9),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 10),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 2),
];

List<PlayingCard> inGameReservex =  [
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



String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/6300978111';
  }
  return null;
}

List shuffle(List items) {
  var random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {

    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}
