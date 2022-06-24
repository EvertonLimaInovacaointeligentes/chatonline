import 'package:chatonline/model/user.dart';
import 'package:chatonline/pages/userpages/widgets/ProfileHeaderWidget.dart';
import 'package:chatonline/pages/userpages/widgets/new.message.widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final User user;

  const ChatPage({Key? key, required this.user}) : super(key: key);

  // const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            //ProfileHeaderWidget(),
            const SizedBox(
              height: 6.0,
            ),
            ProfileHeaderWidget(
              user: widget.user,
            ),
            NewMessageWidget(user: widget.user),
            // NewMessageWidget(),
          ],
        ),
      ),
    );
  }
}
