import 'package:flutter/material.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:sizer/sizer.dart';

class IntervalSelection extends StatefulWidget {
  const IntervalSelection({super.key});

  @override
  State<IntervalSelection> createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  final _intervals = [6, 8, 12, 24];
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Lembre-me a cada',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          DropdownButton(
            dropdownColor: kScaffoldColor,
            iconEnabledColor: kOtherColor,
            itemHeight: 8.h,
            hint: _selected == 0
                ? Text(
                    'intervalo',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map(
              (int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              setState(() {
                _selected = newValue!;
              });
            },
          ),
          Text(
            _selected == 1 ? ' hora' : 'horas',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
