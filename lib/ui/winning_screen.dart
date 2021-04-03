import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/data/data.dart';

class WinningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF333366),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: height*5,),
            SizedBox(
              width: width * 90,
              child: Image.asset(
                "assets/win.png",
              ),
            ),
            SizedBox(
              height: height * 10,
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: SizedBox(
                width: width * 70,
                child: Image.asset(
                  "assets/menubutton.png",
                ),
              ),
            ),
            SizedBox(
              height: height * 2,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/deck');
              },
              child: SizedBox(
                width: width * 70,
                child: Image.asset(
                  "assets/restartbutton.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
