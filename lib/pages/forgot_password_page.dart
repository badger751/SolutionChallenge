import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heatlth1/const.dart';
import 'package:heatlth1/main.dart';
import 'package:heatlth1/utils.dart';
import 'package:heatlth1/widgets/container_button_widget.dart';
import 'package:heatlth1/widgets/headerWidget.dart';
import 'package:heatlth1/widgets/row_text_widget.dart';
import 'package:heatlth1/widgets/text_container_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
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
              const HeaderWidget(title: "Forgot Password"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "Don't worry! Just fill in your email and ${AppConst.appName} will send you a link to rest your password"),
              const SizedBox(
                height: 20,
              ),
              TextContainerWidget(
                controller: _emailController,
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              ContainerButtonWidget(
                title: "Send Password Reset Email",
                onTap: resetPassword,
              ),
              const SizedBox(
                height: 20,
              ),
              RowTextWidget(
                title1: "Remember the account information?",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, PageConst.loginPage, (route) => false);
                },
                title2: "Login",
              ),
            ],
          )),
    ));
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      Utils.showSnackBar('Password reset email sent');
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
