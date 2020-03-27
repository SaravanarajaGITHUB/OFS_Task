import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ofs_task/presentation/utils/app_colors.dart';

class OutlineTextField extends StatelessWidget {
  final String _hint;
  final FocusNode _focusNode;
  final TextInputAction _textInputAction;
  final TextInputType _keyboardType;
  final TextEditingController _textEditingController;
  final bool _obscureText;
  final Widget _prefixIcon;
  final int _minLines;
  final int _maxLines;
  final TextAlign _textAlign;
  final int _maxLength;

  OutlineTextField(
      {@required String hint,
      @required TextInputType keyboardType,
      @required TextEditingController textEditingController,
      FocusNode focusNode,
      TextInputAction textInputAction,
      bool obscureText = false,
      Widget prefixIcon,
      int minLines,
      int maxLines,
      TextAlign textAlign = TextAlign.start,
      int maxLength})
      : this._hint = hint,
        this._keyboardType = keyboardType,
        this._textEditingController = textEditingController,
        this._focusNode = focusNode,
        this._textInputAction = textInputAction,
        this._obscureText = obscureText,
        this._prefixIcon = prefixIcon,
        this._minLines = minLines,
        this._maxLines = maxLines,
        this._textAlign = textAlign,
        this._maxLength = maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: this._focusNode,
      textInputAction: this._textInputAction,
      controller: this._textEditingController,
      obscureText: this._obscureText,
      keyboardType: this._keyboardType,
      minLines: this._minLines,
      maxLines: this._maxLines,
      textAlign: this._textAlign,
      maxLength: this._maxLength,
      decoration: InputDecoration(
          prefixIcon: this._prefixIcon,
          hintText: this._hint,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.GREEN, width: 2.0),
              borderRadius: BorderRadius.circular(8.0)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0)),
    );
  }
}
