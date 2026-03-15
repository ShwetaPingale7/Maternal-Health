import 'package:flutter/material.dart';
import 'diet_plan_screen.dart';
import 'vaccine_screen.dart';
import 'medicine_screen.dart';
import 'patient_history_screen.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F9),
      appBar: AppBar(
        title: const Text('Maternal Care / मातृत्व देखभाल'),
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
            const Text(
              'Hello, Mother! / नमस्ते माताजी! 👋',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A)),
            ),
            const SizedBox(height: 8),
            const Text(
              'Here is your health for today.\nआज के लिए आपका स्वास्थ्य विवरण।',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildActionCard(
              context,
              'Diet Plans',
              'भोजन योजना',
              'What to eat / क्या खाएं',
              Icons.restaurant_menu,
              const Color(0xFFFFD3B6),
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DietPlanScreen())),
            ),
            const SizedBox(height: 20),
            _buildActionCard(
              context,
              'Vaccines',
              'टीकाकरण',
              'Your health shots / आपके टीके',
              Icons.vaccines_outlined,
              const Color(0xFFAEC6CF),
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccineScreen())),
            ),
            const SizedBox(height: 20),
            _buildActionCard(
              context,
              'Medicines',
              'दवाइयॉं',
              'Daily pills / दैनिक दवाएं',
              Icons.medication_outlined,
              const Color(0xFFB4E6B4),
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MedicineScreen())),
            ),
            const SizedBox(height: 32),
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
              child: const Row(
                children: [
                   Icon(Icons.info_outline, color: Color(0xFFFF8B94), size: 40),
                   SizedBox(width: 16),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Next Checkup: In 3 days',
                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                         ),
                         Text(
                           'अगली जांच: 3 दिनों में',
                           style: TextStyle(fontSize: 16, color: Colors.grey),
                         ),
                       ],
                     ),
                   ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home / मुख्य',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline, size: 30),
            label: 'ASHA / आशा',
          ),
        ],
        selectedItemColor: const Color(0xFFFF8B94),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, 
    String title, 
    String titleH,
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
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  Text(
                    titleH,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black54),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14, color: Colors.black45),
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
