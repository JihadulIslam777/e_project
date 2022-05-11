import 'package:e_project/provider/auth_provider.dart';
import 'package:e_project/route_pages/app_page.dart';
import 'package:e_project/theme_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'app_icon.dart';
import 'colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  void _validate() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColor.black,
        ),
        backgroundColor: AppColor.bodyColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sign Up',
                  style: OursProjectTheme.lightTextTheme.headline4,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white,
                ),
                child: TextFormField(
                  controller: userName,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Enter your name here',
                    labelText: 'Name',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required valid name';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_emailFocus);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white),
                child: TextFormField(
                  controller: email,
                  focusNode: _emailFocus,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Enter your email here',
                    labelText: 'Email',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required valid email';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white),
                child: TextFormField(
                  controller: password,
                  focusNode: _passwordFocus,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Enter your password here',
                    labelText: 'Password',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required valid password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Already have an account?',
                    style: OursProjectTheme.lightTextTheme.subtitle2,
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.login);
                    },
                    icon: const Icon(Icons.arrow_forward),
                    color: AppColor.buttonColor,
                  )
                ],
              ),
              const SizedBox(height: 25),
              Consumer<AuthProvider>(
                builder: (context, authP, child) => authP.isRequesting
                    ? const LinearProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'SIGN UP',
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 50),
                          primary: AppColor.buttonColor,
                          onPrimary: AppColor.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Or sign up with social account',
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white,
                      ),
                      child: const Icon(
                        Socicon.google,
                        color: Colors.blue,
                        size: 15,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white,
                      ),
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
