import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String)? validator;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final bool readOnly;
  final bool obscureText;
  final double borderRadius;
  final Color? fillColor;
  final int? maxLength;
  final Color textColor;
  final VoidCallback? onTap;

  const CustomTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.suffix,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.fillColor = const Color(0xfff9f9f9),
    this.maxLength,
    this.onTap,
    this.textColor = const Color(0xff262a39),
    this.textInputAction = TextInputAction.next,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.borderRadius = 5,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLength: maxLength,
      maxLengthEnforcement: maxLength != null
          ? MaxLengthEnforcement.truncateAfterCompositionEnds
          : MaxLengthEnforcement.none,
      obscureText: obscureText,
      readOnly: readOnly,
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      cursorColor: textColor,
      style: TextStyle(
        fontSize: 14,
        color: textColor,
      ),
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: keyboardType,
      controller: controller,
      focusNode: focusNode,
      validator: (value) {
        if (validator != null) {
          return validator!(value ?? "");
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: fillColor != null,
        hintText: hint,
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xffa5a4a5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
