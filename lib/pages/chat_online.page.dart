import 'package:chatonline/api/user.api.dart';
import 'package:chatonline/model/user.dart';
import 'package:chatonline/pages/user.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatOnlinePage extends StatefulWidget {
  const ChatOnlinePage({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: /*FutureBuilder<User?>(
        future: UserApi.readUser(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            final user=snapshot.data;
            return user==null
              ? Center(child: Text('No User'),)
              : buildUser(user);
          }
        },
      ),*/StreamBuilder(
        stream: UserApi.readUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList(),
            );
          }else{
            //print('total da lista firebase: ${UserApi.readUsers().length}');
           // print('teste: ${snapshot.data}');
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => UserPage(),
            ),
          );
        },
      ),
    );
  }
}
