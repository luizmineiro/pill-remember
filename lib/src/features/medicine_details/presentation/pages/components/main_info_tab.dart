import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainInfoTab extends StatelessWidget {
  const MainInfoTab({
    super.key,
    required this.fieldTitle,
    required this.fieldInfo,
  });

  final String fieldTitle;

  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 8.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldTitle,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15.sp),
          ),
          SizedBox(height: 0.3.h),
          Text(
            fieldInfo,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 17.sp),
          ),
        ],
      ),
    );
  }
}
