import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lernworter/src/constants/colors.dart';
import 'package:lernworter/src/provider/getPrefs_provider.dart';
import 'package:lernworter/src/view/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GetPrefs()),
        ],
      child : MaterialApp(
      title: 'Lernworter',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: kBgColor,
          fontFamily: "Andika"
      ),
     home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    ));
  }
}


