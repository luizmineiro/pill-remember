import 'package:flutter/material.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            const WelcomeText(),
            SizedBox(height: 2.h),
            // Flexible(
            //   child: Center(
            //     child: Text(
            //       'Ainda não há remédios cadastrados',
            //       textAlign: TextAlign.center,
            //       style: Theme.of(context).textTheme.headlineSmall,
            //     ),
            //   ),
            // ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(top: 1.h),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const MedicineCard();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MedicineRegistryPage(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 5.h,
          color: Colors.white,
        ),
      ),
    );
  }
}
