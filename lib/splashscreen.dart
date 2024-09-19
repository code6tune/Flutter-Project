import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machinetest/homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with SingleTickerProviderStateMixin {
 

    @override
    void initState(){
      super.initState();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      Future.delayed(const Duration(seconds: 5),(){
       Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_)=> const HomePage(title: '',))
       );
      });
    }
    @override
    void dispose(){
    
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
      super.dispose();
    }
    
     
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue,Colors.pink],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('DealsDray',
          style: TextStyle(color: Colors.white,fontSize: 35),),
          SizedBox(height: 20),
          CircularProgressIndicator()

        ],

      ),

    )
    );

  }
}

