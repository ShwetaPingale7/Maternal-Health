import 'package:flutter/material.dart';

class AshaLoginScreen extends StatelessWidget {
  const AshaLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ASHA Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'ASHA ID',
                prefixIcon: Icon(Icons.badge),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/asha_home'),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFAEC6CF)),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
