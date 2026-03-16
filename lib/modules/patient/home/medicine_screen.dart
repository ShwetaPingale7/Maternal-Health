import 'package:flutter/material.dart';
import 'medicine_store.dart';
import '../../../app_state.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  final MedicineStore _store = MedicineStore.instance;
  final DateTime _today = DateTime.now();

  @override
  void initState() {
    super.initState();
    _store.addListener(_onStoreChange);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkAndShowReminder());
  }

  @override
  void dispose() {
    _store.removeListener(_onStoreChange);
    super.dispose();
  }

  void _onStoreChange() => setState(() {});

  void _checkAndShowReminder() {
    final level = _store.alertLevel(_today);
    if (level == MissedAlert.patientReminder) {
      _showReminderDialog();
    } else if (level == MissedAlert.ashaAlert) {
      _showAshaAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
    final level = _store.alertLevel(_today);
    final historyDates = List.generate(7, (i) => _today.subtract(Duration(days: 6 - i)));
    final todayProgress = _store.getDailyProgress(_today);
    final allDone = _store.isAllTaken(_today);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F9),
      appBar: AppBar(
        title: Text(state.translate('Daily Medicines', 'दैनिक दवाएं', 'रोजची औषधे')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (level != MissedAlert.none)
              _buildReminderBanner(level == MissedAlert.ashaAlert, state),
            
            _buildProgressCard(todayProgress, allDone, state),
            const SizedBox(height: 32),
            
            Text(
              state.translate('Today\'s List', 'आज की सूची', 'आजची यादी'),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ..._store.assignedMedicines.map((med) => _buildMedicineTile(med, state)),
            
            const SizedBox(height: 32),
            Text(
              state.translate('Weekly History', 'साप्ताहिक इतिहास', 'साप्ताहिक इतिहास'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildHistoryStrip(historyDates, state),
          ],
        ),
      ),
    );
  }

  Widget _buildReminderBanner(bool isCritical, AppState state) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCritical ? const Color(0xFFFFEEEE) : const Color(0xFFFFF7E6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isCritical ? Colors.red.shade200 : Colors.orange.shade200),
      ),
      child: Row(
        children: [
          Icon(isCritical ? Icons.emergency : Icons.warning_amber, color: isCritical ? Colors.red : Colors.orange),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              isCritical 
                ? state.translate('Urgently take your medicines!', 'तुरंत अपनी दवाएं लें!', 'लगेच तुमची औषधे घ्या!')
                : state.translate('Don\'t forget your pills today.', 'आज अपनी दवाएं लेना न भूलें।', 'आज तुमची औषधे घ्यायला विसरू नका।'),
              style: TextStyle(fontWeight: FontWeight.bold, color: isCritical ? Colors.red.shade900 : Colors.orange.shade900),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(double progress, bool complete, AppState state) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: complete 
            ? [const Color(0xFFB4E6B4), const Color(0xFF90EE90)]
            : [const Color(0xFFFFD3B6), const Color(0xFFFFAAA5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                complete ? state.translate('Excellent!', 'उत्कृष्ट!', 'उत्कृष्ट!') : state.translate('Today\'s Goal', 'आज का लक्ष्य', 'आजचे ध्येय'),
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(complete ? Icons.check_circle : Icons.trending_up, color: Colors.white, size: 30),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 12,
              backgroundColor: Colors.white30,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            complete 
              ? state.translate('All medicines taken!', 'सभी दवाएं ली गईं!', 'सर्व औषधे घेतली!')
              : '${(progress * 100).toInt()}% ${state.translate('Complete', 'पूर्ण', 'पूर्ण')}',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineTile(AssignedMedicine med, AppState state) {
    final taken = _store.isTaken(med.id, _today);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => _store.toggle(med.id, _today),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: taken ? const Color(0xFFE5F6DF) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: taken ? Colors.green.shade300 : Colors.black12, width: 1.5),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: taken ? Colors.green : const Color(0xFFF5F5F5),
                child: Icon(taken ? Icons.check : Icons.medication, color: taken ? Colors.white : Colors.grey),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.translate(med.name, med.nameHi, med.nameMr),
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                        color: taken ? Colors.green.shade900 : Colors.black87,
                        decoration: taken ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      '${med.dose} • ${med.timing}',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              Checkbox(
                value: taken,
                onChanged: (_) => _store.toggle(med.id, _today),
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryStrip(List<DateTime> dates, AppState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: dates.map((date) {
        final allTaken = _store.isAllTaken(date);
        final isToday = DateUtils.isSameDay(date, _today);
        return Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: allTaken ? Colors.green : (isToday ? Colors.white : const Color(0xFFFFE4E4)),
                shape: BoxShape.circle,
                border: Border.all(color: isToday ? const Color(0xFFFF8B94) : Colors.transparent, width: 2),
              ),
              child: Icon(
                allTaken ? Icons.check : (isToday ? Icons.timer : Icons.close),
                size: 18,
                color: allTaken ? Colors.white : (isToday ? const Color(0xFFFF8B94) : Colors.red),
              ),
            ),
            const SizedBox(height: 6),
            Text('${date.day}', style: const TextStyle(fontSize: 12)),
          ],
        );
      }).toList(),
    );
  }

  void _showReminderDialog() {
    final state = AppState.instance;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(state.translate('Reminder!', 'याद दिलाएं!', 'आठवण!')),
        content: Text(state.translate('Please take your medicines.', 'कृपया अपनी दवाएं लें।', 'कृपया तुमची औषधे घ्या।')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(state.translate('OK', 'ठीक है', 'ठीक आहे'))),
        ],
      ),
    );
  }

  void _showAshaAlertDialog() {
    final state = AppState.instance;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(state.translate('Emergency!', 'आपातकालीन!', 'आणीबाणी!'), style: const TextStyle(color: Colors.red)),
        content: Text(state.translate('ASHA worker alerted.', 'आशा को सूचित किया।', 'आशाला कळवले।')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(state.translate('OK', 'ठीक है', 'ठीक आहे'))),
        ],
      ),
    );
  }
}
