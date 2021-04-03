import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/data/data.dart';
import 'package:revolutionary_solitaire/model/playing_card.dart';

class CardBuilder extends StatefulWidget {
  final PlayingCard playingCard;
  final void Function(List<PlayingCard>) onValueChanged;

  const CardBuilder({
    @required this.playingCard,
    @required this.onValueChanged,
  });
  @override
  CardBuilderState createState() => CardBuilderState();
}

class CardBuilderState extends State<CardBuilder> {
  int position;
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
      onTap: () {
        if (widget.playingCard.cardNumber < 15) {
          _gameHandle();
        }
      },
      child: _card(widget.playingCard.selected),
    );
  }

  void _gameHandle() {
    bool passed = false;
    int emptySpaces = 0;
    setState(() {
      if (!widget.playingCard.selected) {
        selectedPos.add(widget.playingCard.cellIndex);
        widget.playingCard.selected = true;
      } else {
        selectedPos.removeWhere((item) => item == position);
        widget.playingCard.selected = false;
      }
      passed = _checkPassed();
      if (passed) {
        for (int i = 0; i < selectedPos.length; i++) {
          collectedCards.add(deck[selectedPos[i]]);
          deck[selectedPos[i]] = nullCard;
          emptyPos.add(selectedPos[i]);
        }

        for (int i = 0; i < deck.length; i++) {
          deck[i].cellIndex = i;
          if (deck[i] == nullCard) {
            emptySpaces++;
          }
        }

        if (emptySpaces == 16 && inGameReserve.isEmpty) {
          Navigator.pushReplacementNamed(context, '/');
        }
        selectedPos = [];
        widget.onValueChanged(deck);
      }
    });
  }

  bool _checkPassed() {
    selectedPoint = 0;
    bool passed = false;
    for (final pos in selectedPos) {
      if (deck[pos].cardNumber <= 10) {
        selectedPoint = selectedPoint + deck[pos].cardNumber;
        final List<CardColor> colors = [];
        for (final int pos in selectedPos) {
          colors.add(deck[pos].color);
        }

        selectedPoint == 27 && _sameColor(colors)
            ? passed = true
            : passed = false;
      } else {
        passed = false;
        break;
      }
    }
    for (final pos in selectedPos) {
      if (deck[pos].cardNumber > 10) {
        final List numbers = [];
        final List suits = [];

        for (final int pos in selectedPos) {
          numbers.add(deck[pos].cardNumber);
          suits.add(deck[pos].cardSuit);
        }

        if (_checkUnique(numbers) &&
            _checkUnique(suits) &&
            selectedPos.length == 4) {
          passed = true;
        }
      } else {
        break;
      }
    }
    return passed;
  }

  bool _sameColor(List<CardColor> c) {
    bool same = false;
    for (final CardColor color in c) {
      color == c[0] ? same = true : same = false;
    }
    return same;
  }

  String _cardSuitToString() {
    switch (widget.playingCard.cardSuit) {
      case CardSuit.hearts:
        return "Hearts";
      case CardSuit.diamonds:
        return "Diamonds";
      case CardSuit.clubs:
        return "Clubs";
      case CardSuit.spades:
        return "Spades";
      default:
        return null;
    }
  }

  bool _checkUnique(List a) {
    final int length = a.length;
    final set = <dynamic>{};
    for (var i = 0; i < length; i++) {
      if (!set.add(a[i])) {
        return false;
      }
    }
    return true;
  }

  Widget _card(bool selected) {
    if (selected) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: cardWidth,
            height: cardHeight,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.lightBlue,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 10.0,
                ),
              ],
            ),
          ),
          SizedBox(
              width: selectedCardWidth,
              height: selectedCardHeight,
              child: Image.asset(
                "assets/${_cardSuitToString()}_${widget.playingCard.cardNumber}.png",
              )),
          ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
              child: Container(
                width: selectedCardWidth,
                height: selectedCardHeight,
                color: Colors.lightBlueAccent.withOpacity(0.2),
              )),
        ],
      );
    }
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Image.asset(
        "assets/${_cardSuitToString()}_${widget.playingCard.cardNumber}.png",
      ),
    );
  }
}
