import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lernworter/src/constants/colors.dart';
import 'package:lernworter/src/provider/getPrefs_provider.dart';
import 'package:lernworter/src/view/screens/wordlist_screen.dart';
import 'package:lernworter/src/widgets/list_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey _key= GlobalKey();

  @override
  void initState() {
    setState(() {

    });
    // TODO: implement initState
    super.initState();
    setState(() {});
    getPrefs();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase([_key])
    );
  }

  List listName=[];
  List key=[];

  final c=GetPrefs();

  getPrefs()async {
   final prefs=await SharedPreferences.getInstance();
   String encodedData= prefs.getString(c.listNameController.text) ?? "";
   Map<String,dynamic> decodedMap = json.decode(encodedData);
   decodedMap.entries.forEach((e) => (listName.add(e.value)));
   decodedMap.entries.forEach((e) => (key.add("${e.key}")));
   setState(() {

   });
   print(key);
   print(listName);
  }

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<GetPrefs>(context);

    var size=MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Showcase(
        description: ("Tap to add words list"),radius: BorderRadius.circular(60),
        key: _key,
        child: FloatingActionButton(
          backgroundColor: kTextColor,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const WordsListScreen()));
          },
          child: const Icon(Icons.add,color: kCyanAccent,size: 40,),),
      ) ,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,top: 40,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Hero(
                  tag: "logo",
                  child: SizedBox(
                      width: size.width*0.3,
                      child: const Image(image: AssetImage("images/mascot.png",),fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(onPressed: (){
                print(listName);
              }, child: Container(color: Colors.red,height: 50,width: 100,)),
              const Text("Hi, let's get started",style: TextStyle(fontFamily: "Andika Bold",fontSize: 20,color: kTextColor,),),
              const SizedBox(height: 16,),
           //   Padding(padding: EdgeInsets.only(top: size.height/4),child: const Text("Empty List",style: TextStyle(color: kTextColor),),)
              SizedBox(
                height: size.height,
                width: size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listName.length,
                    itemBuilder: (context,index){
                      return ListCard(title: listName[index], onTap: (){});
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
