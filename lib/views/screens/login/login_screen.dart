
import 'package:awakened_flutter/views/screens/login/feature/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          SectionLogo(),
          SectionLoginForm()
        ],
      ),
    );
  }
}

class SectionLogo extends StatelessWidget {
  const SectionLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            height: 80,
            width: 80,
            margin: const EdgeInsets.only(bottom: 8),
          ),
          const Text(
            'Meegha Bank',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontFamily: 'BebasNeue'),
          ),
          const Text(
            'The Premier Ismlamic Bank',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'SatisfyRegular'),
          )
        ],
      ),
    );
  }
}
