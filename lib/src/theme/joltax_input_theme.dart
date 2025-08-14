// lib/src/theme/joltax_input_theme.dart
import 'package:flutter/material.dart';

class JoltaxInputTheme extends ThemeExtension<JoltaxInputTheme> {
  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final double gap;

  const JoltaxInputTheme({
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFCCCCCC),
    this.focusedBorderColor = const Color(0xFF007BFF),
    this.errorBorderColor = const Color(0xFFFF4D4F),
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.gap = 8.0,
  });

  @override
  JoltaxInputTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    double? gap,
  }) {
    return JoltaxInputTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      labelStyle: labelStyle ?? this.labelStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      gap: gap ?? this.gap,
    );
  }

  @override
  ThemeExtension<JoltaxInputTheme> lerp(ThemeExtension<JoltaxInputTheme>? other, double t) {
    if (other is! JoltaxInputTheme) return this;
    return JoltaxInputTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ?? backgroundColor,
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      focusedBorderColor: Color.lerp(focusedBorderColor, other.focusedBorderColor, t) ?? focusedBorderColor,
      errorBorderColor: Color.lerp(errorBorderColor, other.errorBorderColor, t) ?? errorBorderColor,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t) ?? borderRadius,
      padding: EdgeInsets.lerp(padding as EdgeInsets?, other.padding as EdgeInsets?, t) ?? padding,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t),
      hintStyle: TextStyle.lerp(hintStyle, other.hintStyle, t),
      gap: lerpDouble(gap, other.gap, t) ?? gap,
    );
  }
}

double? lerpDouble(double a, double b, double t) => a + (b - a) * t;
