import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    timerCount();
  }

  void timerCount() {
    Timer(const Duration(seconds: 3), () {
      Modular.to.pushNamed('home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width, //pega o tamanho do celular
        height: MediaQuery.of(context).size.height,
        child: Image.asset('assets/images/splash.png'),
      ),
    );
  }
}
