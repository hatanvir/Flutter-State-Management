import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_flutter/di/service_locator.dart';
import 'package:riverpod_flutter/home/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), _nextScreen);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text('Bloc',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white
        ),),
      ),
    );
  }

   _nextScreen() {
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> HomeScreen()));
  }
}

