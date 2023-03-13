import 'package:flutter/material.dart';

class EmergencyPage extends StatefulWidget {
  EmergencyPage({Key? key}) : super(key: key);

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  
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
            child:
                SingleChildScrollView(
                  child: Column(children: [
                  
                          const Text(
                            "What kind of emergency?",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height:h/50),
                           Container(
                          height:w/3 ,
                          width:w/3 ,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image:
                                AssetImage("assets/doctor-removebg-preview.png"),
                            fit: BoxFit.fill,
                          )),
                        ),
                        ElevatedButton(onPressed: (){}, child: 
                        const Text('Call a doctor',style: TextStyle(color: Colors.white),)),
                          Container(
                          height: w/3,
                          width: w/3,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image:
                                AssetImage("assets/2-removebg-preview.png"),
                            fit: BoxFit.fill,
                          )),
                        ),
                          ElevatedButton(onPressed: (){}, child: 
                        const Text('Call an ambulance',style: TextStyle(color: Colors.white),)),
                        Container(
                          height: w/3,
                          width: w/3,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image:
                                AssetImage("assets/3-removebg-preview.png"),
                            fit: BoxFit.fill,
                          )),
                        ),
                          ElevatedButton(onPressed: (){}, child: 
                        const Text('Urgency at home',style: TextStyle(color: Colors.white),)),
                        SizedBox(height: h/10,)
                        ]),
                )),
      ),
    );
  }
}
