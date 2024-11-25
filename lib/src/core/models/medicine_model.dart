class MedicineModel {
  final List<dynamic>? notificationIDs;
  final String? medicineName;
  final int? dosage;
  final String? medicineType;
  final int? interval;
  final String? startTime;

  MedicineModel({
    this.notificationIDs,
    this.medicineName,
    this.dosage,
    this.medicineType,
    this.interval,
    this.startTime,
  });

  List<dynamic>? get getIDs => notificationIDs;
  String? get getName => medicineName;
  int? get getDosage => dosage;
  String? get getType => medicineType;
  int? get getInterval => interval;
  String? get getStartTime => startTime;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'ids': notificationIDs,
      'name': medicineName,
      'dosage': dosage,
      'type': medicineType,
      'interval': interval,
      'start': startTime,
    };
  }

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      notificationIDs: json['ids'],
      medicineName: json['name'],
      dosage: json['dosage'],
      medicineType: json['type'],
      interval: json['interval'],
      startTime: json['start'],
    );
  }
}
