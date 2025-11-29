import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final bool isPassword;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? prefixText;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.isPassword = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.prefixText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    final bool isObscured = widget.isPassword && isObscureText;

    // Enforce single-line when obscured to satisfy:
    // '!obscureText || maxLines == 1'
    final int effectiveMaxLines = isObscured ? 1 : (widget.maxLines ?? 1);
    final int? effectiveMinLines = isObscured ? 1 : widget.minLines;
    final TextInputType effectiveKeyboardType = isObscured
        ? TextInputType.text
        : (widget.keyboardType ?? TextInputType.text);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label),
          const SizedBox(height: 5),
          TextField(
            controller: widget.controller,
            keyboardType: effectiveKeyboardType,
            maxLength: widget.maxLength,
            maxLines: effectiveMaxLines,
            minLines: effectiveMinLines,
            obscureText: isObscured,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              fillColor: Color(0xFFF0F5F5),
              filled: true,
              prefixText: widget.prefixText,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() => isObscureText = !isObscureText);
                      },
                      icon: Icon(
                        isObscureText ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xFF618A8A),
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
