import 'package:flutter/material.dart';
import '../../../app_state.dart';

class AshaLoginScreen extends StatelessWidget {
  const AshaLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
    return Scaffold(
      appBar: AppBar(title: Text(state.translate('ASHA Login', 'आशा लॉगिन', 'आशा लॉगिन'))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: state.translate('ASHA ID', 'आशा आईडी', 'आशा आयडी'),
                prefixIcon: const Icon(Icons.badge),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: state.translate('Password', 'पासवर्ड', 'पासवर्ड'),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/asha_home'),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFAEC6CF)),
              child: Text(state.translate('Login', 'लॉगिन करें', 'लॉगिन करा')),
            ),
          ],
        ),
      ),
    );
  }
}
