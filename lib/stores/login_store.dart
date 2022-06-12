import 'package:mobx/mobx.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
*/

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  /*@observable indica as variaveis que serao observadas, @action indica a função que ira alterar o valor das variaveis observadas,
  @computed são dados que derivam dos seus observáveis, por exemplo, você quer liberar um botão quando todos os seus dados foram preenchidos:*/

  //construtor
  _LoginStore() {
    /*autorun é uma reação que é executado sempre que um observable que esteja dentro dele(temos o _email que é um oservable e esta demtro do autorun) seja lido ou modificado
    sempre que tiver uma alteração no _email, o autorun vai printar o _email*/
    autorun((_) {
      print('email: $_email');
      print('senha: $_password');
    });
  }

  @observable
  String _email = '';

  @observable
  String _password = '';

  @action
  setEmail(String value) {
    _email =value;
  }

  @action
  setPassword(String value) {
    _password = value;
  }

  @computed
  bool get isEmailValid => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email);

  @computed
  bool get isPasswordValid => _password.length >= 6;

  //se email e password forem validos, retorna true
  @computed
  get ifFormValid => isEmailValid && isPasswordValid;

}
