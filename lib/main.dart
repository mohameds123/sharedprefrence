import 'package:flutter/material.dart';
import 'package:sharedprefexamit/enum.dart';
import 'package:sharedprefexamit/home_screen.dart';
import 'package:sharedprefexamit/login_screen.dart';
import 'package:sharedprefexamit/shared.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();

  bool isLoggedIn = MyCache.getString(key: MyCacheKeys.email)!=null;

  runApp(MyApp(isLogged: isLoggedIn,));

}

class MyApp extends StatelessWidget {
  final bool isLogged;
  const MyApp({super.key,required this.isLogged});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: isLogged ?HomeScreen():LoginScreen(),
    );
  }
}

