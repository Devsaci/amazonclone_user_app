import 'package:amazonclone_user_app/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';

class LoginTabPage extends StatefulWidget {
  const LoginTabPage({Key? key}) : super(key: key);

  @override
  State<LoginTabPage> createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(),
        CustomTextField(),
        ],
    );
  }
}
