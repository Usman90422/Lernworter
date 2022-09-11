import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TextFieldWithButtons extends StatefulWidget {
   const TextFieldWithButtons({
    this.controller,
    required this.hintText,
    this.onTap,
    Key? key,
    required this.onDelete,
     this.onDone,

  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final VoidCallback? onDone;
  final VoidCallback onDelete;



  @override
  State<TextFieldWithButtons> createState() => _TextFieldWithButtonsState();
}

class _TextFieldWithButtonsState extends State<TextFieldWithButtons> {

  bool isEditable=false;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: kCyanAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0,10))],
            ),
            height: size.height/14,
            width: size.width*0.6,
            padding: const EdgeInsets.only(left: 20,top: 2),
            child: SizedBox(
              width: size.width,
              child:  TextField(
                enabled: isEditable,
                onEditingComplete: widget.onTap,
                style: const TextStyle(color: kTextColor),
                controller: widget.controller,
                decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(color: kTextColor,fontSize: 12),
                    border: InputBorder.none,

                ),
              ),
            ),
          ),

          GestureDetector(
              onTap: (){
                setState(() {
                  isEditable=!isEditable;
                });
              }, child:  const Icon( Icons.edit,color: kTextColor,size: 30,)),

          GestureDetector(onTap: widget.onDelete,
          child: const Icon(Icons.delete_forever,color: Colors.redAccent,size: 30,)),
        ],
      ),
    );
  }
}




