import 'package:e_project/theme_page.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      body: Padding(
        padding: EdgeInsets.only(left: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'My profile',
                style: OursProjectTheme.lightTextTheme.headline4,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Matilda Brown',
                          style: OursProjectTheme.lightTextTheme.subtitle1,
                        ),
                        Text('matildabrown@gmail.com'),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              profileOption(
                title: 'My orders',
                subtitle: 'Already have 12 orders',
              ),
              profileOption(
                title: 'Shipping address',
                subtitle: '3 addresses',
              ),
              profileOption(
                title: 'Payment methods',
                subtitle: 'Visa **34',
              ),
              profileOption(
                title: 'Promocodes',
                subtitle: 'You have special promocodes',
              ),
              profileOption(
                title: 'My reviews',
                subtitle: 'Reviews for 4 items',
              ),
              profileOption(
                title: 'Settings',
                subtitle: 'Notifications, password',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileOption({title, subtitle}) {
    return ListTile(
      title: Text(
        title,
        style: OursProjectTheme.lightTextTheme.subtitle1,
      ),
      subtitle: Text(
        subtitle,
        style: OursProjectTheme.lightTextTheme.caption,
      ),
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward_ios),
        onPressed: () {},
      ),
    );
  }
}
