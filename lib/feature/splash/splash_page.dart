import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SPLASH'),
      ),
    );
  }
}
