import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../theme/style.dart';

class PasswordValidationContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final String? hintText;
  
  const PasswordValidationContainerWidget({Key? key,this.controller,this.prefixIcon,this.keyboardType,this.hintText}) : super(key: key);

  @override
  State<PasswordValidationContainerWidget> createState() => _PasswordValidationContainerWidgetState();
}

class _PasswordValidationContainerWidgetState extends State<PasswordValidationContainerWidget> {
   bool isobscureText=true;
  
  @override
  Widget build(BuildContext context) {
    return  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: color747480.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      obscureText:isobscureText,
                        keyboardType: widget.keyboardType,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator:(value) =>(value!=null&&value.length<6)?'Enter min. 6 characters':null ,
                        controller: widget.controller,
                        decoration: InputDecoration(
                          hintText: widget.hintText,
                            border: InputBorder.none,
                            suffixIcon: InkWell(onTap:(){setState(() {
                              isobscureText=!isobscureText;
                            });} , child: Icon(isobscureText? MaterialIcons.remove_red_eye:MaterialIcons.panorama_fish_eye)),
                            prefixIcon: Icon(widget.prefixIcon))),
                  
    );
  }
}