import 'package:chatonline/model/user.dart';
import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatefulWidget {
  final User user;

  const ProfileHeaderWidget({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileHeaderWidgetState createState() => _ProfileHeaderWidgetState();
}

class _ProfileHeaderWidgetState extends State<ProfileHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(widget.user.name),
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          },icon: const Icon(Icons.arrow_back,color: Colors.white,),),
           Text(
            widget.user.name,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10,),
          Hero(
            tag: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(40),
              ),
              child: IconButton(
                onPressed: () {

                },
                icon: const Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
          Hero(
            tag: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(40),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.video_call_sharp,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0,),
        ],
      ),
    );
  }
}
