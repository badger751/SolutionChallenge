import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heatlth1/pages/home_page.dart';
import 'package:heatlth1/theme/style.dart';
import 'package:heatlth1/utils.dart';
import 'on_generate_route.dart';
import 'pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
final navigatorKey=GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey:Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Palette.kToDark),
      onGenerateRoute: OnGenerateRoute.route,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child:CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Center(child: Text('Something went wrong'),);
          }
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginPage();
          }
        }, 
      ),
      // initialRoute: '/',
      // routes: {
      //   "/": (context) => LoginPage(),
      // },
    );
  }
}
