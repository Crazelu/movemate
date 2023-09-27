import 'package:flutter/material.dart';
import 'package:movemate/models/shipment.dart';
import 'package:movemate/presentation/resources/assets.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';

class ShipmentSummaryCard extends StatelessWidget {
  const ShipmentSummaryCard({super.key, required this.shipment});

  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ShipmentStatusWidget(status: shipment.status),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Arriving today!",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    const SizedBox(height: 2),
                    CustomText(
                      text:
                          "Your delivery, ${shipment.id} from ${shipment.origin} is arriving today!",
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Transform.flip(
                flipX: true,
                child: Image(
                  image: AppAssets.deliveryBox,
                  width: 100,
                  height: 70,
                  color: Colors.grey.shade200,
                  colorBlendMode: BlendMode.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: shipment.price,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
              children: [
                TextSpan(
                  text: " • ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.3),
                  ),
                ),
                TextSpan(
                  text: shipment.date,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShipmentStatusWidget extends StatelessWidget {
  const _ShipmentStatusWidget({super.key, required this.status});

  final ShipmentStatus status;

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      == ShipmentStatus.inProgress => const Color(0xff4aca2d),
      _ => Theme.of(context).colorScheme.secondary,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xfff7f7f7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: switch (status) {
        == ShipmentStatus.inProgress => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sync,
                color: color,
                size: 14,
              ),
              const SizedBox(width: 4),
              CustomText(
                text: "in-progress",
                color: color,
                fontSize: 12,
              ),
            ],
          ),
        _ => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.history,
                color: color,
                size: 14,
              ),
              const SizedBox(width: 4),
              CustomText(
                text: "pending",
                color: color,
                fontSize: 12,
              ),
            ],
          ),
      },
    );
  }
}
