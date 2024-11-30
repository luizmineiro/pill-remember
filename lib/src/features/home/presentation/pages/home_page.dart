import 'package:flutter/material.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: StreamBuilder(
          stream: globalBloc.getMedicineList,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Column(
                children: [
                  WelcomeText(
                    numberMedicine: snapshot.hasData
                        ? snapshot.data!.length.toString()
                        : '0',
                  ),
                  SizedBox(height: 2.h),
                  if (snapshot.connectionState == ConnectionState.waiting)
                    const Center(child: CircularProgressIndicator())
                  else
                    Flexible(
                      child: Center(
                        child: Text(
                          'Ainda não há remédios cadastrados',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                ],
              );
            } else {
              return Column(
                children: [
                  WelcomeText(
                    numberMedicine: snapshot.data!.length.toString(),
                  ),
                  SizedBox(height: 2.h),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(top: 1.h),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return MedicineCard(
                          medicineModel: snapshot.data![index],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
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
