import 'package:flutter/material.dart';
import '../../../app_state.dart';

class VaccineScreen extends StatelessWidget {
  const VaccineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(state.translate('Vaccines', 'टीकाकरण', 'लसीकरण')),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildVaccineItem(
            'TT-1', 
            state.translate('First Dose', 'पहली खुराक', 'पहिली मात्रा'), 
            state.translate('Completed', 'पूर्ण', 'पूर्ण झाले'), 
            true
          ),
          const SizedBox(height: 16),
          _buildVaccineItem(
            'TT-2', 
            state.translate('Second Dose', 'दूसरी खुराक', 'दुसरी मात्रा'), 
            state.translate('Due in 5 days', '5 दिनों में', '५ दिवसात'), 
            false
          ),
          const SizedBox(height: 16),
          _buildVaccineItem(
            'IFA Tablets', 
            state.translate('Iron folic acid', 'आयरन फोलिक एसिड', 'लोह फोलिक ऍसिड'), 
            state.translate('Daily', 'प्रतिदिन', 'दररोज'), 
            false
          ),
        ],
      ),
    );
  }

  Widget _buildVaccineItem(String name, String desc, String status, bool isDone) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDone ? Colors.green[50] : Colors.orange[50],
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isDone ? Colors.green[100]! : Colors.orange[100]!),
      ),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.pending_actions,
            size: 40,
            color: isDone ? Colors.green : Colors.orange,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text(desc, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDone ? Colors.green[700] : Colors.orange[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
