import 'package:flutter/material.dart';
import 'package:flutter_shoes/pages/edit_profile.dart';

import '../models/user.dart';
import '../widgets/profile_widget.dart';
import '../widgets/user_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  final user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        backgroundColor: Colors.grey.shade700,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: const Text('Edit Profile'),
                        ),
                        body: const EditProfilePage()),
                  ),
                );
              },
            ),
            buildName(user),
            const SizedBox(height: 24),
            const SizedBox(height: 24),
            const SizedBox(height: 24),
            const SizedBox(height: 48),
            buildAbout(user),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
