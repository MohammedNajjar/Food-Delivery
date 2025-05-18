import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './landingScreen.dart';
import '../utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    // Use a shorter duration in test mode
    final duration = kDebugMode ? const Duration(milliseconds: 100) : const Duration(milliseconds: 4000);
    
    _timer = Timer(duration, () {
      Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Center(
          child: Text(
            "Food Delivery",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
