import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalBloc? globalBloc;

  @override
  void initState() {
    super.initState();
    globalBloc = GlobalBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pill Remider',
            theme: ThemeData.dark().copyWith(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: kScaffoldColor,
              appBarTheme: AppBarTheme(
                centerTitle: true,
                toolbarHeight: 7.h,
                backgroundColor: kScaffoldColor,
                elevation: 0,
                iconTheme: IconThemeData(color: kSecondaryColor, size: 20.sp),
                titleTextStyle: GoogleFonts.mulish(
                  color: kTextColor,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.sp,
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
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
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
                  )),
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
