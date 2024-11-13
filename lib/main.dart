import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pill Remider',
          theme: ThemeData.dark().copyWith(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kScaffoldColor,
            appBarTheme: AppBarTheme(
              toolbarHeight: 7.h,
              backgroundColor: kScaffoldColor,
              elevation: 0,
              iconTheme: IconThemeData(color: kSecondaryColor, size: 20.sp),
              titleTextStyle: GoogleFonts.mulish(
                color: kTextColor,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 16.sp,
              ),
            ),
            textTheme: TextTheme(
              headlineSmall: TextStyle(
                fontSize: 15.sp,
                color: kSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
              headlineMedium: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w900,
                color: kTextColor,
              ),
              headlineLarge: GoogleFonts.poppins(
                color: kTextColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
                fontSize: 18.sp,
              ),
              bodyMedium: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: kTextColor,
              ),
              labelMedium: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: kTextColor,
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kTextLightColor,
                  width: 0.7,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: kTextLightColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: kScaffoldColor,
              hourMinuteColor: kTextColor,
              hourMinuteTextColor: kScaffoldColor,
              dayPeriodColor: kTextColor,
              dayPeriodTextColor: kScaffoldColor,
              dialBackgroundColor: kTextColor,
              dialHandColor: kPrimaryColor,
              dialTextColor: kScaffoldColor,
              entryModeIconColor: kOtherColor,
              dayPeriodTextStyle: GoogleFonts.aBeeZee(
                fontSize: 8.sp,
              )
            ),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
