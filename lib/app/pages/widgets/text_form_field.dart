import 'package:flutter/material.dart';
import 'package:maybelline/app/ui/app_colors.dart';

// ignore: must_be_immutable
class TextFromFieldWidget extends StatelessWidget {
  final double fontSize;
  String? text;
  String? hintText;
  final bool isEnable;
  final TextEditingController controller;
  final int lines;
  final TextAlign textAlign;
  final BorderRadius buttomShape = BorderRadius.circular(8.0);
  final TextInputType inputType;
  // ignore: prefer_typing_uninitialized_variables
  var validator;

  TextFromFieldWidget(
      {Key? key,
      this.text,
      this.hintText,
      this.fontSize = 13,
      this.isEnable = true,
      this.lines = 1,
      this.textAlign = TextAlign.start,
      this.inputType = TextInputType.text,
      this.validator,
      required this.controller,
      String? Function(String val)? onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      onChanged: (String val) => val = controller.text,
      onSaved: (var val) => val = controller.text,
      maxLines: lines,
      decoration: const InputDecoration(
          border: InputBorder.none, filled: true, fillColor: textFormFillColor),
    );
  }
}
