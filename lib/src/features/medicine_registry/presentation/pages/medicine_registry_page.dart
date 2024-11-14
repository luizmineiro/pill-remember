import 'package:flutter/material.dart';
import 'package:pill_reminder_app/src/features/medicine_registry/presentation/pages/components/select_time.dart';
import 'package:pill_reminder_app/src/global_bloc.dart';
import 'package:pill_reminder_app/src/src.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MedicineRegistryPage extends StatefulWidget {
  const MedicineRegistryPage({super.key});

  @override
  State<MedicineRegistryPage> createState() => _MedicineRegistryPageState();
}

class _MedicineRegistryPageState extends State<MedicineRegistryPage> {
  late TextEditingController nameController;
  late TextEditingController dosageController;

  late MedicineRegistryBloc _medicineRegistryBloc;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  ValueNotifier<MedicineTypeEnum> selectedMedicineTypeNotifier =
      ValueNotifier(MedicineTypeEnum.none);

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _medicineRegistryBloc = MedicineRegistryBloc();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
    _medicineRegistryBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Adicionar Remédio'),
      ),
      body: Provider<MedicineRegistryBloc>.value(
        value: _medicineRegistryBloc,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PanelTitle(
                  title: 'Nome do medicamento',
                  isRequired: true,
                ),
                TextFormField(
                  controller: nameController,
                  maxLength: 12,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    counter: SizedBox.shrink(),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.black),
                ),
                const PanelTitle(title: 'Dosagem em mg'),
                TextFormField(
                  controller: dosageController,
                  maxLength: 12,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    counter: SizedBox.shrink(),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(height: 2.h),
                const PanelTitle(title: 'Tipo de medicamento'),
                StreamBuilder<MedicineTypeEnum>(
                  stream: _medicineRegistryBloc.selectedMedicineType,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: StreamBuilder<MedicineTypeEnum>(
                        stream: _medicineRegistryBloc.selectedMedicineType,
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MedicineType(
                                medicineTypeEnum: MedicineTypeEnum.bootle,
                                name: 'Frasco',
                                iconValue: 'assets/icons/bottle.svg',
                                isSelected:
                                    snapshot.data == MedicineTypeEnum.bootle,
                              ),
                              MedicineType(
                                medicineTypeEnum: MedicineTypeEnum.pill,
                                name: 'Cápsula',
                                iconValue: 'assets/icons/pill.svg',
                                isSelected:
                                    snapshot.data == MedicineTypeEnum.pill,
                              ),
                              MedicineType(
                                medicineTypeEnum: MedicineTypeEnum.syringe,
                                name: 'Siringa',
                                iconValue: 'assets/icons/syringe.svg',
                                isSelected:
                                    snapshot.data == MedicineTypeEnum.syringe,
                              ),
                              MedicineType(
                                medicineTypeEnum: MedicineTypeEnum.tablet,
                                name: 'Comprimido',
                                iconValue: 'assets/icons/tablet.svg',
                                isSelected:
                                    snapshot.data == MedicineTypeEnum.tablet,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
                const PanelTitle(
                  title: 'Selecionar intervalo de tempo',
                  isRequired: true,
                ),
                const IntervalSelection(),
                const PanelTitle(
                  title: 'Horário Inicial',
                  isRequired: true,
                ),
                const SelectTime(),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.w,
                    right: 8.w,
                  ),
                  child: SizedBox(
                    width: 80.w,
                    height: 8.h,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        //* adiconar remedio
                        //* validações
                      },
                      child: Center(
                        child: Text(
                          'Confirmar',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kScaffoldColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
