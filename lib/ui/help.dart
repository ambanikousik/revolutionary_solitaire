import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/data/data.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  const CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          // width: height *70,
          padding: const EdgeInsets.only(
            top: Consts.padding,
            //bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: const EdgeInsets.only(top: Consts.avatarRadius),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 4,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: Container(
              height: height * 6,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black54,
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: width * 7),
              ),
            )), //...top circlular image part,
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16;
  static const double avatarRadius = 66.0;
}
