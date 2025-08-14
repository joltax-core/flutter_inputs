import 'package:flutter/material.dart';
import 'package:joltax_inputs/inputs.dart';

/// Joltax-style outlined input widget.
/// All styles come from [JoltaxInputTheme] via ThemeData.extensions.
class JoltaxOutlinedInput extends StatefulWidget {
  const JoltaxOutlinedInput({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.isPassword = false,
    this.onChanged,
    this.obscureToggleText,
    this.readOnly = false,
  });

  /// Input label text.
  final String label;

  /// Text controller for managing input value.
  final TextEditingController? controller;

  /// Keyboard type (e.g. text, number, email).
  final TextInputType? keyboardType;

  /// If true, the input will hide its content and show a toggle to reveal it.
  final bool isPassword;

  /// Callback when the input value changes.
  final ValueChanged<String>? onChanged;

  /// Texts for password show/hide toggle.
  /// Example: `(show: 'Show', hide: 'Hide')`
  final ({String show, String hide})? obscureToggleText;

  /// If true, the input will be displayed as read-only.
  final bool readOnly;

  @override
  State<JoltaxOutlinedInput> createState() => _JoltaxOutlinedInputState();
}

class _JoltaxOutlinedInputState extends State<JoltaxOutlinedInput> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleObscure() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<JoltaxInputTheme>();

    // Determine border and background colors based on state
    final Color borderColor;
    final double borderWidth;
    final Color backgroundColor;

    if (widget.readOnly) {
      borderColor = theme?.readOnlyBorderColor ?? Colors.grey;
      borderWidth = theme?.borderWidth ?? 0.5;
      backgroundColor = theme?.readOnlyBackgroundColor ?? Colors.grey.shade200;
    } else if (_isFocused) {
      borderColor = theme?.focusedBorderColor ?? Colors.blue;
      borderWidth = theme?.focusBorderWidth ?? 1.5;
      backgroundColor = theme?.backgroundColor ?? Colors.white;
    } else {
      borderColor = theme?.borderColor ?? Colors.grey;
      borderWidth = theme?.borderWidth ?? 0.5;
      backgroundColor = theme?.backgroundColor ?? Colors.white;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(width: borderWidth, color: borderColor, strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(theme?.borderRadius ?? 8),
      ),
      padding: theme?.padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              focusNode: _focusNode,
              keyboardType: widget.keyboardType,
              textInputAction: TextInputAction.done,
              cursorColor: theme?.focusedBorderColor,
              cursorHeight: 16,
              obscureText: _obscureText,
              readOnly: widget.readOnly,
              style: theme?.textStyle ?? const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                label: Text(
                  widget.label,
                  style: theme?.labelStyle ?? const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (widget.isPassword && !widget.readOnly)
            GestureDetector(
              onTap: _toggleObscure,
              child: Text(
                _obscureText ? (widget.obscureToggleText?.show ?? 'Show') : (widget.obscureToggleText?.hide ?? 'Hide'),
                style: (theme?.textStyle ?? const TextStyle(fontSize: 12)).copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
