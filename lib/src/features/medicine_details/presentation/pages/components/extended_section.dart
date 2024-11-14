import 'package:flutter/material.dart';
import 'package:pill_reminder_app/src/src.dart';

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        ExtendedInfoTab(
          fieldTitle: 'Tipo do medicamento',
          fieldInfo: 'pilula',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Intervalo entre as doses',
          fieldInfo: 'A cada 8 horas | 3 vezes ao dia',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Horario de Inicio',
          fieldInfo: '01:19',
        ),
      ],
    );
  }
}
