import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx/stores/list_store.dart';
import 'package:todo_mobx/stores/login_store.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/custon_icon_button.dart';
import 'login_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ListStore listStore = ListStore();

  final TextEditingController _controller =  TextEditingController();

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
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        //usando um Provider doo tipo LoginStore, temos acessa a classe LoginStore e entao podemos deslogar
                        Provider.of<LoginStore>(context, listen: false).logout();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginPage()));
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
                        Observer(
                          builder: (context) {
                            return CustomTextField(
                              hint: 'Tarefa',
                              onChanged: listStore.setNewTodoTitle,
                              controller: _controller,
                              suffix: listStore.newTodoTitleValidIsNotEmpty
                                  ? CustomIconButton(
                                      radius: 32,
                                      iconData: Icons.add,
                                      onTap: (){
                                        listStore.addTodoList();
                                        _controller.clear();
                                      }
                                    )
                                  : null,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(child: Observer(
                          builder: (context) {
                            return ListView.separated(
                              itemCount: listStore.todoList.length,
                              itemBuilder: (_, index) {
                                return Observer(
                                  builder: (context) {
                                    return ListTile(
                                      title: Text(
                                        listStore.todoList[index].title,
                                        style: listStore.todoList[index].done
                                            ? TextStyle(
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough)
                                            : TextStyle(color: Colors.black),
                                      ),
                                      onTap:
                                          listStore.todoList[index].toggleDone,
                                      onLongPress: (){
                                        listStore.removeTodo(index);
                                      }
                                    );
                                  },
                                );
                              },
                              separatorBuilder: (_, __) {
                                return Divider();
                              },
                            );
                          },
                        )),
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
