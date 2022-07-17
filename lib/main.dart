import 'package:flutter/material.dart';
import 'package:flutter_shoes/pages/edit_profile.dart';
import 'package:flutter_shoes/pages/home_page.dart';
import 'package:flutter_shoes/pages/profile_page.dart';

// Run | Debug | Profile
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shoes',
      theme: ThemeData.dark(),
      home: const HomePageShoes(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => const HomePageShoes(),
        '/ProfileScreen': (BuildContext context) => const ProfilePage(),
        '/EditProfileScreen': (BuildContext context) => const EditProfilePage(),
      },
    ); // MaterialApp
  }
}

// Build a stless widget
