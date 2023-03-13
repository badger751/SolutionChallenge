import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heatlth1/const.dart';
import 'package:heatlth1/main.dart';
import 'package:heatlth1/theme/style.dart';
import 'package:heatlth1/utils.dart';
import 'package:heatlth1/widgets/container_button_widget.dart';
import 'package:heatlth1/widgets/emailValidation_container_widget.dart';
import 'package:heatlth1/widgets/headerWidget.dart';
import 'package:heatlth1/widgets/passwordValidation_container_widget.dart';
import 'package:heatlth1/widgets/row_text_widget.dart';
import 'package:heatlth1/widgets/text_container_widget.dart';
import 'package:heatlth1/widgets/text_password_container_widget.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordAgainController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  
 
  @override
  void dispose() {
    _usernameController.dispose;
    _emailController.dispose;
    _passwordController.dispose;
    _passwordAgainController.dispose;
    _dobController.dispose;
    _genderController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
              child: Column(
                children: [
                  const HeaderWidget(title: "Registration"),
                  const SizedBox(
                    height: 10,
                  ),
                  _profileWidget(),
                
                ],
              ))),
    );
  }

  Widget _profileWidget() {
    return Column(
      children: [
        Container(
          height: 62,
          width: 62,
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/profile_chat.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text("Add profile photo",
            style: TextStyle(
              color: apnaColor,
            )),
        const SizedBox(
          height: 12,
        ),
        TextContainerWidget(
          keyboardType: TextInputType.text,
          prefixIcon: Icons.person,
          controller: _usernameController,
          hintText: 'username',
        ),
        const SizedBox(
          height: 12,
        ),
        TextContainerWidget(
          keyboardType: TextInputType.text,
          prefixIcon: Icons.email,
          controller: _emailController,
          hintText: 'email',
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(indent: 120, endIndent: 120, thickness: 2),
        const SizedBox(
          height: 12,
        ),
        TextPasswordContainerWidget(
          controller: _passwordController,
          hintText: 'password',
          keyboardType: TextInputType.text,
          prefixIcon: Icons.lock,
        ),
        const SizedBox(
          height: 12,
        ),
        TextPasswordContainerWidget(
          controller: _passwordAgainController,
          keyboardType: TextInputType.text,
          hintText: 'confirm password',
          prefixIcon: Icons.lock,
        ),
        const SizedBox(
          height: 12,
        ),
        TextContainerWidget(
          keyboardType: TextInputType.text,
          prefixIcon: Icons.email,
          controller: _dobController,
          hintText: 'D.O.B',
        ),
        const SizedBox(
          height: 12,
        ),
        TextContainerWidget(
          keyboardType: TextInputType.text,
          prefixIcon: Icons.email,
          controller: _genderController,
          hintText: 'gender',
        ),
        const SizedBox(
          height: 12,
        ),
        ContainerButtonWidget(title: 'Register', onTap: signUp),
        const SizedBox(
          height: 12,
        ),
        RowTextWidget(
          title1: 'Do you have already an account?',
          mainAxisAlignment: MainAxisAlignment.center,
          title2: 'Login',
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, PageConst.loginPage, (route) => false);
          },
        ),
        const SizedBox(
          height: 12,
        ),
        _rowDataWidget(),
      ],
    );
  }

  Widget _rowDataWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'By clicking register, you agree to the',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: colorC1C1C1),
        ),
        Text(
          'Privacy Policy',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: apnaColor),
        ),
      ],
    );
  }

  Future signUp() async {
    // final isValid = formKey.currentState!.validate();
    // if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim())
          .then((value) {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(value.user?.uid)
            .set({
          "email": _emailController.text.trim(),
          "name": _usernameController.text.trim(),
          "isAdmin": false
        });
      });
      ;
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
