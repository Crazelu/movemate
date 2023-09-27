import 'package:flutter/material.dart';
import 'package:movemate/presentation/resources/assets.dart';
import 'package:movemate/presentation/views/home/widgets/app_bar.dart';
import 'package:movemate/presentation/views/home/widgets/recent_shipment.dart';
import 'package:movemate/presentation/views/home/widgets/section_title.dart';
import 'package:movemate/presentation/views/home/widgets/shipment_option_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          const SectionTitle(title: "Tracking"),
          const SizedBox(height: 12),
          const RecentShipment(),
          const SizedBox(height: 24),
          const SectionTitle(title: "Available Vehicles"),
          const SizedBox(height: 12),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ShipmentOptionCard(
                  title: "Ocean freight",
                  subtitle: "International",
                  image: AppAssets.ship,
                  rotateImage: true,
                ),
                ShipmentOptionCard(
                  title: "Cargo freight",
                  subtitle: "Reliable",
                  image: AppAssets.truck,
                ),
                ShipmentOptionCard(
                  title: "Air freight",
                  subtitle: "International",
                  image: AppAssets.plane,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
