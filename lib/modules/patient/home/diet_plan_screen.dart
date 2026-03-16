import 'package:flutter/material.dart';
import 'diet_data.dart';
import '../../../app_state.dart';

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({super.key});

  @override
  State<DietPlanScreen> createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF9F9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            children: [
              Text(state.translate('Month-by-Month Diet', 'मासिक भोजन योजना', 'मासिक आहार योजना'), 
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(state.translate('Detailed Plan', 'विस्तृत योजना', 'सविस्तर योजना'), 
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            labelColor: const Color(0xFFFF8B94),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xFFFF8B94),
            indicatorWeight: 3,
            tabs: List.generate(9, (i) => Tab(text: state.translate('Month ${i+1}', 'महीना ${i+1}', 'महिना ${i+1}'))),
          ),
        ),
        body: TabBarView(
          children: maternalDietPlans.map((plan) => _buildMonthView(plan, state)).toList(),
        ),
      ),
    );
  }

  Widget _buildMonthView(MonthDietPlan plan, AppState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Trimester & Focus Header ──
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD3B6), Color(0xFFFFAAA5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.stars, color: Colors.white, size: 28),
                    const SizedBox(width: 10),
                    Text(
                      state.translate('Trimester ${plan.trimesterIndex}', 'तिमाही ${plan.trimesterIndex}', 'तिमाही ${plan.trimesterIndex}'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  state.translate('Primary Focus:', 'मुख्य ध्यान:', 'मुख्य लक्ष:'),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                ... (state.language == AppLanguage.hindi
                    ? plan.primaryNutritionalFocusHi
                    : state.language == AppLanguage.marathi
                        ? plan.primaryNutritionalFocusMr
                        : plan.primaryNutritionalFocus)
                    .map((focus) => Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle_outline, color: Colors.white70, size: 16),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  focus,
                                  style: const TextStyle(color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        )),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            state.translate('Daily Meal Schedule', 'दैनिक भोजन कार्यक्रम', 'दैनंदिन जेवणाचे वेळापत्रक'),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A)),
          ),
          const SizedBox(height: 16),
          _buildMealRow(
              state.translate('Early Morning', 'तड़के सुबह', 'पहाटे'),
              _getMeal(plan, 'Early Morning', state),
              Icons.wb_sunny_outlined,
              const Color(0xFFFFF4E5)),
          _buildMealRow(
              state.translate('Breakfast', 'नाश्ता', 'न्याहारी'),
              _getMeal(plan, 'Breakfast', state),
              Icons.breakfast_dining_outlined,
              const Color(0xFFE5F6DF)),
          _buildMealRow(
              state.translate('Mid-Morning', 'दोपहर से पहले', 'दुपारआधी'),
              _getMeal(plan, 'Mid-Morning', state),
              Icons.apple_outlined,
              const Color(0xFFE0F2F1)),
          _buildMealRow(
              state.translate('Lunch', 'दोपहर का भोजन', 'दुपारचे जेवण'),
              _getMeal(plan, 'Lunch', state),
              Icons.lunch_dining_outlined,
              const Color(0xFFE3F2FD)),
          _buildMealRow(
              state.translate('Evening Snack', 'शाम का नाश्ता', 'संध्याकाळचा नाश्ता'),
              _getMeal(plan, 'Evening Snack', state),
              Icons.wb_twilight,
              const Color(0xFFF3E5F5)),
          _buildMealRow(
              state.translate('Dinner', 'रात का खाना', 'रात्रीचे जेवण'),
              _getMeal(plan, 'Dinner', state),
              Icons.dinner_dining_outlined,
              const Color(0xFFE8EAF6)),
          _buildMealRow(
              state.translate('Bedtime', 'सोते समय', 'झोपताना'),
              _getMeal(plan, 'Bedtime', state),
              Icons.nightlight_outlined,
              const Color(0xFFFCE4EC)),
        ],
      ),
    );
  }

  String _getMeal(MonthDietPlan plan, String key, AppState state) {
    if (state.language == AppLanguage.hindi) return plan.mealScheduleHi[key] ?? '';
    if (state.language == AppLanguage.marathi) return plan.mealScheduleMr[key] ?? '';
    return plan.mealSchedule[key] ?? '';
  }

  Widget _buildMealRow(String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.black87, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A4A4A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.4,
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
