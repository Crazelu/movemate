import 'package:flutter/material.dart';
import 'package:movemate/presentation/resources/assets.dart';
import 'package:movemate/presentation/views/calculate/caculate_view.dart';
import 'package:movemate/presentation/views/home/home_view.dart';
import 'package:movemate/presentation/views/shipment_history/shipment_history_view.dart';

class IndexView extends StatefulWidget {
  const IndexView({super.key});

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  int _index = 0;
  late final _barWidth = MediaQuery.sizeOf(context).width / 4.5;
  late double _offset = (_index + 1) * _barWidth;

  void _updatePage(int index) {
    if (index == _index) return;
    setState(() {
      _index = index;
      _offset = (_index + 1) * _barWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: _index,
            onTap: _updatePage,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(.6),
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined),
                label: "Calculate",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined),
                label: "Shipment",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: _offset - (_barWidth * .75),
            child: Container(
              height: 4,
              width: MediaQuery.sizeOf(context).width / 4.5,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _index,
        children: [
          const HomeView(),
          const CalculateView(),
          const ShipmentHistoryView(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 64,
                  backgroundImage: AppAssets.avatar,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
