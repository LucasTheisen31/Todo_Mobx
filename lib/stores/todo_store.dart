import 'package:mobx/mobx.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
*/

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  /*@observable indica as variaveis que serao observadas, @action indica a função que ira alterar o valor das variaveis observadas,
  @computed são dados que derivam dos seus observáveis, por exemplo, você quer liberar um botão quando todos os seus dados foram preenchidos (@computed precisamos de um get)*/

  //CONSTRUTOR
  _TodoStore(this.title);

  final String title;

  //cariavel observavel para indicar se a tarefa esta condluida
  @observable
  bool done = false;

  @action
  void toggleDone(){
    done = !done;
  }

}