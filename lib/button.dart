import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final color ;
  final textcolor;
  final String? buttontext ;
  final  buttonTapped;
  const MyButton({this.color,this.buttontext,this.textcolor,this.buttonTapped});


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
       buttonTapped();
      },

      child: Padding(
        padding:const  EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(

            color:color,
            child: Center(
                child: Text(
                    '$buttontext',
                  style: TextStyle(
                    fontSize: 20.0,
                      color:textcolor, ),
                )
            ),
          ),
        ),
      ),
    );
  }
}
