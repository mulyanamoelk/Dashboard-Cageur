import 'dart:async';

import 'package:dashboard_cageur/pages/signin_page/signin.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class splash_satu extends StatefulWidget {
  const splash_satu({Key? key}) : super(key: key);

  @override
  State<splash_satu> createState() => _splash_satuState();
}

class _splash_satuState extends State<splash_satu> {
  @override
  void initState() {
    super.initState();
    splash_satu();
  }

  splash_satu() async {
    var duration = Duration(seconds: 3);
    Timer(duration, () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignInPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_fxvz0c.json',
            width: 341,
            height: 327),
      ),
    ));
  }
}
