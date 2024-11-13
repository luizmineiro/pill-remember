// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MedicineType extends StatelessWidget {
  final MedicineTypeEnum medicineTypeEnum;
  final String name;
  final String iconValue;
  final bool isSelected;
  const MedicineType({
    super.key,
    required this.medicineTypeEnum,
    required this.name,
    required this.iconValue,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final MedicineRegistryBloc medicineRegistryBloc =
        Provider.of<MedicineRegistryBloc>(context);
    return GestureDetector(
      onTap: () {
        medicineRegistryBloc.updateSelectedMedicine(medicineTypeEnum);
      },
      child: Column(
        children: [
          Container(
            height: 10.h,
            width: 20.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.h),
              color: isSelected ? kOtherColor : Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 1.h,
                  bottom: 1.h,
                ),
                child: SvgPicture.asset(
                  iconValue,
                  height: 7.h,
                  color: isSelected ? Colors.white : kOtherColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Container(
              width: 22.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: isSelected ? kOtherColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: isSelected ? Colors.white : kOtherColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
