import 'package:mobx/mobx.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
*/

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store{

  /*@observable indica as variaveis que serao observadas, @action indica a função que ira alterar o valor das variaveis observadas,
  @computed são dados que derivam dos seus observáveis, por exemplo, você quer liberar um botão quando todos os seus dados foram preenchidos (@computed precisamos de um get)*/

  @observable
  String newTodoTitle = '';

  //lista internamente observavel, perceba que para observar itens da lista temos o tipo ObservableList
  @observable
  ObservableList<String> todoList = ObservableList<String>();

  @action
  void setNewTodoTitle(String value){
    newTodoTitle = value;
  }

  @action
  void addTodoList(){
    todoList.add(newTodoTitle);
    print(todoList);
  }

  @computed
  bool get newTodoTitleValidIsNotEmpty => newTodoTitle.isNotEmpty;

}