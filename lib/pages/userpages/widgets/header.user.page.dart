import 'package:chatonline/model/user.dart';
import 'package:chatonline/pages/userpages/widgets/body.user.page.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.75,
            child: const Text('Chats Online',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 25.0),),
          ),
          SizedBox(height: 12,),
          Container(
            height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.users.length,
                  itemBuilder: (context,index){
                    final user=widget.users[index];

                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: (){},
                        child: const CircleAvatar(
                          radius: 24,
                          //backgroundImage: NetworkImage(user.),
                        ),
                      ),
                    );
                  }
              ),

          ),
          //BodyUserPage(),
        ],
      ),
    );
  }
}