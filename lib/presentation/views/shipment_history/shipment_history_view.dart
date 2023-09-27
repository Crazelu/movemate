import 'package:flutter/material.dart';
import 'package:movemate/models/shipment.dart';
import 'package:movemate/presentation/resources/assets.dart';
import 'package:movemate/presentation/theme/shipment_history_tab_theme.dart';
import 'package:movemate/presentation/views/shipment_history/widgets/shipment_history_tab.dart';
import 'package:movemate/presentation/views/shipment_history/widgets/shipment_summary_card.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';

class ShipmentHistoryView extends StatefulWidget {
  const ShipmentHistoryView({super.key});

  @override
  State<ShipmentHistoryView> createState() => _ShipmentHistoryViewState();
}

class _ShipmentHistoryViewState extends State<ShipmentHistoryView>
    with TickerProviderStateMixin {
  late final _tabController = TabController(length: 5, vsync: this);
  int _index = 0;
  late List<Shipment> _shipments = Shipment.shipments;

  void _listener() {
    if (mounted && _index != _tabController.index) {
      _index = _tabController.index;
      _shipments = switch (_index) {
        == 1 => Shipment.shipments
            .where((e) => e.status == ShipmentStatus.completed)
            .toList(),
        == 2 => Shipment.shipments
            .where((e) => e.status == ShipmentStatus.inProgress)
            .toList(),
        == 3 => Shipment.shipments
            .where((e) => e.status == ShipmentStatus.pending)
            .toList(),
        == 4 => Shipment.shipments
            .where((e) => e.status == ShipmentStatus.cancelled)
            .toList(),
        _ => Shipment.shipments,
      };
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController.addListener(_listener);
  }

  @override
  void dispose() {
    _tabController.removeListener(_listener);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabTheme = Theme.of(context).extension<ShipmentHistoryTabTheme>()!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipment History"),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.zero,
          tabs: [
            ShipmentHistoryTab(
              label: "All",
              count: Shipment.shipments.length,
              selected: _index == 0,
              theme: tabTheme,
            ),
            ShipmentHistoryTab(
              label: "Completed",
              count: Shipment.shipments
                  .where((e) => e.status == ShipmentStatus.completed)
                  .length,
              selected: _index == 1,
              theme: tabTheme,
            ),
            ShipmentHistoryTab(
              label: "In progress",
              count: Shipment.shipments
                  .where((e) => e.status == ShipmentStatus.inProgress)
                  .length,
              selected: _index == 2,
              theme: tabTheme,
            ),
            ShipmentHistoryTab(
              label: "Pending order",
              count: Shipment.shipments
                  .where((e) => e.status == ShipmentStatus.pending)
                  .length,
              selected: _index == 3,
              theme: tabTheme,
            ),
            ShipmentHistoryTab(
              label: "Cancelled",
              count: Shipment.shipments
                  .where((e) => e.status == ShipmentStatus.cancelled)
                  .length,
              selected: _index == 4,
              theme: tabTheme,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomText(
            text: "Shipments",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          const SizedBox(height: 24),
          if (_shipments.isEmpty) ...{
            Center(
              heightFactor: 4,
              child: Column(
                children: [
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
                  const SizedBox(height: 8),
                  const CustomText(
                    text: "No delivery to see here",
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          },
          for (var shipment in _shipments)
            ShipmentSummaryCard(shipment: shipment)
        ],
      ),
    );
  }
}
