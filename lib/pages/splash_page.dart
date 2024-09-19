import 'package:flutter/material.dart';
import 'package:laboratorio_1_sebastian_zuluaga/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  Future<void> _closeSplash() async{
    Future.delayed(const Duration(seconds: 2), () async{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  void initState(){
    _closeSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/images/letra-f.png'),
        ),
      ),
    );
  }
}

