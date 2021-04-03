import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/data/data.dart';
import 'package:revolutionary_solitaire/data/size_config.dart';
import 'package:revolutionary_solitaire/model/playing_card.dart';

import 'card_cell.dart';
import 'shadow_text.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<PlayingCard> _deck = [];
  int reserved, score;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    score = 0;
    _initialiseGame();
    _deck = deck;
  }

  void onValueChanged(List<PlayingCard> newList) {
    setState(() {
      score = collectedCards.length;
      reserved = inGameReserve.length;
      _deck = newList;
    });
  }

  void onInit(List<PlayingCard> newList) {
    setState(() {
      score = 0;
      reserved = inGameReserve.length;
      _deck = newList;
    });
  }

  Widget _cardSet() {
    return Container(
      width: cardSetWidth,
      height: cardSetHeight,
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CardCell(
                  card: _deck[0],
                  onValueChanged: onValueChanged,
                ),
                CardCell(card: _deck[1], onValueChanged: onValueChanged),
                CardCell(card: _deck[2], onValueChanged: onValueChanged),
                CardCell(card: _deck[3], onValueChanged: onValueChanged),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CardCell(card: _deck[4], onValueChanged: onValueChanged),
              CardCell(card: _deck[5], onValueChanged: onValueChanged),
              CardCell(card: _deck[6], onValueChanged: onValueChanged),
              CardCell(card: _deck[7], onValueChanged: onValueChanged),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CardCell(card: _deck[8], onValueChanged: onValueChanged),
              CardCell(card: _deck[9], onValueChanged: onValueChanged),
              CardCell(card: _deck[10], onValueChanged: onValueChanged),
              CardCell(card: _deck[11], onValueChanged: onValueChanged),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CardCell(card: _deck[12], onValueChanged: onValueChanged),
              CardCell(card: _deck[13], onValueChanged: onValueChanged),
              CardCell(card: _deck[14], onValueChanged: onValueChanged),
              CardCell(card: _deck[15], onValueChanged: onValueChanged),
            ],
          ),
        ],
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333366),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 1.5,
            ),
            ShadowText(
              '27 Red & Black',
              style: TextStyle(
                  fontSize: width * 13,
                  color: Colors.redAccent,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: height * 1,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: width * 2,
                ),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: 'Reserved: ',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w300,
                          fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                    ),
                    TextSpan(
                      text: reserved.toString(),
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                    ),
                  ]),
                ),
                SizedBox(width: width * 7),
                InkWell(
                  onTap: () {
                    _unfoldCard();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 4,
                    width: width * 20,
                    decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.6),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      'Unfold',
                      style: TextStyle(fontSize: height * 3),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.5,
            ),
            _cardSet(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    _initialiseGame();
                  },
                  child: SizedBox(
                    width: width * 20,
                    child: Image.asset(
                      "assets/restartbutton.png",
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: SizedBox(
                    width: width * 24,
                    child: Image.asset(
                      "assets/menubutton.png",
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: height * 6,
                  width: width * 35,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: Colors.lightBlueAccent,
                      width: 2,
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Collected: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                      ),
                      TextSpan(
                        text: score.toString(),
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.w700,
                            fontSize: SizeConfig.blockSizeHorizontal * 6),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  width: width * 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //initialise a game
  void _initialiseGame() {
    inGameReserve = [];
    emptyPos = [];
    deck = [];
    collectedCards = [];
    selectedPoint = 0;
    selectedPos = [];

    inGameReserve = [
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 10),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 5),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 5),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 7),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 4),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 6),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 9),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 12),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 14),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 5),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 3),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 8),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 11),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 9),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 10),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 2),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 13),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 7),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 8),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 9),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 10),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 13),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 5),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 6),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 7),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 10),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 4),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 14),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 12),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 9),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 4),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 3),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 11),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 6),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 7),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 6),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 8),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 12),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 13),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 14),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 11),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 2),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 2),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 8),
      PlayingCard(cardSuit: CardSuit.spades, cardNumber: 13),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 14),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 12),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 11),
      PlayingCard(cardSuit: CardSuit.diamonds, cardNumber: 2),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 4),
      PlayingCard(cardSuit: CardSuit.clubs, cardNumber: 3),
      PlayingCard(cardSuit: CardSuit.hearts, cardNumber: 3),
    ];
    final List<PlayingCard> round = shuffle(inGameReserve);

    for (int i = 0; i < 16; i++) {
      final PlayingCard card = round[i];
      if (card.cardSuit == CardSuit.hearts ||
          card.cardSuit == CardSuit.diamonds) {
        deck.add(card
          ..cellIndex = i
          ..selected = false
          ..color = CardColor.red);

        //print("red ");
      } else {
        deck.add(card
          ..cellIndex = i
          ..selected = false
          ..color = CardColor.black);
      }
      round.removeAt(i);
    }

    for (int i = 0; i < deck.length; i++) {
      deck[i].cellIndex = i;
    }
    onInit(deck);
  }

  void _unfoldCard() {
    final int empty = emptyPos.length;
    final int reserve = inGameReserve.length;
    if (empty != 0 && reserve != 0) {
      final List<PlayingCard> round = shuffle(inGameReserve);
      for (final PlayingCard card in round) {
        if (card.cardSuit == CardSuit.hearts ||
            card.cardSuit == CardSuit.diamonds) {
          card.color = CardColor.red;
        } else {
          card.color = CardColor.black;
        }
      }

      if (reserve >= empty) {
        for (int i = 0; i < empty; i++) {
          deck[emptyPos[i]] = round[i];
          round.removeAt(i);
        }
        emptyPos = [];
      } else {
        for (int i = 0; i < reserve; i++) {
          deck[emptyPos[i]] = round[i];
          round.removeAt(i);
        }
      }

      for (int i = 0; i < deck.length; i++) {
        deck[i].cellIndex = i;
      }
      onValueChanged(deck);
    }
  }
}
