import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddButtonWidget extends ConsumerStatefulWidget {
  const AddButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.borderColor,
      required this.backgroundColor});

  final Function onPressed;
  final String text;
  final Color borderColor;
  final Color backgroundColor;

  @override
  _AddButtonWidget createState() => _AddButtonWidget();
}

class _AddButtonWidget extends ConsumerState<AddButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            side: BorderSide(width: 1, color: widget.borderColor),
            backgroundColor: widget.backgroundColor),
        onPressed: () {
          print('Add button is clicked!');
        },
        child: Text(
          widget.text,
          style: TextStyle(color: widget.borderColor),
        ));
  }
}
