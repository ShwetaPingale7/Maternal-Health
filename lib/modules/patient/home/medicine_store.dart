/// medicine_store.dart
/// Singleton in-memory store that tracks which medicines the patient has marked
/// as taken on each calendar date.
library medicine_store;

import 'package:flutter/foundation.dart';

/// The fixed list of assigned medicines.
class AssignedMedicine {
  final String id;
  final String name;
  final String nameHi;
  final String nameMr;
  final String timing;
  final String dose;

  const AssignedMedicine({
    required this.id,
    required this.name,
    required this.nameHi,
    required this.nameMr,
    required this.timing,
    required this.dose,
  });
}

const List<AssignedMedicine> _assignedList = [
  AssignedMedicine(
    id: 'calcium',
    name: 'Calcium',
    nameHi: 'कैल्शियम',
    nameMr: 'कॅल्शियम',
    timing: 'After Lunch / दोपहर के बाद / जेवणानंतर',
    dose: '1 Pill / 1 गोली',
  ),
  AssignedMedicine(
    id: 'iron',
    name: 'Iron',
    nameHi: 'आयरन',
    nameMr: 'लोह',
    timing: 'At Night / रात को / रात्री',
    dose: '1 Pill / 1 गोली',
  ),
  AssignedMedicine(
    id: 'folicacid',
    name: 'Folic Acid',
    nameHi: 'फोलिक एसिड',
    nameMr: 'फोलिक ऍसिड',
    timing: 'Morning / सुबह / सकाळी',
    dose: '1 Pill / 1 गोली',
  ),
];

// ── Singleton store ──────────────────────────────────────────────────────────

class MedicineStore extends ChangeNotifier {
  MedicineStore._();
  static final MedicineStore instance = MedicineStore._();

  // Key: 'YYYY-MM-DD', Value: Set of medicine IDs taken that day
  final Map<String, Set<String>> _log = {};

  List<AssignedMedicine> get assignedMedicines => _assignedList;

  String _key(DateTime date) =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

  /// Mark or unmark a medicine for today.
  void toggle(String medicineId, DateTime date) {
    final key = _key(date);
    _log.putIfAbsent(key, () => {});
    if (_log[key]!.contains(medicineId)) {
      _log[key]!.remove(medicineId);
    } else {
      _log[key]!.add(medicineId);
    }
    notifyListeners();
  }

  /// Whether a given medicine is marked taken for a date.
  bool isTaken(String medicineId, DateTime date) {
    final key = _key(date);
    return _log[key]?.contains(medicineId) ?? false;
  }

  /// How many medicines were taken on a given date (out of assigned total).
  int takenCount(DateTime date) => _log[_key(date)]?.length ?? 0;

  /// Whether ALL medicines were marked for a given date.
  bool isAllTaken(DateTime date) =>
      takenCount(date) == _assignedList.length;

  double getDailyProgress(DateTime date) {
    if (_assignedList.isEmpty) return 0;
    return takenCount(date) / _assignedList.length;
  }

  /// Returns the number of consecutive days BEFORE [today] (not including today)
  /// on which the patient failed to take ALL medicines.
  int consecutiveMissedDaysBefore(DateTime today) {
    int count = 0;
    for (int i = 1; i <= 7; i++) {
      final day = today.subtract(Duration(days: i));
      if (!isAllTaken(day)) {
        count++;
      } else {
        break;
      }
    }
    return count;
  }

  /// Alert level based on consecutive missed days:
  /// 0 = OK, 1 = reminder to patient (2 days missed), 2 = alert ASHA (3+ days missed)
  MissedAlert alertLevel(DateTime today) {
    final missed = consecutiveMissedDaysBefore(today);
    if (missed >= 3) return MissedAlert.ashaAlert;
    if (missed >= 2) return MissedAlert.patientReminder;
    return MissedAlert.none;
  }

  /// Whether the ASHA worker should see a medicine-missed alert.
  bool get ashaAlertActive =>
      alertLevel(DateTime.now()) == MissedAlert.ashaAlert;
}

enum MissedAlert { none, patientReminder, ashaAlert }
