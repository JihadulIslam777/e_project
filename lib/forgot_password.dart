import 'package:e_project/theme_page.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          Icons.arrow_back,
          color: AppColor.black,
        ),
        elevation: 0,
        backgroundColor: AppColor.bodyColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Forgot password',
              style: OursProjectTheme.lightTextTheme.headline4,
            ),
            const SizedBox(height: 50),
            const Text(
              'Please, enter your email address. You will recieve a link to create a new password via email.',
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.always,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white,
                ),
                child: TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'e.g. abc1234@email.com',
                    labelText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: _validate,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 50),
                primary: AppColor.buttonColor,
                onPrimary: AppColor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text('SEND'),
            )
          ],
        ),
      ),
    );
  }
}
