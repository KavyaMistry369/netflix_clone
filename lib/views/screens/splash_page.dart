import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/route_utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  myTimer() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.of(context).pushReplacementNamed(MyRoutes.introPage);
    });
  }

  @override
  void initState() {
    super.initState();
    myTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(padding: const EdgeInsets.all(16),child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset("assets/images/logo.png",width: 250,),
           const SizedBox(height: 20,),
           const LinearProgressIndicator(
             backgroundColor: Colors.white,
             color: CupertinoColors.destructiveRed,
           ),
          ],
        ),
      ),),
    );
  }
}
