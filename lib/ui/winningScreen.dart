import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/data/data.dart';

class WinningScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:  Color(0xFF333366),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: height*5,),
            Container(
              width:  width *90,
              child:Image.asset("assets/win.png",),
            ),
        SizedBox(height: height*10,),

        FlatButton(
          child: Container(
            width: width *70,
            child: Image.asset("assets/menubutton.png",),
          ),
          onPressed:() {
            Navigator.pushReplacementNamed(context, '/');
          }

        ),
        SizedBox(height: height*2,),
        FlatButton(
          child: Container(
            width: width *70,
            child: Image.asset("assets/restartbutton.png",),
          ),
            onPressed:() {
              Navigator.pushReplacementNamed(context, '/deck');
            }
        ),
          ],
        ),
      ),
    );
  }

}