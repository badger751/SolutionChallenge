import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";

 _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        name = ds.data()!['name'];
      }).catchError((e) {
        print(e);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column
    (
      children: [
       
        Expanded(
          child: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Container(
            
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),
            child: Center(
                child: Column(children: [
                  SizedBox(height: h/40,),
                   Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
            child: FutureBuilder(
              future: _fetch(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Text(' ');
                } else {
                  return Text(
                    'Welcome! $name',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  );
                }
              }),
            ),
          ),
           
            ])),
          ),
              ),
        ),
    ]);
  }
}
