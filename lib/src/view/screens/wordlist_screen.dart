
import 'package:flutter/material.dart';
import 'package:lernworter/src/widgets/textfield_with_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/colors.dart';
import 'dart:convert';
class WordsListScreen extends StatefulWidget {
  const WordsListScreen({Key? key}) : super(key: key);

  @override
  State<WordsListScreen> createState() => _WordsListScreenState();
}


class _WordsListScreenState extends State<WordsListScreen> {

  final listNameController=TextEditingController();
  final wordsController=TextEditingController();
 // final wordsEditController=TextEditingController();


  removeWidget(int ind, List list){
    list.removeAt(ind);
  }

  updateWord(int ind)
  {
    words[ind]=wordsEditController[ind].text;
  }

List<TextEditingController> wordsEditController=[];
Map<String,dynamic> listName={};
List words=[];
Map<String,List> wordsMap={};


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for(TextEditingController c in wordsEditController)
      {
        c.dispose();
      }
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async{

            listName[listNameController.text]= listNameController.text;
             wordsMap[listNameController.text]=words;

             String listTitle= json.encode(listName);
             String wordsList= json.encode(wordsMap);


            final  prefs = await SharedPreferences.getInstance();
            prefs.setString(listNameController.text, listTitle);
            prefs.setString(listNameController.text, wordsList);

            print('prefs set');

            },
          label: const Text("Save",
            style: TextStyle(color: kCyanAccent),),
          backgroundColor: kTextColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 40,right: 20),
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
                  boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0,10))],
                ),
                height: size.height/14,
                width: size.width,
                padding: const EdgeInsets.only(left: 20,top: 2),
                child: SizedBox(
                  width: size.width,
                  child:   TextField(
                    controller: listNameController,
                    style: const TextStyle(color: kTextColor),
                    decoration: const InputDecoration(
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
                      child:   TextField(
                        controller: wordsController,
                        style: const TextStyle(color: kTextColor),
                        decoration: const InputDecoration(
                          hintText: "Enter a word",
                          hintStyle: TextStyle(color: Colors.black38,fontSize: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                      onTap: () {
                        for(int i=0; i<=words.length; i++){
                          wordsEditController.add(TextEditingController());
                        }
                        setState(() {
                          if(wordsController.text!="")
                            {
                              words.add(wordsController.text);
                              wordsController.text='';
                              FocusManager.instance.primaryFocus!.unfocus();
                            }
                        });
                      },
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

              SizedBox(
                height: size.height/2-0.9,
                width: size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                  itemCount: words.length,
                  itemBuilder: (context,index){
                    return TextFieldWithButtons(
                      onTap:  (){
                        FocusScope.of(context).unfocus();
                        setState(() {
                          updateWord(index);
                        });
                      },
                      hintText: words[index],
                      controller: wordsEditController[index],
                      onDelete: (){
                        setState(() {
                          removeWidget(index, words);
                        });
                      },
                    );
                }),
              ),

            ],
          ),
        ),
      ),
    );

  }
}
