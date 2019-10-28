import 'package:revolutionary_solitaire/model/playing_card.dart';
import 'dart:math';


int roundNumber=0;
int selectedPoint;

List<PlayingCard> deck = [];
List<PlayingCard> collectedCards = [];
List<int> selectedPos = [];
List<int> availableNumbers = [];
List<int> availableLetters = [];



List<PlayingCard> r1 = [
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 10 ),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 5 ),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 5 ),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber:7),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 4),
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 6),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 9),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 12),
];

List<PlayingCard> r2 = [
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 14),
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 5),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 3),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 8),
];

List<PlayingCard> r3 = [
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 11),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 9),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 10),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 2),
];

List<PlayingCard> r4 = [
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 13),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 7),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 8),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 9),
];

List<PlayingCard> r5 = [
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 10),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 13),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 5),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 6),
];
List<PlayingCard> r6 = [
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 7),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber:10),
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 4),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 14),
];
List<PlayingCard> r7 = [
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 12),
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 9),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 4),
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 3),
];List<PlayingCard> r8 = [
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 11),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 6),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 7),
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 6),
];List<PlayingCard> r9 = [
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 8),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 12),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 13),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 14),
];List<PlayingCard> r10 = [
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 11),
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 2),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 2),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 8),
];List<PlayingCard> r11 = [
  PlayingCard(cardSuit:CardSuit.Spades,cardNumber: 13),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 14),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 12),
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 11),
];List<PlayingCard> r12 = [
  PlayingCard(cardSuit:CardSuit.Diamonds,cardNumber: 2),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 4),
  PlayingCard(cardSuit:CardSuit.Clubs,cardNumber: 3),
  PlayingCard(cardSuit:CardSuit.Hearts,cardNumber: 3),
];

List<List> rounds = [r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12];

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
