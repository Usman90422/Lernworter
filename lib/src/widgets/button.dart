import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor,
    required this.buttonColor,
    this.width,
    required this.height
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final Color buttonColor;
  final  width;
  final double height;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SizedBox(
        width: width,
        height: size.height/14,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: buttonColor, shape:  RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(15.0),
          ),

          ),
          child: Center(child: Text(text,style: TextStyle(color: textColor??Colors.white,fontSize: 18),)),
        ));
  }
}