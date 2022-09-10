import 'package:flutter/material.dart';
import 'package:lernworter/src/constants/colors.dart';
import 'package:lernworter/src/view/screens/wordlist_screen.dart';
import 'package:lernworter/src/view/screens/wordlist_screen2.dart';
import 'package:lernworter/src/widgets/list_card.dart';
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
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase([_key])
    );
  }

  @override
  Widget build(BuildContext context) {
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
              const Text("Hi, let's get started",style: TextStyle(fontFamily: "Andika Bold",fontSize: 20,color: kTextColor,),),
              const SizedBox(height: 16,),
           //   Padding(padding: EdgeInsets.only(top: size.height/4),child: const Text("Empty List",style: TextStyle(color: kTextColor),),)
              ListCard(title: "List 1", onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const WordsListScreen2()));}),
            ],
          ),
        ),
      ),
    );
  }
}
