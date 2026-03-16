import 'package:flutter/material.dart';
import '../../app_state.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF9F9), Color(0xFFFFD3B6)],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.language, size: 80, color: Color(0xFFFF8B94)),
              const SizedBox(height: 24),
              const Text(
                'Choose Language',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Text(
                'भाषा चुनें  •  भाषा निवडा',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 48),
              _buildLangButton(context, 'English', 'A', const Color(0xFFFF8B94), AppLanguage.english),
              const SizedBox(height: 20),
              _buildLangButton(context, 'हिंदी (Hindi)', 'अ', const Color(0xFFFFAAA5), AppLanguage.hindi),
              const SizedBox(height: 20),
              _buildLangButton(context, 'मराठी (Marathi)', 'म', const Color(0xFFFFD3B6), AppLanguage.marathi),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLangButton(BuildContext context, String label, String iconText, Color color, AppLanguage lang) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: color, width: 2),
          ),
          elevation: 5,
        ),
        onPressed: () {
          AppState.instance.setLanguage(lang);
          Navigator.pushNamed(context, '/selection');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Text(
                iconText,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
