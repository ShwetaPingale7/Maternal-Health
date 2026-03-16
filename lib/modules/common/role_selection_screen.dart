import 'package:flutter/material.dart';
import '../../app_state.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

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
              const Color(0xFFFFD3B6).withOpacity(0.3),
              const Color(0xFFFFF9F9),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.health_and_safety,
                  size: 100,
                  color: Color(0xFFFF8B94),
                ),
                const SizedBox(height: 24),
                Text(
                  state.translate('Maternal Care', 'मातृत्व देखभाल', 'मातृत्व काळजी'),
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A)),
                ),
                const SizedBox(height: 60),
                _buildRoleCard(
                  context,
                  state.translate('I am a Patient', 'मैं मरीज हूँ', 'मी रुग्ण आहे'),
                  state.translate('Pregnant Mother', 'गर्भवती माता', 'गर्भवती माता'),
                  Icons.pregnant_woman,
                  const Color(0xFFFF8B94),
                  () => Navigator.pushNamed(context, '/login'),
                ),
                const SizedBox(height: 24),
                _buildRoleCard(
                  context,
                  state.translate('I am an ASHA Worker', 'मैं आशा कार्यकर्ता हूँ', 'मी आशा स्वयंसेविका आहे'),
                  state.translate('Health Assistant', 'स्वास्थ्य सहायक', 'आरोग्य सहाय्यक'),
                  Icons.support_agent,
                  const Color(0xFFAEC6CF),
                  () => Navigator.pushNamed(context, '/asha_login'),
                ),
                const SizedBox(height: 40),
                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.translate),
                  label: Text(state.translate('Change Language', 'भाषा बदलें', 'भाषा बदला')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: color.withOpacity(0.3), width: 2),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, size: 35, color: color),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
