import 'package:flutter/material.dart';

import 'const.dart';
import 'pages/forgot_password_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

class OnGenerateRoute{
  static Route<dynamic> route(RouteSettings settings){
    final args=settings.arguments;
    switch(settings.name){
      case "/":{return materialBuilder(widget: LoginPage());}
      case PageConst.forgotPasswordPage:{return materialBuilder(widget: ForgotPasswordPage());}
      case PageConst.registerPage:{return materialBuilder(widget: RegisterPage());}
      case PageConst.loginPage:{return materialBuilder(widget: LoginPage());}
      default:return materialBuilder(widget: ErrorPage());
    }
  }
}
MaterialPageRoute materialBuilder({required Widget widget}){
  return MaterialPageRoute(builder: (_)=>widget);
}

class ErrorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
    (title: Text("Error Page")),
    body: Center(child: Text("Error Page")),
    );
  }
}