import 'package:chatonline/api/user.api.dart';
import 'package:chatonline/model/user.dart';
import 'package:chatonline/pages/userpages/chat.page.dart';
import 'package:chatonline/pages/userpages/user.page.dart';
import 'package:chatonline/pages/userpages/widgets/body.user.page.dart';
import 'package:chatonline/pages/userpages/widgets/header.user.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatOnlinePage extends StatefulWidget {
  final User? user;

  const ChatOnlinePage({Key? key, this.user}) : super(key: key);

  @override
  _ChatOnlinePageState createState() => _ChatOnlinePageState();
}

class _ChatOnlinePageState extends State<ChatOnlinePage> {
  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(child: Text('${user.age}')),
        title: Text(user.name),
        subtitle: Text(
          user.birthday.toIso8601String(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final userList = UserApi.listFutureUser();
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
          stream: UserApi.readUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            //final users= snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(
                      child: Text('por favor tente mais tarde'));
                } else {
                  final users = snapshot.data;
                  if (users!.isEmpty) {
                    return const Center(
                        child: Text('Favor cadastrar usuários'));
                  }
                  return Column(
                    children: [
                      HeaderUserPage(users: users),
                      BodyUserPage(users: users),
                    ],
                  );
                }
            }
          }),

      // ChatPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const UserPage(),
            ),
          );
        },
      ),
    );
  }
}
