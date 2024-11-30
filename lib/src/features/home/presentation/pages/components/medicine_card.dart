// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:sizer/sizer.dart';

class MedicineCard extends StatelessWidget {
  final MedicineModel medicineModel;
  const MedicineCard({
    super.key,
    required this.medicineModel,
  });

  Hero makeIcon() {
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
        size: 32.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder<void>(
            pageBuilder: (context, animation, secondaryAnimation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Opacity(
                    opacity: animation.value,
                    child: MedicineDetailsPage(
                      medicineModel: medicineModel,
                    ),
                  );
                },
              );
            },
            transitionDuration: const Duration(milliseconds: 250),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 4.w,
          right: 2.w,
          top: 1.h,
          bottom: 1.h,
        ),
        margin: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            makeIcon(),
            const Spacer(),
            Text(
              textAlign: TextAlign.start,
              overflow: TextOverflow.fade,
              medicineModel.medicineName!,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              textAlign: TextAlign.start,
              overflow: TextOverflow.fade,
              medicineModel.interval == 1
                  ? 'A cada ${medicineModel.interval} hora'
                  : 'A cada ${medicineModel.interval} horas',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: kTextLightColor),
            ),
          ],
        ),
      ),
    );
  }
}
