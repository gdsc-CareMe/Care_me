import 'package:care_me/screens/bottom_bar_page.dart';
import 'package:care_me/screens/home.dart';
import 'package:care_me/screens/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100.0,
            ),
            const Center(
              child: Image(
                width: 130.0,
                height: 130.0,
                image: AssetImage(
                  'image/logo.png',
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: 354,
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("로그인",
                      style: const TextStyle(
                          color: const Color(0xff02171a),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                      textAlign: TextAlign.left),
                ],
              ),
            ),

            //로그인 폼
            Form(
                child: Theme(
                    data: ThemeData(
                        primaryColor: const Color(0xffffbbbb),
                        inputDecorationTheme: const InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0))),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          const TextField(
                            decoration: InputDecoration(labelText: '아이디'),
                            keyboardType: TextInputType.text,
                          ),
                          const TextField(
                            decoration: InputDecoration(labelText: '비밀번호'),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 75.0,
                          ),
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minWidth: 400.0,
                            height: 50.0,
                            child: MaterialButton(
                              color: const Color(0xffffb1b1),
                              child: const Text(
                                '로그인',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                builder: (context) => const BottomBarPage(),
                                ),
                                );
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 10.0,),

                          //회원가입 버튼
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minWidth: 400.0,
                            height: 50.0,
                            child: MaterialButton(
                              color: const Color(0xffff8585),
                              child: const Text(
                                '회원가입',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                builder: (context) => const Signup(),
                                ),
                                );
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
