import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  const GradientButton(this.onPressed, this.child, this.gradient, {Key? key, this.borderRadius, this.width, this.height}) : super(key: key);

  final void Function() onPressed;
  final Widget child;
  final Gradient gradient;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  @override
  State<GradientButton> createState() => _GradientButtonState(onPressed, child, gradient, borderRadius, width, height);
}

class _GradientButtonState extends State<GradientButton> {
  _GradientButtonState(this.onPressed,this.child, this.gradient, this.borderRadius, this.width, this.height);

  final void Function() onPressed;
  final Widget child;
  final Gradient gradient;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(width != null ? width! : 100, height != null ? height! : 30)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: borderRadius != null ? borderRadius! : BorderRadius.zero,
              ),
            ),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: borderRadius != null ? borderRadius! : BorderRadius.zero,
          ),
          child: Container(
            width: width != null ? width! : 100,
            height: height != null ? height! : 30,
            child: child,
            alignment: Alignment.center,
          ),
        )
    );
  }
}
