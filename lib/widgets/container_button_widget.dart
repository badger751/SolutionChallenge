import 'package:flutter/material.dart';
import 'package:heatlth1/theme/style.dart';

class ContainerButtonWidget extends StatelessWidget {
  final String title;
  final onTap;
  const ContainerButtonWidget({Key? key,required this.title,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap ,
      child: Container(height: 44,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration:BoxDecoration(
                    color: apnaColor,
                    borderRadius: BorderRadius.circular(10)
                  )
                  ,
                  child: Text("$title",style: TextStyle(fontSize: 16,color:Colors.white,fontWeight:FontWeight.w500),),),
    );
  }
}