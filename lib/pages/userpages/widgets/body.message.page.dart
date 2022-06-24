import 'package:flutter/material.dart';

class BodyMessage extends StatefulWidget {

  const BodyMessage({Key? key}) : super(key: key);

  @override
  _BodyMessageState createState() => _BodyMessageState();
}

class _BodyMessageState extends State<BodyMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        height: MediaQuery.of(context).size.height*0.68,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
