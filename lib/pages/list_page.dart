import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/custon_icon_button.dart';
import 'login_page.dart';


class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=>LoginPage())
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        CustomTextField(
                          hint: 'Tarefa',
                          onChanged: (todo){

                          },
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: Icons.add,
                            onTap: (){

                            },
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Expanded(
                          child: ListView.separated(
                            itemCount: 10,
                            itemBuilder: (_, index){
                              return ListTile(
                                title: Text(
                                  'Item $index',
                                ),
                                onTap: (){

                                },
                              );
                            },
                            separatorBuilder: (_, __){
                              return Divider();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}