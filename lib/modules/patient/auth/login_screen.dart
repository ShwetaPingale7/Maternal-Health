import 'package:flutter/material.dart';
import 'dart:math';
import '../../../app_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
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
                  state.translate('Welcome to\nMaternal Care', 'मातृत्व देखभाल में\nआपका स्वागत है', 'मातृत्व काळजी मध्ये\nआपले स्वागत आहे'),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                        height: 1.2,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  state.translate('Your journey to healthy motherhood begins here.', 'स्वस्थ मातृत्व की आपकी यात्रा यहीं से शुरू होती है।', 'निरोगी मातृत्व कडे तुमचा प्रवास इथून सुरू होतो.'),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 60),
                Text(
                  state.translate('Enter Phone Number', 'फ़ोन नंबर दर्ज करें', 'फोन नंबर टाका'),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: state.translate('e.g. 9876543210', 'जैसे 9876543210', 'उदा. 9876543210'),
                    prefixIcon: const Icon(Icons.phone_android_outlined),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_phoneController.text.length < 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text(state.translate('Please enter a valid phone number', 'कृपया एक वैध फोन नंबर दर्ज करें', 'कृपया वैध फोन नंबर टाका'))),
                      );
                      return;
                    }

                    // 1. Generate a random 4-digit OTP
                    String generatedOtp = (Random().nextInt(9000) + 1000).toString();

                    // 2. Show OTP in a SnackBar (Simulating SMS)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${state.translate('Your OTP is', 'आपका ओटीपी है', 'तुमचा ओटीपी आहे')}: $generatedOtp'),
                        duration: const Duration(seconds: 10),
                        action: SnackBarAction(label: state.translate('OK', 'ठीक है', 'ठीक आहे'), onPressed: () {}),
                      ),
                    );

                    // 3. Navigate to OTP Screen with the code
                    Navigator.pushNamed(context, '/otp', arguments: generatedOtp);
                  },
                  child: Text(
                    state.translate('Get OTP', 'ओटीपी प्राप्त करें', 'ओटीपी मिळवा'),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/asha_login');
                    },
                    child: Text(
                      state.translate('Are you an ASHA Worker? Login here', 'क्या आप आशा कार्यकर्ता हैं? यहाँ लॉगिन करें', 'तुम्ही आशा स्वयंसेविका आहात का? येथे लॉगिन करा'),
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
