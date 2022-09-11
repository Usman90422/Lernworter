import 'package:flutter/material.dart';
import 'package:lernworter/src/view/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3),() async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ShowCaseWidget(
          builder: Builder(
              builder : (context) => const HomeScreen(),
      ),
      ),

      ));

    });
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: kBgColor,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: "logo",
              child: SizedBox(
                  width: size.width*0.5,
                  child: const Image(image: AssetImage("images/mascot.png",),fit: BoxFit.cover)),
            ),
          ),
          const Center(
            child: Text("Lernwörter",style: TextStyle(color: kTextColor,fontSize: 25,fontFamily: "Andika Bold"),),
          ),
        ],
      ),
    );
  }
}