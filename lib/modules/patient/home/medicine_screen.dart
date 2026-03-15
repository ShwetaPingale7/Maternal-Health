import 'package:flutter/material.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Medicines', style: TextStyle(fontSize: 18)),
            Text('दवाइयॉं', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildMedicineCard(
            'Calcium',
            'कैल्शियम',
            'After Lunch / दोपहर के भोजन के बाद',
            '1 Pill / 1 गोली',
            Colors.pink[50]!,
          ),
          const SizedBox(height: 16),
          _buildMedicineCard(
            'Iron',
            'आयरन',
            'At Night / रात को',
            '1 Pill / 1 गोली',
            Colors.purple[50]!,
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineCard(String name, String nameH, String time, String dose, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          const Icon(Icons.medication, size: 40, color: Colors.black54),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$name / $nameH', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(time, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(dose, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
