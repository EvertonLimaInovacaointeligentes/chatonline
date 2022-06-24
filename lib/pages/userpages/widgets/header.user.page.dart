import 'dart:io';

import 'package:chatonline/model/user.dart';
import 'package:flutter/material.dart';

import '../chat.page.dart';

class HeaderUserPage extends StatefulWidget {
  final List<User> users;

  const HeaderUserPage({Key? key, required this.users}) : super(key: key);

  @override
  _HeaderUserPageState createState() => _HeaderUserPageState();
}

class _HeaderUserPageState extends State<HeaderUserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const Text(
                  'Chats Online',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              ),
              IconButton(
                onPressed: () {
                  exit(0);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          SafeArea(
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.users.length,
                itemBuilder: (context, index) {
                  final user = widget.users[index];
                  if (index == 0) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: const CircleAvatar(
                        radius: 24,
                        child: Icon(Icons.search),
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () {
                          print('clicou: $index');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                user: user,
                              ),
                            ),
                          );
                        },
                        child: ClipOval(
                          //backgroundImage: NetworkImage(user.foto),
                          child: Image.network(
                            user.foto,
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          //BodyUserPage(),
        ],
      ),
    );
  }
}
