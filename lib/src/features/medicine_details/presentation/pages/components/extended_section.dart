import 'package:flutter/material.dart';
import 'package:pill_reminder_app/src/src.dart';

class ExtendedSection extends StatelessWidget {
  final MedicineModel medicineModel;
  const ExtendedSection({
    super.key,
    required this.medicineModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ExtendedInfoTab(
          fieldTitle: 'Tipo do medicamento',
          fieldInfo: medicineModel.medicineType! == 'none'
              ? 'Não especificado'
              : medicineModel.medicineType!,
        ),
        ExtendedInfoTab(
          fieldTitle: 'Intervalo entre as doses',
          fieldInfo:
              'A cada ${medicineModel.interval} horas | ${medicineModel.interval == 24 ? "Uma vez ao dia" : "${(24 / medicineModel.interval!).floor()}"} vezes ao dia',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Horario de Inicio',
          fieldInfo: '${medicineModel.startTime![0]}${medicineModel.startTime![1]}:${medicineModel.startTime![2]}${medicineModel.startTime![3]}',
        ),
      ],
    );
  }
}
