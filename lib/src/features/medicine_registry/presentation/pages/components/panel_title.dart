import 'package:flutter/material.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:sizer/sizer.dart';

class PanelTitle extends StatelessWidget {
  final String title;
  final bool isRequired;
  const PanelTitle({
    super.key,
    required this.title,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            if(isRequired)
            TextSpan(
              text: ' *',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: kErrorBorderColor),
            ),
          ],
        ),
      ),
    );
  }
}
