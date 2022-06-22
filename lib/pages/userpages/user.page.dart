import 'package:chatonline/api/user.api.dart';
import 'package:chatonline/model/user.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  DateTime? selectedDate;
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastar Usuário'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: controllerName,
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.person),
                hintText: 'Informe o nome'),
            //decoration: decoration('nome'),
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            controller: controllerAge,
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.timelapse_outlined),
                hintText: 'Informe a idade'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 24,
          ),
          DateTimeField(
              decoration: const InputDecoration(
                  hintText: 'Favor escolhar a data de anivarsario!'),
              selectedDate: selectedDate,
              onDateSelected: (DateTime value) {
                setState(() {
                  selectedDate = value;
                });
              }),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            onPressed: () {
              final user = User(
                name: controllerName.text,
                age: int.parse(controllerAge.text),
                birthday: DateTime(2001, 7, 28),
                foto: '',
              );
              UserApi.createUser(usuario: user);
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
          ElevatedButton(
            onPressed: () {
             // final docUser =Fire
            },
            child: const Text('Atualizar'),
          ),
        ],
      ),
    );
  }
}
