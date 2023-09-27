import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';

class ShipmentOptionCard extends StatefulWidget {
  const ShipmentOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.rotateImage = false,
  });

  final String title;
  final String subtitle;
  final AssetImage image;
  final bool rotateImage;

  @override
  State<ShipmentOptionCard> createState() => _ShipmentOptionCardState();
}

class _ShipmentOptionCardState extends State<ShipmentOptionCard>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 300,
    ),
  );

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(begin: -80, end: -20).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image(
      image: widget.image,
      height: 80,
      width: 100,
    );

    if (widget.rotateImage) {
      imageWidget = Transform.flip(
        flipX: true,
        child: imageWidget,
      );
    }
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ValueListenableBuilder<double>(
          valueListenable: _animation,
          builder: (context, position, _) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.title,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: widget.subtitle,
                        fontSize: 11.5,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(.7),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: position / 5,
                  right: position,
                  child: imageWidget,
                ),
              ],
            );
          }),
    );
  }
}
