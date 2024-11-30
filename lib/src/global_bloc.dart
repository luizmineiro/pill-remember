// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import 'package:pill_reminder_app/src/src.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalBloc {
  BehaviorSubject<List<MedicineModel>>? _medicineList$;
  BehaviorSubject<List<MedicineModel>>? get getMedicineList => _medicineList$;

  GlobalBloc() {
    _medicineList$ = BehaviorSubject<List<MedicineModel>>.seeded([]);
    makeMedicineList();
  }

  Future removeMedicine(MedicineModel tobeRemove) async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    List<String> medicineJsonList = [];

    var blocList = _medicineList$!.value;
    blocList.removeWhere(
      (medicine) => medicine.medicineName == tobeRemove.medicineName,
    );

    if (blocList.isNotEmpty) {
      for (var blocMedicine in blocList) {
        String medicineJson = jsonEncode(blocMedicine.toJson());
        medicineJsonList.add(medicineJson);
      }
    }

    sharedUser.setStringList('medicines', medicineJsonList);

    _medicineList$!.add(blocList);
  }

  Future updateMedicineList(MedicineModel medicine) async {
    var blocList = _medicineList$!.value;
    blocList.add(medicine);
    _medicineList$!.add(blocList);

    Map<String, dynamic> tempMap = medicine.toJson();
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    String newMedicineJson = jsonEncode(tempMap);
    List<String> medicineJsonList = [];
    if (sharedUser.getStringList('medicines') == null) {
      medicineJsonList.add(newMedicineJson);
    } else {
      medicineJsonList = sharedUser.getStringList('medicines')!;
      medicineJsonList.add(newMedicineJson);
    }

    sharedUser.setStringList('medicines', medicineJsonList);
  }

  Future makeMedicineList() async {
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    List<String>? jsonList = sharedUser.getStringList('medicines');
    List<MedicineModel> prefList = <MedicineModel>[];

    if (jsonList == null) {
      return;
    } else {
      for (String jsonMedicine in jsonList) {
        dynamic userMap = jsonDecode(jsonMedicine);
        MedicineModel tempMedicine = MedicineModel.fromJson(userMap);
        prefList.add(tempMedicine);
      }
      _medicineList$!.add(prefList);
    }
  }

  void dispose() {
    _medicineList$!.close();
  }
}
