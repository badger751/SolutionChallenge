

import 'package:flutter/material.dart';

final color747480= Color.fromRGBO(116 , 116 , 128, 1);
final colorC1C1C1=Color.fromRGBO(193 , 193 , 193, 1);
final apnaColor=Color.fromRGBO(66, 187, 209,1);

class Palette { 
  static const MaterialColor kToDark = MaterialColor( 
    0xff42BBD1, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
     <int, Color>{ 
      50: const Color(0xff58ACBE ),//10% 
      100: const Color(0xffb74c3a),//20% 
      200: const Color(0xffa04332),//30% 
      300: const Color(0xff89392b),//40% 
      400: const Color(0xff733024),//50% 
      500: const Color(0xff5c261d),//60% 
      600: const Color(0xff451c16),//70% 
      700: const Color(0xff2e130e),//80% 
      800: const Color(0xff170907),//90% 
      900: const Color(0xff000000),//100% 
    }, 
  ); 
} 
