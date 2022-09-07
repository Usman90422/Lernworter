import 'package:flutter/material.dart';
import 'package:lernworter/src/view/screens/home_screen.dart';

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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: kBgColor,
      body:  Column(
        children: [
          Center(
            child: Hero(
              tag: "logo",
              child: SizedBox(
                  width: size.width*0.6,
                  child: const Image(image: AssetImage("images/mascot.png",),fit: BoxFit.cover)),
            ),
          ),
          Center(
            child: Text("Lernwörter",style: TextStyle(color: kTextColor,fontSize: 20),),
          ),
        ],
      ),
    );
  }
}