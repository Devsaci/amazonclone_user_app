import 'package:amazonclone_user_app/widgets/custom_text_field.dart';

import 'package:flutter/material.dart';

class LoginTabPage extends StatefulWidget {
  State<LoginTabPage> createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(
            textEditingController: emailTextEditingController,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            textEditingController: passwordTextEditingController,
          ),
        ],
      ),
    );
  }
}
