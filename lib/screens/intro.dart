import 'package:coffee_shop_app/screens/home.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _IntroImageWithGradient(),
          Transform.translate(
            offset: Offset(0, -60),
            child: _IntroTextAndButton(),
          ),
        ],
      ),
    );
  }
}

class _IntroImageWithGradient extends StatelessWidget {
  const _IntroImageWithGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset('Assets/Images/Intro.png', fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 60, //
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _IntroTextAndButton extends StatelessWidget {
  const _IntroTextAndButton();

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      fontSize: 32,
      height: 1.5,
      letterSpacing: 0.05 * 32,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    const subtitleTextStyle = TextStyle(
      fontSize: 14,
      height: 1.5,
      letterSpacing: 0.01 * 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFFA2A2A2),
    );
    const buttonTextStyle = TextStyle(
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    return Column(
      children: [
        SizedBox(
          width: 327,
          child: const Text(
            'Fall in Love with Coffee in Blissful Delight!',
            style: titleTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 327,
          child: const Text(
            'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
            style: subtitleTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: 328,
          height: 56,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFC67C4E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Get Started', style: buttonTextStyle),
          ),
        ),
      ],
    );
  }
}
