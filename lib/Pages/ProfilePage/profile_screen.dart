import 'package:ecommerce_app/Pages/ProfilePage/widgets/profile_picture.dart';
import 'package:ecommerce_app/Pages/ProfilePage/widgets/profile_info.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.deepPurple,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/Login'),
          icon: const Icon(Icons.logout),
          color: Colors.deepPurple,
        ),
        ]
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: const [
              SizedBox(
                height: 15,
              ),
              Center(
                child: ProfilePicture(),
              ),
              SizedBox(
                height: 35,
              ),
              ProfileInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
