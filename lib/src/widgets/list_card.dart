import 'package:flutter/material.dart';
import 'package:lernworter/src/constants/colors.dart';


class ListCard extends StatefulWidget {
  const ListCard({
    required this.title,

    required this.onTap,
    Key? key,
  }) : super(key: key);


  final String title;
  final VoidCallback onTap;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kTextColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(color: Colors.black12,offset: Offset(0,5),blurRadius: 2)],
        ),
        width: size.width,
        height: size.height*0.08,
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Text(widget.title,style: const TextStyle(color: kCyanAccent,fontSize: 18,fontFamily: "Pacifico Bold"),),
      ),
    );
  }
}
