import 'package:ecommerce_app/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/user_provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    // UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    // if (userProvider.getId() != null) {
    //   // Navigate to the main screen
    //   Navigator.pushReplacementNamed(context, '/Main');
    // }else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/Welcome.png',
              height: 250,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                textAlign: TextAlign.center,
                'Welcome to Online Shopping',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 60, vertical: 15),
                shadowColor: Colors.deepPurpleAccent,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
        ),
      );
    //}
  }
}
