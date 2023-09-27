import 'package:flutter/material.dart';
import 'package:movemate/presentation/resources/assets.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';

const kGreen = Color(0xff4aca2d);

class RecentShipment extends StatelessWidget {
  const RecentShipment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Shipment Number",
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.6),
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    text: "NE4399201946843",
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Transform.flip(
                flipX: true,
                child: const Image(
                  image: AppAssets.forklift,
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Divider(),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _TextColumn(
                title: "Sender",
                subtitleText: "Atlanta, 5243",
                leading: _SenderIcon(),
              ),
              _TextColumn(
                title: "Time",
                subtitle: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: kGreen,
                      radius: 3,
                    ),
                    const SizedBox(width: 4),
                    CustomText(
                      text: "2 days - 3 days  ",
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TextColumn(
                title: "Receiver",
                subtitleText: "Chicago, 6342",
                leading: _ReceiverIcon(),
              ),
              _TextColumn(
                title: "Status",
                subtitleText: "Waiting to collect",
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.secondary,
                size: 16,
              ),
              CustomText(
                text: "Add Stop",
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SenderIcon extends StatelessWidget {
  const _SenderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffffe6d5),
      radius: 13,
      child: Stack(
        children: [
          const Image(
            image: AppAssets.boxColored,
            height: 16,
            width: 16,
          ),
          Positioned(
            left: 0,
            right: 0,
            child: RotatedBox(
              quarterTurns: 2,
              child: Image(
                image: AppAssets.arrow,
                height: 6,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReceiverIcon extends StatelessWidget {
  const _ReceiverIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color(0xffd7f0df),
      radius: 13,
      child: Stack(
        children: [
          Image(
            image: AppAssets.boxColored,
            height: 16,
            width: 16,
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Image(
              image: AppAssets.arrow,
              height: 7,
              color: kGreen,
            ),
          ),
        ],
      ),
    );
  }
}

class _TextColumn extends StatelessWidget {
  const _TextColumn({
    super.key,
    required this.title,
    this.subtitleText = '',
    this.subtitle,
    this.leading,
  });

  final String title;
  final String subtitleText;
  final Widget? subtitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 12,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.6),
        ),
        const SizedBox(height: 2),
        subtitle ??
            CustomText(
              text: subtitleText,
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ],
    );

    if (leading != null) {
      return Row(
        children: [
          leading!,
          const SizedBox(width: 8),
          child,
        ],
      );
    }
    return child;
  }
}
