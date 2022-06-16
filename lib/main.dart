import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx/pages/login_page.dart';
import 'package:todo_mobx/stores/login_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      //create é o que vai mudar
      create: (context) => LoginStore(),
      //child é o que precisa ser avisado quando o create mudar
      child: MaterialApp(
        title: 'MobX Tutorial',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          cursorColor: Colors.deepPurpleAccent,
          scaffoldBackgroundColor: Colors.deepPurpleAccent,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.deepPurpleAccent,
          ),
        ),
        home: LoginPage(),
      ),
    );
  }
}
