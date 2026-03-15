import 'package:flutter/material.dart';
import 'dart:math';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  'Welcome to\nMaternal Care',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                        height: 1.2,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Your journey to healthy motherhood begins here.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 60),
                Text(
                  'Enter Phone Number',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'e.g. 9876543210',
                    prefixIcon: Icon(Icons.phone_android_outlined),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_phoneController.text.length < 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a valid phone number')),
                      );
                      return;
                    }

                    // 1. Generate a random 4-digit OTP
                    String generatedOtp = (Random().nextInt(9000) + 1000).toString();

                    // 2. Show OTP in a SnackBar (Simulating SMS)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Your OTP is: $generatedOtp'),
                        duration: const Duration(seconds: 10),
                        action: SnackBarAction(label: 'OK', onPressed: () {}),
                      ),
                    );

                    // 3. Navigate to OTP Screen with the code
                    Navigator.pushNamed(context, '/otp', arguments: generatedOtp);
                  },
                  child: const Text(
                    'Get OTP',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/asha_login');
                    },
                    child: Text(
                      'Are you an ASHA Worker? Login here',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
