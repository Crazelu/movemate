import 'package:flutter/material.dart';
import 'package:movemate/models/shipment.dart';
import 'package:movemate/presentation/resources/assets.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';

class ShipmentCard extends StatefulWidget {
  const ShipmentCard({
    super.key,
    required this.shipment,
    this.showDivider = true,
  });

  final Shipment shipment;
  final bool showDivider;

  @override
  State<ShipmentCard> createState() => _ShipmentCardState();
}

class _ShipmentCardState extends State<ShipmentCard>
    with TickerProviderStateMixin {
  late Animation<Offset> _animation;
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
  );

  @override
  void initState() {
    super.initState();
    _animation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: const Image(
                  image: AppAssets.boxFilled,
                  color: Colors.white,
                  width: 16,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: widget.shipment.item,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    text:
                        "${widget.shipment.id} • ${widget.shipment.origin} → ${widget.shipment.destination}",
                    fontSize: 13,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.75),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ],
          ),
          if (widget.showDivider) const Divider(),
        ],
      ),
    );
  }
}
