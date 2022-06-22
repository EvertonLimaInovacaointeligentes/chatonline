import 'package:flutter/material.dart';

class BodyUserPage extends StatefulWidget {
  const BodyUserPage({Key? key}) : super(key: key);

  @override
  _BodyUserPageState createState() => _BodyUserPageState();
}

class _BodyUserPageState extends State<BodyUserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white
      ),
    );
  }
}
