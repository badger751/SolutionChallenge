import 'package:flutter/material.dart';
import 'package:heatlth1/theme/style.dart';

class SchemesPage extends StatefulWidget {
  SchemesPage({Key? key}) : super(key: key);

  @override
  State<SchemesPage> createState() => _SchemesPageState();
}

class _SchemesPageState extends State<SchemesPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                height: h / 2.5,
                width: w / 1.2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/heal3-removebg-preview.png"),
                  fit: BoxFit.fill,
                )),
              ),
              SizedBox(height: h / 15),
              Row(children: [
                Container(
                  height: h / 20,
                  width: w / 1.2,
                  padding: EdgeInsets.only(left: w / 20),
                  child: const Text(
                      'Find government health care schemes in your location easily and avail them',style: TextStyle(fontSize:20),),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                  color: apnaColor,
                ),
              ]),
              const SizedBox(height: 20),
              Row(children: [
                Container(
                  height: h / 20,
                  width: w / 1.2,
                  padding: EdgeInsets.only(left: w / 20),
                  child:
                      const Text('Find medical camps and Janosadhi centers near you',style: TextStyle(fontSize:20)),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                  color: apnaColor,
                ),
                SizedBox(height: h/10,)
              ]),
              SizedBox(height: h/10,)
            ],
          )),
        ),
      ),
    );
  }
}
