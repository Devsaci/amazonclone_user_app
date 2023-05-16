import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? textEditingController;
  IconData? iconData;
  String? hintText;
  bool? isObsecre = true;
  bool? enabled = true;

  CustomTextField({
    super.key,
    this.textEditingController,
    this.iconData,
    this.hintText,
    this.isObsecre,
    this.enabled,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(18.0),
      child: TextFormField(),
    );
  }
}
