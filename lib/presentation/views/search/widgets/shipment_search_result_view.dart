import 'package:flutter/material.dart';
import 'package:movemate/models/shipment.dart';
import 'package:movemate/presentation/views/search/widgets/shipment_card.dart';

class ShipmentSearchResultView extends StatefulWidget {
  const ShipmentSearchResultView({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<ShipmentSearchResultView> createState() =>
      _ShipmentSearchResultViewState();
}

class _ShipmentSearchResultViewState extends State<ShipmentSearchResultView> {
  late List<Shipment> _shipments = Shipment.shipments;

  TextEditingController get controller => widget.controller;

  void _listener() {
    if (!mounted) return;

    final query = controller.text.toLowerCase();

    if (query.isEmpty) {
      setState(() {
        _shipments = Shipment.shipments;
      });
    } else {
      setState(() {
        _shipments = Shipment.shipments
            .where((e) =>
                e.id.toLowerCase().contains(query) ||
                e.item.toLowerCase().contains(query) ||
                e.origin.toLowerCase().contains(query) ||
                e.destination.toLowerCase().contains(query))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_listener);
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < _shipments.length; i++) ...{
            ShipmentCard(
              shipment: _shipments[i],
              showDivider: i != _shipments.length - 1,
            ),
          },
        ],
      ),
    );
  }
}
