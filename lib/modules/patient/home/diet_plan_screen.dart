import 'package:flutter/material.dart';

class DietPlanScreen extends StatelessWidget {
  const DietPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Diet Plan', style: TextStyle(fontSize: 18)),
            Text('भोजन योजना', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildDietItem(
            context,
            'Morning / सुबह',
            'Glass of Milk, Fruits\nएक गिलास दूध, फल',
            Icons.wb_sunny_outlined,
            Colors.orange[50]!,
          ),
          const SizedBox(height: 16),
          _buildDietItem(
            context,
            'Lunch / दोपहर का भोजन',
            'Dal, Rice, Green Veggies\nदाल, चावल, हरी सब्जियां',
            Icons.lunch_dining_outlined,
            Colors.green[50]!,
          ),
          const SizedBox(height: 16),
          _buildDietItem(
            context,
            'Evening / शाम',
            'Healthy Nuts, Soup\nसूखे मेवे, सूप',
            Icons.wb_twilight,
            Colors.blue[50]!,
          ),
          const SizedBox(height: 16),
          _buildDietItem(
            context,
            'Dinner / रात का खाना',
            'Roti, Sabzi, Curd\nरोटी, सब्जी, दही',
            Icons.dark_mode_outlined,
            Colors.purple[50]!,
          ),
        ],
      ),
    );
  }

  Widget _buildDietItem(BuildContext context, String time, String food, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 30, color: Colors.black87),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 4),
                Text(food, style: const TextStyle(fontSize: 16, color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
