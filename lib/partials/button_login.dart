import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final VoidCallback? onpress;
  final Color fore;
  final Color back;
  final Color side;
  final Widget title;
  const ButtonLogin({
    super.key,
    required this.fore,
    required this.back,
    required this.side,
    required this.title,
    this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpress ?? () {},
        style: ElevatedButton.styleFrom(
            foregroundColor: fore,
            backgroundColor: back,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: BorderSide(color: side, width: 2)),
        child: SizedBox(
          width: 60,
          child: title
        ));
  }
}
