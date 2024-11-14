// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:sizer/sizer.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/icons/pill.svg',
          height: 7.h,
          color: kOtherColor,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainInfoTab(
              fieldTitle: 'Nome do medicamento',
              fieldInfo: 'Catapol',
            ),
            MainInfoTab(
              fieldTitle: 'Dosagem',
              fieldInfo: '500 mg',
            ),
          ],
        )
      ],
    );
  }
}
