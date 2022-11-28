import 'package:app_test/app/modules/home/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SplashPage());
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/splash.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
