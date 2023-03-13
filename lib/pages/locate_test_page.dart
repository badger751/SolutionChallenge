import 'package:flutter/material.dart';

class LocateTestPage extends StatefulWidget {
  LocateTestPage({Key? key}) : super(key: key);

  @override
  State<LocateTestPage> createState() => _LocateTestPageState();
}

class _LocateTestPageState extends State<LocateTestPage> {
  @override
  Widget build(BuildContext context) {
    return 
     Padding(
      padding: const EdgeInsets.only(top:28.0),
      child: Container(
        
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        child: Center(
            child: Column(children: [
          const Text("locate"),
        ])),
      ),
    );
  }
}