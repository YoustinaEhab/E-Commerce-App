import 'package:ecommerce_app/Pages/ProfilePage/profile_screen.dart';
import 'package:ecommerce_app/pages/register_screen.dart';
import 'package:ecommerce_app/Pages/splash_screen.dart';
import 'package:ecommerce_app/Providers/user_provider.dart';
import 'package:ecommerce_app/pages/login_screen.dart';
import 'package:ecommerce_app/Pages/main_screen.dart';
import 'package:ecommerce_app/Data/dbhelper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'Providers/cart_provider.dart';
import 'Providers/favorites_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDB();
  await DatabaseHelper.initCategories();
  await DatabaseHelper.initItems();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider( create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
        child: MaterialApp(
          title: 'E-commerce Application',
          //theme: ThemeData(brightness: Brightness.light),
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: const SplashPage(),
          routes: {
            '/Login': (context) => const LoginPage(),
            '/Register': (context) => const RegisterPage(),
            '/Main': (context) => const MainPage(),
            '/Profile': (context) => const ProfilePage(),
          },
        ),
    );
  }
}
