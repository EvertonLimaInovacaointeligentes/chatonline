import 'package:chatonline/api/user.api.dart';
import 'package:chatonline/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessageWidget extends StatefulWidget {
  final User user;

  const NewMessageWidget({Key? key, required this.user}) : super(key: key);

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String messagem = "";

  void EnviandoMensagem() async {
    FocusScope.of(context).unfocus();
    await UserApi.uploadMessage(user: widget.user, message: messagem);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(top: 10),
      height: 70.0,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  labelText: 'Menssagem',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      gapPadding: 10,
                      borderRadius: BorderRadius.circular(25)),
                ),
                onChanged: (value) => setState(() {
                  messagem = value;
                }),
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          //IconButton(onPressed: (){}, icon: const Icon(Icons.send,color: Colors.blue,),),

          GestureDetector(
            onTap: messagem.trim().isEmpty ? null : EnviandoMensagem,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
    /*return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          height: MediaQuery.of(context).size.height / 8,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.82,
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Messagem',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0),
                            gapPadding: 10,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onChanged: (value) => setState(() {}),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        width: 50,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              print('teste');
                            });
                          },
                          icon: const Icon(Icons.send, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // const SizedBox(width: 20,),
      ],
    );*/
  }
}
