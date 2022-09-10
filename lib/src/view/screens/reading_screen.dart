import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../constants/colors.dart';
import '../../widgets/button.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(icon: Icon(Icons.close,color: kTextColor,),onPressed: (){Navigator.pop(context);},)
            ],
          ),
            const SizedBox(height: 16),
            FAProgressBar(progressColor: kTextColor,backgroundColor: Colors.black26,direction: Axis.horizontal,size: 15,currentValue: 50),],),

          Column(
            children: [
               Text("Word 1",style: TextStyle(fontFamily: "Andika Bold",fontSize: size.height*0.06,color: kTextColor,),),
            ],
          ),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(onPressed: (){}, text: "Correct", buttonColor: kTextColor,textColor: kCyanAccent, height: 50,width: size.width*0.4,),
                  MyButton(onPressed: (){}, text: "Wrong", buttonColor: kTextColor, textColor: kCyanAccent,height: 50,width: size.width*0.4,),
                ],
              ),

            ],
          ),



        ],
        ),
      ),
    );
  }
}
