import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movemate/presentation/resources/assets.dart';
import 'package:movemate/presentation/views/calculate/calculation_result_view.dart';
import 'package:movemate/presentation/views/calculate/widgets/category_chip.dart';
import 'package:movemate/presentation/views/calculate/widgets/prefix_icon.dart';
import 'package:movemate/presentation/views/calculate/widgets/section_title.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';
import 'package:movemate/presentation/widgets/custom_text_field.dart';

class CalculateView extends StatefulWidget {
  const CalculateView({super.key});

  @override
  State<CalculateView> createState() => _CalculateViewState();
}

class _CalculateViewState extends State<CalculateView> {
  late final _chips = [
    "Documents",
    "Glass",
    "Liquid",
    "Food",
    "Electronic",
    "Product",
    "Others"
  ];
  String _selectedChip = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculate"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            CustomText(
              text: "Destination",
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  CustomTextField(
                    hint: "Sender location",
                    prefix: PrefixIcon(icon: Icons.unarchive_outlined),
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    hint: "Receiver location",
                    prefix: PrefixIcon(icon: Icons.archive_outlined),
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    hint: "Approx weight",
                    prefix: PrefixIcon(icon: Icons.scale_outlined),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const SectionTitle(title: "Packaging"),
            const SizedBox(height: 16),
            CustomTextField(
              fillColor: Theme.of(context).primaryColorLight,
              prefix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 8),
                  Transform.flip(
                    flipX: true,
                    child: Image(
                      image: AppAssets.deliveryBox,
                      width: 30,
                      height: 30,
                      color: Colors.grey.shade200,
                      colorBlendMode: BlendMode.color,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    height: 20,
                    width: 1.2,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
              suffix: const Icon(
                Icons.expand_more,
                color: Colors.grey,
              ),
              controller: TextEditingController(text: "Box"),
              readOnly: true,
            ),
            const SizedBox(height: 16),
            const SectionTitle(title: "Categories"),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (var chip in _chips)
                  CategoryChip(
                    label: chip,
                    active: _selectedChip == chip,
                    onTap: (value) {
                      setState(() {
                        _selectedChip = value;
                      });
                    },
                  )
              ],
            ),
            const SizedBox(height: 48),
            TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.sizeOf(context).width * .85, 45),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_) => const CalculationResultView(),
                  ),
                );
              },
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
