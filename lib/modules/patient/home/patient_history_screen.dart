import 'package:flutter/material.dart';

class PatientHistoryScreen extends StatelessWidget {
  const PatientHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Medical History', style: TextStyle(fontSize: 18)),
            Text('चिकित्सा इतिहास', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildPersonalSummary(),
          const SizedBox(height: 24),
          const Text(
            'Doctor Visits / डॉक्टर की मुलाक़ातें',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildHistoryItem(
            '10 March 2026',
            'Dr. Sharma',
            'Monthly Checkup / मासिक जाँच',
            'BP: 120/80 - Normal',
            Icons.event_available,
            Colors.green[50]!,
          ),
          const SizedBox(height: 16),
          _buildHistoryItem(
            '12 February 2026',
            'Dr. Varma',
            'First Visit / पहली मुलाक़ात',
            'Initial Scan Done / स्कैन हो गया',
            Icons.history,
            Colors.blue[50]!,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFF8B94).withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFF8B94).withOpacity(0.3)),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder for profile pic
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pooja Singh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('6 Months Pregnant / 6 महीने की गर्भवती', style: TextStyle(color: Colors.black54)),
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
