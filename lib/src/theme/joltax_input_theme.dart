import 'package:flutter/material.dart';

/// ThemeExtension that holds all theme properties for Joltax input widgets.
/// This allows customizing input appearance via `ThemeData.extensions`
/// without changing each widget individually.
class JoltaxInputTheme extends ThemeExtension<JoltaxInputTheme> {
  /// Creates a theme with optional customization.
  const JoltaxInputTheme({
    this.backgroundColor = const Color(0xFFFFFDFE),
    this.borderWidth = 0.5,
    this.focusBorderWidth = 1.5,
    this.borderColor = const Color(0xFF222222),
    this.focusedBorderColor = const Color(0xFF222222),
    this.errorBorderColor = const Color(0xFFC13514),
    this.readOnlyBorderColor = const Color(0xFFBDBDBD),
    this.readOnlyBackgroundColor = const Color(0xFFF5F5F5),
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.gap = 8.0,
  });

  /// Background color of the input.
  final Color backgroundColor;

  /// Border thickness when not focused.
  final double borderWidth;

  /// Border thickness when focused.
  final double focusBorderWidth;

  /// Border color when not focused.
  final Color borderColor;

  /// Border color when focused.
  final Color focusedBorderColor;

  /// Border color in error state.
  final Color errorBorderColor;

  /// Border color in read-only state.
  final Color readOnlyBorderColor;

  /// Background color in read-only state.
  final Color readOnlyBackgroundColor;

  /// Border corner radius.
  final double borderRadius;

  /// Inner padding for the input content.
  final EdgeInsetsGeometry padding;

  /// Text style of the input value.
  final TextStyle? textStyle;

  /// Label style of the input.
  final TextStyle? labelStyle;

  /// Hint (placeholder) style.
  final TextStyle? hintStyle;

  /// Gap between the label and the input field.
  final double gap;

  /// Creates a copy of this theme with the given fields replaced by new values.
  @override
  JoltaxInputTheme copyWith({
    Color? backgroundColor,
    double? borderWidth,
    double? focusBorderWidth,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? readOnlyBorderColor,
    Color? readOnlyBackgroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    double? gap,
  }) {
    return JoltaxInputTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderWidth: borderWidth ?? this.borderWidth,
      focusBorderWidth: focusBorderWidth ?? this.focusBorderWidth,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      readOnlyBorderColor: readOnlyBorderColor ?? this.readOnlyBorderColor,
      readOnlyBackgroundColor: readOnlyBackgroundColor ?? this.readOnlyBackgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      labelStyle: labelStyle ?? this.labelStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      gap: gap ?? this.gap,
    );
  }

  /// Linearly interpolate between two theme objects.
  @override
  ThemeExtension<JoltaxInputTheme> lerp(ThemeExtension<JoltaxInputTheme>? other, double t) {
    if (other is! JoltaxInputTheme) return this;
    return JoltaxInputTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ?? backgroundColor,
      borderWidth: _lerpDouble(borderWidth, other.borderWidth, t) ?? borderWidth,
      focusBorderWidth: _lerpDouble(focusBorderWidth, other.focusBorderWidth, t) ?? focusBorderWidth,
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      focusedBorderColor: Color.lerp(focusedBorderColor, other.focusedBorderColor, t) ?? focusedBorderColor,
      errorBorderColor: Color.lerp(errorBorderColor, other.errorBorderColor, t) ?? errorBorderColor,
      readOnlyBorderColor: Color.lerp(readOnlyBorderColor, other.readOnlyBorderColor, t) ?? readOnlyBorderColor,
      readOnlyBackgroundColor:
          Color.lerp(readOnlyBackgroundColor, other.readOnlyBackgroundColor, t) ?? readOnlyBackgroundColor,
      borderRadius: _lerpDouble(borderRadius, other.borderRadius, t) ?? borderRadius,
      padding: EdgeInsets.lerp(padding as EdgeInsets?, other.padding as EdgeInsets?, t) ?? padding,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t),
      hintStyle: TextStyle.lerp(hintStyle, other.hintStyle, t),
      gap: _lerpDouble(gap, other.gap, t) ?? gap,
    );
  }
}

/// Helper function to linearly interpolate between two doubles.
double? _lerpDouble(double a, double b, double t) => a + (b - a) * t;
