

// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flower_app/pages/checkout.dart';
import 'package:flower_app/pages/details_screen.dart';
import 'package:flower_app/pages/home.dart';
import 'package:flower_app/pages/login.dart';
import 'package:flower_app/pages/register.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'firebase_options.dart';
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return     ChangeNotifierProvider(
      create: (context) {return Cart();},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          RegisterPage.id:(context) => RegisterPage(),
          LoginPage.id:(context) => LoginPage(),
          HomePage.id:(context) => HomePage(),
          CheckOutPage.id:(context) => CheckOutPage(),
          
        },
        initialRoute: RegisterPage.id,
      ),
    );
  }
}








