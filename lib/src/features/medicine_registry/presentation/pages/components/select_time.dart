import 'package:flutter/material.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:sizer/sizer.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
      });
    }
    return picked!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            _selectTime();
          },
          child: Center(
            child: Text(
              _clicked == false
                  ? 'Selecione seu horário'
                  : '${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kScaffoldColor),
            ),
          ),
        ),
      ),
    );
  }
}
