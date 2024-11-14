// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:sizer/sizer.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MedicineDetailsPage(),
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
            SvgPicture.asset(
              'assets/icons/pill.svg',
              height: 7.h,
              color: kOtherColor,
            ),
            const Spacer(),
            Text(
              textAlign: TextAlign.start,
              overflow: TextOverflow.fade,
              'Calpol',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              textAlign: TextAlign.start,
              overflow: TextOverflow.fade,
              'A cada 8 horas',
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
