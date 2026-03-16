import 'package:flutter/material.dart';
import 'modules/common/role_selection_screen.dart';
import 'modules/common/language_selection_screen.dart';
import 'modules/patient/auth/login_screen.dart';
import 'modules/patient/auth/otp_screen.dart';
import 'modules/patient/home/patient_home_screen.dart';
import 'modules/asha/auth/asha_login_screen.dart';
import 'modules/asha/home/asha_home_screen.dart';
import 'app_state.dart';

void main() {
  runApp(const MaternalHealthApp());
}

class MaternalHealthApp extends StatelessWidget {
  const MaternalHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState.instance,
      builder: (context, _) {
        return MaterialApp(
          title: 'Maternal Health',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFFF8B94),
              primary: const Color(0xFFFF8B94),
              secondary: const Color(0xFFFFAAA5),
              tertiary: const Color(0xFFFFD3B6),
              surface: const Color(0xFFFFF9F9),
            ),
            textTheme: const TextTheme(
              headlineMedium: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A4A4A),
              ),
              bodyLarge: TextStyle(
                color: Color(0xFF6D6D6D),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF8B94),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFFFF8B94), width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            ),
          ),
          initialRoute: '/language',
          routes: {
            '/language': (context) => const LanguageSelectionScreen(),
            '/selection': (context) => const RoleSelectionScreen(),
            '/login': (context) => const LoginScreen(),
            '/otp': (context) => const OtpScreen(),
            '/patient_home': (context) => const PatientHomeScreen(),
            '/asha_login': (context) => const AshaLoginScreen(),
            '/asha_home': (context) => const AshaHomeScreen(),
          },
        );
      },
    );
  }
}
