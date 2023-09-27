import 'package:flutter/material.dart';
import 'package:movemate/presentation/resources/assets.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';

class CalculationResultView extends StatelessWidget {
  const CalculationResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 72),
          const Image(
            image: AppAssets.logo,
          ),
          const SizedBox(height: 48),
          Transform.flip(
            flipX: true,
            child: Image(
              image: AppAssets.deliveryBox,
              width: 100,
              height: 150,
              color: Colors.grey.shade200,
              colorBlendMode: BlendMode.color,
            ),
          ),
          const SizedBox(height: 12),
          const CustomText(
            text: "Total Estimated Amount",
            fontSize: 20,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const CustomText(
            text: "\$1460 USD",
            fontSize: 18,
            textAlign: TextAlign.center,
            color: Color(0xff4aca2d),
          ),
          const SizedBox(height: 8),
          const CustomText(
            text:
                "This amount is estimated this will vary if you change your location or weight",
            textAlign: TextAlign.center,
            color: Colors.grey,
          ),
          const SizedBox(height: 32),
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.sizeOf(context).width * .85, 45),
              ),
            ),
            onPressed: Navigator.of(context).pop,
            child: const Text("Back to home"),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
