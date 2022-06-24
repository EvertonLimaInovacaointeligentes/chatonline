import 'package:chatonline/model/user.dart';
import 'package:chatonline/pages/userpages/chat.page.dart';
import 'package:flutter/material.dart';

import 'ProfileHeaderWidget.dart';

class BodyUserPage extends StatefulWidget {
  final List<User> users;

  const BodyUserPage({Key? key, required this.users}) : super(key: key);

  @override
  _BodyUserPageState createState() => _BodyUserPageState();
}

class _BodyUserPageState extends State<BodyUserPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.68,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: widget.users.length,
                itemBuilder: (context, index) {
                  final user = widget.users[index];

                  return Column(
                    children: [
                      Container(
                        height: 65,
                        margin: const EdgeInsets.only(right: 12),
                        child: ListTile(
                          onTap: () {
                            print('clicou no $index');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChatPage(
                                  user: user,
                                ),
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(user.foto),
                          ),
                          title: Text(user.name),
                        ),
                      ),

                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
