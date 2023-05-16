import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController? textEditingController;
  IconData? iconData;
  bool? isObsecre = true;
  bool? enabled = true;
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
