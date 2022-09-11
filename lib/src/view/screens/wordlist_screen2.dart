import 'package:flutter/material.dart';
import 'package:lernworter/src/view/screens/reading_screen.dart';
import 'package:lernworter/src/view/screens/writing_screen.dart';
import 'package:lernworter/src/widgets/button.dart';
import 'package:lernworter/src/widgets/textfield_with_buttons.dart';

import '../../constants/colors.dart';

class WordsListScreen2 extends StatefulWidget {
  const WordsListScreen2({Key? key}) : super(key: key);

  @override
  State<WordsListScreen2> createState() => _WordsListScreen2State();
}

class _WordsListScreen2State extends State<WordsListScreen2> {

  final listNameController=TextEditingController();

  int _value=1;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,top: 40,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                    width: size.width*0.3,
                    child: const Image(image: AssetImage("images/mascot.png",),fit: BoxFit.cover)),
              ),
              const SizedBox(height: 16,),
            //  TextFieldWithButtons( hintText: "List 1",controller: listNameController),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReadingScreen()));}, text: "Reading", buttonColor: kTextColor, height: 50,width: size.width*0.4,),
                  MyButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const WritingScreen()));}, text: "Writing", buttonColor: kTextColor, height: 50,width: size.width*0.4,),
                ],
              ),

              const SizedBox(height: 16,),

        const Text("Duration",style: TextStyle(fontFamily: "Andika Bold",fontSize: 18,color: kTextColor,),),

        Slider(
          value: _value.toDouble(),
          min: 1.0,
          max: 10.0,
          divisions: 10,
          activeColor: kTextColor,
          inactiveColor: Colors.grey,
          label: '$_value minutes',
          onChanged: (double newValue) {
            setState(() {
              _value = newValue.round();
            });
          },),

              // TextFieldWithButtons( hintText: "Word 1",controller: listNameController),
              // TextFieldWithButtons( hintText: "Word 2",controller: listNameController),
              // TextFieldWithButtons( hintText: "Word 3",controller: listNameController),

            ],
          ),
        ),
      ),
    );

  }
}
