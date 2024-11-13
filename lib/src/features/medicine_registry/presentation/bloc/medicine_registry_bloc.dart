import 'package:pill_reminder_app/src/src.dart';
import 'package:rxdart/rxdart.dart';

class MedicineRegistryBloc {
  BehaviorSubject<MedicineTypeEnum>? _selectedMedicineType$;
  ValueStream<MedicineTypeEnum>? get selectedMedicineType =>
      _selectedMedicineType$!.stream;

  BehaviorSubject<int>? _selectedIntervals$;
  BehaviorSubject<int>? get selectIntervals => _selectedIntervals$;

  BehaviorSubject<String>? _selectedTimeOfDay$;
  BehaviorSubject<String>? get selectedTimeOfDay => _selectedTimeOfDay$;

  //! Error State
  BehaviorSubject<EntryErros>? _errorSatate$;
  BehaviorSubject<EntryErros>? get errorState => _errorSatate$;

  MedicineRegistryBloc() {
    _selectedMedicineType$ =
        BehaviorSubject<MedicineTypeEnum>.seeded(MedicineTypeEnum.none);

    _selectedTimeOfDay$ = BehaviorSubject<String>.seeded('none');
    _selectedIntervals$ = BehaviorSubject<int>.seeded(0);
    _errorSatate$ = BehaviorSubject<EntryErros>();
  }

  void dispose() {
    _selectedIntervals$!.close();
    _selectedTimeOfDay$!.close();
    _selectedMedicineType$!.close();
  }

  void submitError(EntryErros error) {
    _errorSatate$!.add(error);
  }

  void updateInterval(int interval) {
    _selectedIntervals$!.add(interval);
  }

  void updateTime(String time) {
    _selectedTimeOfDay$!.add(time);
  }

  void updateSelectedMedicine(MedicineTypeEnum type) {
    MedicineTypeEnum tempType = _selectedMedicineType$!.value;
    if (type == tempType) {
      _selectedMedicineType$!.add(MedicineTypeEnum.none);
    } else {
      _selectedMedicineType$!.add(type);
    }
  }
}
