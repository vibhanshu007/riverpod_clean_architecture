import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RibbonWidget extends ConsumerWidget {
  const RibbonWidget({super.key, required this.discount});

  final int discount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Stack(
      children: [
        Icon(
          Icons.av_timer,
          color: Colors.black,
          size: 12.0,
        )
      ],
    );
  }
}