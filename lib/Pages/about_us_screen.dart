import 'package:ecommerce_app/Pages/contact_us_screen.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
          'About Us',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 2,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/Login'),
          icon: const Icon(Icons.logout),
          color: Colors.deepPurple,
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            extendedSizeConstraints: BoxConstraints.tightFor(height: 40),
          ),
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactUs()));
          },
          backgroundColor: Colors.deepPurpleAccent,
          label: const Text(
            'Contact Us',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 800,
            width: 320,
            child: Column(
              children: [
                Image.asset('assets/SPLASHHH.jpg'),
                Container(
                  width: 200,
                  height: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 200,
                  height: 30,
                ),
                const Text(
                  'Who are we?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 200,
                  height: 20,
                ),
                const Text(
                  'We are a new online commerce application. Our main goal is to help you get whatever you wish as soon as possible and as perfect as possible.',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
