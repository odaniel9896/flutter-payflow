import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

import '../../shared/widgets/input_text/input_text_widget.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({super.key, this.barcode});

  @override
  State<InsertBoletoPage> createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();
  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");

  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");

  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
              child: Text(
                "Preencha dados do boleto",
                style: TextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Form(
                      key: controller.formKey,
                      child: Column(children: [
                        InputTextWidget(
                          label: "Nome do boleto",
                          keyboardType: TextInputType.text,
                          icon: Icons.description_outlined,
                          onChanged: (value) {
                            controller.onChange(name: value);
                          },
                          validator: controller.validateName,
                        ),
                        InputTextWidget(
                          controller: dueDateInputTextController,
                          label: "Vencimento",
                          icon: FontAwesomeIcons.circleXmark,
                          keyboardType: TextInputType.datetime,
                          validator: controller.validateVencimento,
                          onChanged: (value) {
                            controller.onChange(dueDate: value);
                          },
                        ),
                        InputTextWidget(
                          controller: moneyInputTextController,
                          label: "Valor",
                          keyboardType: TextInputType.number,
                          icon: FontAwesomeIcons.wallet,
                          validator: (_) => controller.validateValor(
                              moneyInputTextController.numberValue),
                          onChanged: (value) {
                            controller.onChange(
                                value: moneyInputTextController.numberValue);
                          },
                        ),
                        InputTextWidget(
                          controller: barcodeInputTextController,
                          validator: controller.validateCodigo,
                          label: "Código",
                          keyboardType: TextInputType.text,
                          icon: FontAwesomeIcons.barcode,
                          onChanged: (value) {
                            controller.onChange(barcode: value);
                          },
                        ),
                      ]))
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
          enableSecondaryColor: true,
          primaryLabel: "Cancelar",
          primaryOnPressed: () {
            Navigator.pop(context);
          },
          secondaryLabel: "Cadastrar",
          secondaryOnPressed: () async {
            await controller.cadastrarBoleto();
            Navigator.pop(context);
          }),
    );
  }
}
