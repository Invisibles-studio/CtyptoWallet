import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(text, style: style),
    );
  }
}

class GradientTextWithChild extends StatefulWidget {
  const GradientTextWithChild(this.child, {Key? key,
    required this.gradient,
    this.style,
  }): super(key: key);

  final Widget child;
  final TextStyle? style;
  final Gradient gradient;

  @override
  _GradientTextWithChild createState() => _GradientTextWithChild(child, style, gradient);

}

class _GradientTextWithChild extends State<GradientTextWithChild>{
  _GradientTextWithChild(this.child, this.style, this.gradient);

  final Widget child;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: DefaultTextStyle(
        style: style != null ? style! : TextStyle(),
        child: child,
      ),
    );
  }
}
