import 'package:flutter/material.dart';
import 'package:todo_mobx/stores/login_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custon_icon_button.dart';
import 'list_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //instancia a classe LoginStore para usar Mobx
  LoginStore loginStore = LoginStore();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Observer(
                    builder: (context) {
                      return CustomTextField(
                        hint: 'E-mail',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                        enabled: !loginStore.loading,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(
                    builder: (context) {
                      return CustomTextField(
                        hint: 'Senha',
                        prefix: Icon(Icons.lock),
                        obscure: !loginStore.passwordVisible,
                        onChanged: loginStore.setPassword,
                        enabled: !loginStore.loading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: loginStore.passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: loginStore.setAlterPasswordVisible,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //Observer widget que escuta observáveis e reconstrói automaticamente as alterações
                  Observer(
                    builder: (context) {
                      return SizedBox(
                        height: 44,
                        width: 100,
                        child: ElevatedButton(
                          child: loginStore.loading
                              ? Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            primary: Theme.of(context).primaryColor,
                            onSurface:
                                Theme.of(context).primaryColor.withAlpha(100),
                          ),
                          //se login e senha forem validos, ativa o botao de login (vincula a funcao ao onPressed)
                          onPressed: loginStore.loginPressed as void Function()?
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
