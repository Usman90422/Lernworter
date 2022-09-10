import 'package:flutter/material.dart';
import 'package:lernworter/src/widgets/textfield_with_buttons.dart';

import '../../constants/colors.dart';

class WordsListScreen extends StatefulWidget {
  const WordsListScreen({Key? key}) : super(key: key);

  @override
  State<WordsListScreen> createState() => _WordsListScreenState();
}

class _WordsListScreenState extends State<WordsListScreen> {

final listNameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: const Text("Save",style: TextStyle(color: kCyanAccent),),backgroundColor: kTextColor),
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
              Container(
                decoration: BoxDecoration(
                  color: kCyanAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0,10))],
                ),
                height: size.height/14,
                width: size.width,
                padding: const EdgeInsets.only(left: 20,top: 2),
                child: SizedBox(
                  width: size.width,
                  child:  const TextField(
                    style: TextStyle(color: kTextColor),
                    decoration: InputDecoration(
                      hintText: "Enter the words list name",
                      hintStyle: TextStyle(color: Colors.black38,fontSize: 15),
                      border: InputBorder.none,

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kCyanAccent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0,10))],
                    ),
                    height: size.height/14,
                    width: size.width*0.7,
                    padding: const EdgeInsets.only(left: 20,top: 2),
                    child: SizedBox(
                      width: size.width,
                      child:  const TextField(
                        style: TextStyle(color: kTextColor),
                        decoration: InputDecoration(
                          hintText: "Enter a word",
                          hintStyle: TextStyle(color: Colors.black38,fontSize: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                      onTap: () {  },
                      child: Container(
                        width: size.width*0.14,
                      height: 50,
                      decoration:  BoxDecoration(
                        color: kTextColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(Icons.add,color: kCyanAccent,))),
                ],
              ),
              const SizedBox(height: 16,),
              TextFieldWithButtons( hintText: "Word 1",controller: listNameController,),
              TextFieldWithButtons( hintText: "Word 2",controller: listNameController,),
              TextFieldWithButtons( hintText: "Word 3",controller: listNameController,),
              const SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );

  }
}
