import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../constants/colors.dart';
import '../../widgets/button.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({Key? key}) : super(key: key);

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
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
                GestureDetector(
                    onTap: (){},
                    child: const Icon(Icons.volume_up,size: 50,color: kTextColor,)),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: kCyanAccent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0,10))],
                  ),
                  height: size.height/14,
                  width: size.width,
                  padding: const EdgeInsets.only(left: 20,top: 2),
                  child: SizedBox(
                    width: size.width,
                    child:  const TextField(
                      style: TextStyle(color: kTextColor),
                      decoration: InputDecoration(
                        hintText: "Enter the word",
                        hintStyle: TextStyle(color: Colors.black38,fontSize: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MyButton(onPressed: (){}, text: "Submit", buttonColor: kTextColor,textColor: kCyanAccent, height: 50,width: size.width*0.4,),

              ],
            ),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
