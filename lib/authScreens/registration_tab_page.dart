import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationTabPage extends StatefulWidget {
  const RegistrationTabPage({Key? key}) : super(key: key);

  @override
  State<RegistrationTabPage> createState() => _RegistrationTabPageState();
}

class _RegistrationTabPageState extends State<RegistrationTabPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: const Column(
          children: [
            SizedBox(height: 12),
            //get-capture image
            CircleAvatar(child: Icon(Icons.add_photo_alternate)),
            //inputs form fields
          ],
        ),
      ),
    );
  }
}
