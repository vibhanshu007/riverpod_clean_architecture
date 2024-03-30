import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeDurationWidget extends ConsumerWidget {
  const TimeDurationWidget({super.key, required this.time});

  final int time;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
      color: Colors.green.shade50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.av_timer,
            color: Colors.black,
            size: 12.0,
          ),
          Text(
            '$time Min',
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
    );
  }
}
