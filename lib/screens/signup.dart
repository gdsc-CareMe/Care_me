import 'package:flutter/material.dart';
import 'package:care_me/screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100.0,
            ),
            //const Center(
              //child: Image(
                //width: 130.0,
                //height: 60.0,
                //image: AssetImage(
                  //'image/Login_logo.png',
                //),
              //),
            //),
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
                  Text("회원가입",
                      style: const TextStyle(
                          color: const Color(0xff02171a),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                      textAlign: TextAlign.left),
                ],
              ),
            ),

            //회원가입 폼
            Form(
                child: Theme(
                    data: ThemeData(
                        primaryColor: const Color(0xffa9c8cb),
                        inputDecorationTheme: const InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0))),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          const TextField(
                            decoration: InputDecoration(labelText: '이름'),
                            keyboardType: TextInputType.text,
                          ),
                          const TextField(
                            decoration: InputDecoration(labelText: '전화번호'),
                            keyboardType: TextInputType.text,
                          ),
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

                          //회원가입 버튼
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minWidth: 400.0,
                            height: 50.0,
                            child: MaterialButton(
                              color: const Color(0xff77a4a8),
                              child: const Text(
                                '회원가입',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                builder: (context) => const Login(),
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
