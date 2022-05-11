import 'package:e_project/theme_page.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  final _dateFocus = FocusNode();
  final _passwordFocus = FocusNode();
  void _validate() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  bool toggleButton1 = false;
  bool toggleButton2 = false;
  bool toggleButton3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.bodyColor,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColor.black,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: OursProjectTheme.lightTextTheme.headline4,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Personal Information',
                    style: OursProjectTheme.lightTextTheme.subtitle1,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'Enter your full name',
                        labelText: 'Full name',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Invalid name';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_dateFocus);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white),
                    child: TextFormField(
                      focusNode: _dateFocus,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: '12/12/1989',
                        labelText: 'Date of Birth',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Invalid name';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_passwordFocus);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Password',
                        style: OursProjectTheme.lightTextTheme.subtitle2,
                      ),
                      const Text('Change'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      focusNode: _passwordFocus,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Invalid name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Notifications',
                    style: OursProjectTheme.lightTextTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
          customSwitchTile('Sales', toggleButton1, (value) {
            setState(() {
              toggleButton1 = value;
            });
          }),
          customSwitchTile('New arrivals', toggleButton2, (value) {
            setState(() {
              toggleButton2 = value;
            });
          }),
          customSwitchTile('Delivery changes', toggleButton3, (value) {
            setState(() {
              toggleButton3 = value;
            });
          }),
        ],
      ),
    );
  }

  Widget customSwitchTile(title, boolValue, Function(bool value) changed) {
    return SwitchListTile(
      title: Text(title, style: OursProjectTheme.lightTextTheme.caption),
      value: boolValue,
      activeColor: Colors.green,
      inactiveTrackColor: Colors.grey,
      onChanged: changed,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
