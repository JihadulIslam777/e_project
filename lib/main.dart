import 'package:e_project/log_in.dart';
import 'package:e_project/provider/auth_provider.dart';
import 'package:e_project/provider/provider.dart';
import 'package:e_project/route_pages/app_page.dart';
import 'package:e_project/settings.dart';
import 'package:e_project/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductProvider()),
        ChangeNotifierProvider(create: (ctx) => AuthProvider())
      ],
      child: MaterialApp(
        initialRoute: AppPages.initialRoute,
        routes: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
