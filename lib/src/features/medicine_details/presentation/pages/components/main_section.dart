// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:sizer/sizer.dart';

class MainSection extends StatelessWidget {
  final MedicineModel medicineModel;
  const MainSection({
    super.key,
    required this.medicineModel,
  });

  Hero makeIcon(double size) {
    if (medicineModel.medicineType == 'bootle') {
      return Hero(
        tag: medicineModel.medicineName! + medicineModel.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/bottle.svg',
          height: 7.h,
          color: kOtherColor,
        ),
      );
    }
    if (medicineModel.medicineType == 'pill') {
      return Hero(
        tag: medicineModel.medicineName! + medicineModel.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/pill.svg',
          height: 7.h,
          color: kOtherColor,
        ),
      );
    }
    if (medicineModel.medicineType == 'syringe') {
      return Hero(
        tag: medicineModel.medicineName! + medicineModel.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/syringe.svg',
          height: 7.h,
          color: kOtherColor,
        ),
      );
    }
    if (medicineModel.medicineType == 'tablet') {
      return Hero(
        tag: medicineModel.medicineName! + medicineModel.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/tablet.svg',
          height: 7.h,
          color: kOtherColor,
        ),
      );
    }
    return Hero(
      tag: medicineModel.medicineName! + medicineModel.medicineType!,
      child: Icon(
        Icons.error,
        color: kOtherColor,
        size: size
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        makeIcon(7.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainInfoTab(
              fieldTitle: 'Nome do medicamento',
              fieldInfo: medicineModel.medicineName!,
            ),
            MainInfoTab(
              fieldTitle: 'Dosagem',
              fieldInfo: medicineModel.dosage == 0
                  ? 'Não especificada'
                  : '${medicineModel.dosage} mg',
            ),
          ],
        )
      ],
    );
  }
}
