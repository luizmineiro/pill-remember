// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MedicineDetailsPage extends StatefulWidget {
  final MedicineModel medicineModel;
  const MedicineDetailsPage({
    super.key,
    required this.medicineModel,
  });

  @override
  State<MedicineDetailsPage> createState() => _MedicineDetailsPageState();
}

class _MedicineDetailsPageState extends State<MedicineDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            MainSection(
              medicineModel: widget.medicineModel,
            ),
            SizedBox(height: 8.h),
            ExtendedSection(
              medicineModel: widget.medicineModel,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 6.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  openAlertBox(
                    context,
                    globalBloc,
                  );
                },
                child: Text(
                  'Deletar Medicamento',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 16.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  openAlertBox(BuildContext context, GlobalBloc globalBloc) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kScaffoldColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          contentPadding: EdgeInsets.only(top: 1.h),
          title: Text(
            'Deletar esse lembrete?',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 16.sp, color: kPrimaryColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.grey, fontSize: 15.sp),
              ),
            ),
            TextButton(
              onPressed: () {
                globalBloc.removeMedicine(widget.medicineModel);
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'),
                );
              },
              child: Text(
                'OK',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: kSecondaryColor, fontSize: 15.sp),
              ),
            ),
          ],
        );
      },
    );
  }
}
