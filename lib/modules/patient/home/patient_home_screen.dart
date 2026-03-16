import 'package:flutter/material.dart';
import 'diet_plan_screen.dart';
import 'vaccine_screen.dart';
import 'medicine_screen.dart';
import 'patient_history_screen.dart';
import 'chatbot_widget.dart';
import '../../../app_state.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F9),
      appBar: AppBar(
        title: Text(state.translate('Maternal Care', 'मातृत्व देखभाल', 'मातृत्व काळजी')),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PatientHistoryScreen()),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Color(0xFFFF8B94),
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.translate('Hello, Mother! 👋', 'नमस्ते माताजी! 👋', 'नमस्कार माताजी! 👋'),
              style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A)),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(24),
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
              ),
              child: Row(
                children: [
                   const Icon(Icons.info_outline, color: Color(0xFFFF8B94), size: 40),
                   const SizedBox(width: 16),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           state.translate('Next Checkup', 'अगली जांच', 'पुढील तपासणी'),
                           style: const TextStyle(fontSize: 16, color: Colors.grey),
                         ),
                         Text(
                           state.translate('In 3 days', '3 दिनों में', '3 दिवसात'),
                           style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                         ),
                       ],
                     ),
                   ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildActionCard(
              context,
              state.translate('Diet Plans', 'भोजन योजना', 'आहार योजना'),
              state.translate('What to eat', 'क्या खाएं', 'काय खावे'),
              Icons.restaurant_menu,
              const Color(0xFFFFD3B6),
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DietPlanScreen())),
            ),
            const SizedBox(height: 20),
            _buildActionCard(
              context,
              state.translate('Vaccines', 'टीकाकरण', 'लसीकरण'),
              state.translate('Your health shots', 'आपके टीके', 'तुमची लस'),
              Icons.vaccines_outlined,
              const Color(0xFFAEC6CF),
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccineScreen())),
            ),
            const SizedBox(height: 20),
            _buildActionCard(
              context,
              state.translate('Medicines', 'दवाइयॉं', 'औषधे'),
              state.translate('Daily pills', 'दैनिक दवाएं', 'रोजची औषधे'),
              Icons.medication_outlined,
              const Color(0xFFB4E6B4),
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MedicineScreen())),
            ),
            const SizedBox(height: 32),

            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: ChatbotWidget(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home, size: 30),
            label: state.translate('Home', 'मुख्य', 'मुख्य पान'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_outline, size: 30),
            label: state.translate('ASHA', 'आशा', 'आशा'),
          ),
        ],
        selectedItemColor: const Color(0xFFFF8B94),
      ),
    );
  }

  Widget _buildActionCard(
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
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(50),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, size: 40, color: Colors.black87),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 24, color: Colors.black38),
          ],
        ),
      ),
    );
  }
}
