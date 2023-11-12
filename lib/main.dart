import 'package:flutter/material.dart';

import 'dice.dart';

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
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
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
      body: Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); //올라온 키보드 사라지게
          },
          child: SingleChildScrollView(
            child: Column(
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
                      child: Column(
                        children: [
                          TextField(
                            autofocus: true,
                            controller: textController1,
                            decoration: const InputDecoration(
                              labelText: 'Enter "dice"',
                            ),
                            keyboardType: TextInputType.emailAddress, //@기호있음
                          ),
                          TextField(
                            controller: textController2,
                            decoration: const InputDecoration(
                              labelText: 'Enter Password',
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true, // 안보이게 함
                          ),
                          const SizedBox(height: 40),
                          ButtonTheme(
                            minWidth: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (textController1.text == 'dice' &&
                                    textController2.text == '1234') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Dice()));
                                } else if (textController1.text == 'dice' &&
                                    textController2.text != '1234') {
                                  showSnackBar2(context);
                                } else if (textController1.text != 'dice' &&
                                    textController2.text == '1234') {
                                  showSnackBar3(context);
                                } else {
                                  showSnackBar(context);
                                }
                              },
                              child: const Icon(Icons.arrow_forward), // ->
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
      ),
    );
  }
}

void showSnackBar(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        '로그인 정보를 다시 확인하세요',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black, //디폴트 black이다.
    ),
  );
}

void showSnackBar2(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        '비밀번호가 일치하지 않습니다.',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black, //디폴트 black이다.
    ),
  );
}

void showSnackBar3(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        'dice의 철자를 확인하세요.',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black, //디폴트 black이다.
    ),
  );
}
