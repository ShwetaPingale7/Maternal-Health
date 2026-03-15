import 'package:flutter/material.dart';

class AshaHomeScreen extends StatelessWidget {
  const AshaHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ASHA Management Console'),
        backgroundColor: const Color(0xFFAEC6CF),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSummaryCard(),
          const SizedBox(height: 24),
          const Text('Your Patients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildPatientTile('Sita Devi', '8th Month', 'High BP Alert', Colors.red[50]!),
          _buildPatientTile('Pooja Singh', '4th Month', 'Stable', Colors.green[50]!),
          _buildPatientTile('Meena Rao', '6th Month', 'Due for Vaccine', Colors.orange[50]!),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SummaryItem('12', 'Active Patients'),
          _SummaryItem('3', 'Alerts'),
          _SummaryItem('5', 'Visits Today'),
        ],
      ),
    );
  }

  Widget _buildPatientTile(String name, String month, String status, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(child: Text(name[0])),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$month - $status'),
        trailing: const Icon(Icons.chevron_right),
        tileColor: color,
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String val;
  final String label;
  const _SummaryItem(this.val, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(val, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
