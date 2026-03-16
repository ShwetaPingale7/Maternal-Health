import 'package:flutter/material.dart';
import '../../../app_state.dart';

class PatientHistoryScreen extends StatelessWidget {
  const PatientHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(state.translate('Medical History', 'चिकित्सा इतिहास', 'वैद्यकीय इतिहास')),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildPersonalSummary(state),
          const SizedBox(height: 24),
          Text(
            state.translate('Doctor Visits', 'डॉक्टर की मुलाक़ातें', 'डॉक्टरांच्या भेटी'),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildHistoryItem(
            state.translate('10 March 2026', '10 मार्च 2026', '१० मार्च २०२६'),
            'Dr. Sharma',
            state.translate('Monthly Checkup', 'मासिक जाँच', 'मासिक तपासणी'),
            state.translate('BP: 120/80 - Normal', 'बीपी: 120/80 - सामान्य', 'बीपी: १२०/८० - सामान्य'),
            Icons.event_available,
            Colors.green[50]!,
          ),
          const SizedBox(height: 16),
          _buildHistoryItem(
            state.translate('12 February 2026', '12 फ़रवरी 2026', '१२ फेब्रुवारी २०२६'),
            'Dr. Varma',
            state.translate('First Visit', 'पहली मुलाक़ात', 'पहिली भेट'),
            state.translate('Initial Scan Done', 'स्कैन हो गया', 'पहिली तपासणी पूर्ण'),
            Icons.history,
            Colors.blue[50]!,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalSummary(AppState state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFF8B94).withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFF8B94).withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFFFF8B94),
            child: Icon(Icons.person, color: Colors.white, size: 35),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Pooja Singh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                state.translate('6 Months Pregnant', '6 महीने की गर्भवती', '६ महिन्यांची गरोदर'),
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String date, String doctor, String title, String notes, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black54),
              const SizedBox(width: 12),
              Text(date, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Spacer(),
              Text(doctor, style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
            ],
          ),
          const Divider(height: 24),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(notes, style: const TextStyle(fontSize: 16, color: Colors.black87)),
        ],
      ),
    );
  }
}
