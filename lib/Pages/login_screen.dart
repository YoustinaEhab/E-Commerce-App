import 'package:ecommerce_app/Providers/user_provider.dart';
import 'package:ecommerce_app/Data/user.dart';
import 'package:ecommerce_app/Data/dbhelper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/cart_provider.dart';
import '../Providers/favorites_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Positioned(
              top: 0,
              left: 0,
              child: Image(
                image: AssetImage('assets/registerLogin.jpg'),
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    const Text(
                      'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _emailController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        //return null if there is no error, else return the error message
                        var emailRegex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty!";
                        } else if (!emailRegex.hasMatch(value)) {
                          return 'Incorrect format!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isPasswordHidden,
                      maxLines: 1,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordHidden = !_isPasswordHidden;
                            });
                          },
                          icon: _isPasswordHidden
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty!";
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          bool isUserPresent = await DatabaseHelper.isUserPresent(email, password);
                          if (isUserPresent) {
                            var currentUserInfo = await DatabaseHelper.getUserInfo(email);
                            // Set the user in UserProvider
                            UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
                            userProvider.setUser(currentUserInfo['id'], User.fromJson(currentUserInfo));
                            // SharedPreferences prefs = await SharedPreferences.getInstance();
                            // prefs.setInt('userId', currentUserInfo['id']);

                            // Set the user ID in FavoritesProvider
                            FavoritesProvider favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
                            await favoritesProvider.setUserId(currentUserInfo['id'], );

                            // Set the user ID in CartProvider
                            CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
                            await cartProvider.setUserId(currentUserInfo['id'], );

                            Navigator.pushReplacementNamed(context, '/Main');
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                      'Incorrect email or password!',style: TextStyle(color: Colors.deepPurple)),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        //this line below us just for showing that you can use different ways of pop
                                        // Navigator.popUntil(context, ModalRoute.withName('/Login'));
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontSize: 16,color: Colors.deepPurpleAccent),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/Register');
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
