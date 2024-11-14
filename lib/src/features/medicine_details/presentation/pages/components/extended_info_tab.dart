import 'package:flutter/material.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:sizer/sizer.dart';

class ExtendedInfoTab extends StatelessWidget {
  const ExtendedInfoTab({
    super.key,
    required this.fieldTitle,
    required this.fieldInfo,
  });

  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(
              fieldTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 15.sp, color: kTextColor),
            ),
          ),
          Text(
            fieldInfo,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 14.sp, color: kSecondaryColor),
          ),
        ],
      ),
    );
  }
}
