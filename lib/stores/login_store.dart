import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

/*Comando queprecisa executar no terminal:
flutter packages pub run build_runner watch
*/

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  /*@observable indica as variaveis que serao observadas, @action indica a função que ira alterar o valor das variaveis observadas,
  @computed são dados que derivam dos seus observáveis, por exemplo, você quer liberar um botão quando todos os seus dados foram preenchidos (@computed precisamos de um get)*/

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

  @observable
  bool passwordVisible = false;

  //variavel obssrvavel para indicar se esta carregando o loggin
  @observable
  bool loading = false;

  //variavel obssrvavel para indicar se usuario esta logado ou não
  @observable
  bool logedIn = false;

  @action
  void setEmail(String value) {
    _email =value;
  }

  @action
  void setPassword(String value) {
    _password = value;
  }

  @action
  void setAlterPasswordVisible(){
    passwordVisible = !passwordVisible;
  }

  @action
    Future<void> login() async {
    loading = true;

    //processamento do login
    await Future.delayed(Duration(seconds: 2));

    loading = false;
    logedIn = true;

  }

  @computed
  bool get isEmailValid => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email);

  @computed
  bool get isPasswordValid => _password.length >= 6;

  //se email e password forem validos e nao estiver carregando o login, retorna a funcao login senao retorna null
  @computed
  Function? get loginPressed => (isEmailValid && isPasswordValid && !loading) ? login as Function : null;
}
