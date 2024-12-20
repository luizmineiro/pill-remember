import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WelcomeText extends StatelessWidget {
  final String numberMedicine;
  const WelcomeText({
    super.key,
    required this.numberMedicine,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            'Menos preocupação. \nMais saúde.',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            'Bem-vindo à sua dose diária.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(height: 2.h),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            numberMedicine,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}
