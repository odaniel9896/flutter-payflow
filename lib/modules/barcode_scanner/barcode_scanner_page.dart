import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
        primaryLabel: "Escanear novamente",
        primaryOnPressed: () {},
        secondaryLabel: "Digitar odigo",
        secondaryOnPressed: () {},
        title: "Não foi possível identificar um código de barras.",
        subtitle:
            "Tente escanear novamente ou digiite o código do seu boleto.");
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                "Escaneie o código de barrras do boleto",
                style: TextStyles.buttonBackground,
              ),
              centerTitle: true,
              leading: const BackButton(color: AppColors.background),
            ),
            body: Column(children: [
              Expanded(
                  child: Container(
                color: Colors.black.withOpacity(0.6),
              )),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.transparent,
                  )),
              Expanded(
                  child: Container(
                color: Colors.black.withOpacity(0.6),
              ))
            ]),
            bottomNavigationBar: SetLabelButtons(
              primaryLabel: "Inserir código do boleto",
              primaryOnPressed: () {},
              secondaryLabel: "Adicionar a galeria",
              secondaryOnPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
