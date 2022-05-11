import 'package:e_project/provider/auth_provider.dart';
import 'package:e_project/provider/provider.dart';
import 'package:e_project/theme_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_icon.dart';
import 'colors.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();
  void _validate() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      appBar: AppBar(
        backgroundColor: AppColor.bodyColor,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColor.black,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'LogIn',
                    style: OursProjectTheme.lightTextTheme.headline4,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'e.g. abc1234@email.com',
                      labelText: 'Email',
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_emailFocus);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    focusNode: _emailFocus,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                      hintText: '*******',
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot your password?',
                      style: OursProjectTheme.lightTextTheme.bodyText2,
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward_sharp,
                      color: AppColor.buttonColor,
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Consumer<AuthProvider>(
                  builder: (ctx, provider, child) => provider.isRequesting
                      ? const LinearProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            provider.getLogIn(emailController.text.trim(),
                                passwordController.text.trim(), context);
                          },
                          child: Text(
                            'Log in',
                            // provider.textValue,
                            style: OursProjectTheme.lightTextTheme.button,
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: AppColor.buttonColor,
                            onPrimary: AppColor.white,
                            minimumSize: const Size(300, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 50),
                Text(
                  "",
                  style: OursProjectTheme.lightTextTheme.caption,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 150,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Socicon.google,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
