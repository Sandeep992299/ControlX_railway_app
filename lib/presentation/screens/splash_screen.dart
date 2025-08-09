import 'package:flutter/material.dart';
import 'package:sl_railways_app/presentation/screens/emp_registration_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate loading and navigate to login screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF0A6FFF),
        child: Stack(
          children: [
            // Centered train logo in white
            Center(
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Bottom decorative silhouette
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 130,
                child: Image.asset(
                  'assets/images/sri_lanka_silhouette.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Copyright text at bottom center
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Text(
                'Copyrights © 2025 ControlX (Pvt) Ltd All Rights Reserved',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(179, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
