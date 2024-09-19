import 'package:flutter/material.dart';
import 'package:machinetest/splashscreen.dart';
import 'package:machinetest/homepage.dart';
import 'package:machinetest/otp_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        
      ),
      home: const Splashscreen(),
      routes: {
        '/homepage': (context) => const HomePage(title: '',),
        '/otppage':(context) => const OTPpage(),
        
      },
    
      
      
      
    );
  }
}

