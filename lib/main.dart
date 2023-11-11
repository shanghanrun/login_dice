import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50)),
          Center(
            child: Image.asset('image/chef.gif', width: 170, height: 190),
          ),
          Form(
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.teal, //밑줄 색상
                inputDecorationTheme: const InputDecorationTheme(
                  labelStyle: TextStyle(
                    color: Colors.teal,
                    fontSize: 15,
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(40),
                child: const Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter "dice"',
                      ),
                      keyboardType: TextInputType.emailAddress, //@기호있음
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter Password',
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true, // 안보이게 함
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
