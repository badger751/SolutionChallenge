import 'package:flutter/material.dart';
import 'package:heatlth1/theme/style.dart';

class RowTextWidget extends StatelessWidget {
  final String? title1;
  final String? title2;
  final onTap;
  final MainAxisAlignment? mainAxisAlignment;
  const RowTextWidget({Key? key,this.title1,this.title2,this.onTap,this.mainAxisAlignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment==null?MainAxisAlignment.start:MainAxisAlignment.center,
    children: [
      Text("$title1"),
      SizedBox(width: 5,),
      InkWell(
          onTap: onTap,
          child: Text("$title2", style: TextStyle(color: apnaColor)))
    ],
  );;
  }
}