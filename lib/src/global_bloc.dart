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
