import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(this.onPressed, this.child, {this.radius, this.color, this.height, this.width});

  final void Function() onPressed;
  final Widget child;
  final BorderRadius? radius;
  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: radius != null ? radius! : BorderRadius.zero,
        ),
      ),
      minimumSize: MaterialStateProperty.all(Size(width != null ? width! : 100, height != null ? height! : 30)),
      backgroundColor: MaterialStateProperty.all(color != null ? color! : Colors.white)
    ), child: child);
  }
}
