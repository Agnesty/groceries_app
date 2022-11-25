import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app_with_firebase/screens/homescreen.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            // big logo
            SizedBox(
              width: 400,
              height: 250,
              child: LottieBuilder.network("https://assets2.lottiefiles.com/private_files/lf30_vb7v5ca0.json"),
              ),

            // we deliver groceries at your doorstep
            Padding(
              padding: const EdgeInsets.only(right: 28, left: 28, bottom: 28),
              child: Text(
                'Agnesty groceries at your door!',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),

            // groceree gives you fresh vegetables and fruits
            Text(
              'Bahan berkualitas dan \nterjaga alami',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            const Spacer(),

            // get started button
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange.shade500,
                ),
                child: const Text(
                  "Mulai Belanja",
                  style: TextStyle(
                    color: Colors.white,
                     fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}