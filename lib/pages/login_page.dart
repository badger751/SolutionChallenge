import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:heatlth1/main.dart';
import 'package:heatlth1/theme/style.dart';
import 'package:heatlth1/widgets/text_password_container_widget.dart';
import '../const.dart';
import '../widgets/container_button_widget.dart';
import '../widgets/headerWidget.dart';
import '../widgets/row_text_widget.dart';
import '../widgets/text_container_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
            child: Column(
              children: [
                const HeaderWidget(title: 'Login'),
                const SizedBox(height: 10),
                Container(
                  height: h / 4,
                  width: w / 1.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/heal4-removebg-preview.png"),
                    fit: BoxFit.fill,
                  )),
                ),
                TextContainerWidget(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    prefixIcon: Icons.email),
                const SizedBox(height: 10),
                TextPasswordContainerWidget(
                  keyboardType: TextInputType.emailAddress,
                  controller: _passwordController,
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(height: 10),
                _forgotPasswordWidget(),
                const SizedBox(height: 10),
                ContainerButtonWidget(title: "Login", onTap: signIn),
                const SizedBox(height: 10),
                RowTextWidget(
                  title1: "Don't have an account?",
                  onTap: () {
                    Navigator.pushNamed(context, PageConst.registerPage);
                  },
                  title2: "Register",
                ),
                const SizedBox(height: 10),
                _rowGoogleWidget(),
              ],
            )),
      ),
    );
  }

  Widget _forgotPasswordWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "",
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, PageConst.forgotPasswordPage);
          },
          child: Text(
            "Forgot Password?",
            style: TextStyle(
                color: apnaColor, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }

  Widget _rowGoogleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            //fix me
          },
          child: Container(
            height: 50,
            width: 50,
            child: Icon(
              AntDesign.google,
              color: apnaColor,
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          ),
        )
      ],
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
