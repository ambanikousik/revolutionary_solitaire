import 'package:flutter/material.dart';
import 'package:revolutionary_solitaire/data/size_config.dart';
import 'help.dart';
class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // TODO: implement build
    return Scaffold(
      backgroundColor:  Color(0xFF333366),
      body: Container(
        alignment: Alignment.center,
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Container(
             height:  SizeConfig.blockSizeVertical *45,
             child:Image.asset("assets/cardgame.png",),
           ),
           FlatButton(
             child: Container(
               height:  SizeConfig.blockSizeVertical *15,
               child: Image.asset("assets/playbutton.png",),
             ),
            onPressed:() {
               Navigator.pushReplacementNamed(context, '/deck');
             }
             ,
           ),
           FlatButton(
             child: Container(
               height:  SizeConfig.blockSizeVertical *10,
               child: Image.asset("assets/helpbutton.png",),
             ),
             onPressed:() {
               showDialog(
                 context: context,
                 builder: (BuildContext context) => CustomDialog(
                   title: "Success",
                   description:
                      "1.	You will get a set of 52 Cards (no joker)"
                       "\n2.	In Deck you will have 16 cards face up: 4 rows and 4 columns"
                       "\n3.	Remaining cards are in reserved section."
                       "\n4.	You can collect cards if they are in the range between 2 and 10 and they sum up to 27 and they are of the same colour."
                       "\n5.	You can also collect cards if they are A-K-Q-J of 4 different seeds."
                       "\n6.	After collecting cards, all the empty places on the table are filled until there are again 16 cards face up or the deck of remaining cards is finished",
                   buttonText: "Okay",
                 ),
               );             }
             ,
           ),
         ],
       ),
      ),

    );
  }


}