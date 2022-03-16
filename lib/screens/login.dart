import 'package:care_me/screens/bottom_bar_page.dart';
import 'package:care_me/screens/home.dart';
import 'package:care_me/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance; //회원 인증 instance
  final _formKey = GlobalKey<FormState>(); //입력폼에 부여할 수 있는 글로벌 키
  final emailController = new TextEditingController(); //이메일 컨트롤러
  final pwController = new TextEditingController(); //비밀번호 컨트롤러
  final googleSign = GoogleSignIn();

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
                key: _formKey, //입력폼을 하나로 묶어 관리
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
                          //아이디(이메일) 입력 필드
                          Container(
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(labelText: '아이디'),
                              keyboardType: TextInputType.emailAddress,
                              //이메일 입력 형식
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return ("잘못된 이메일 형식입니다.");
                                }
                              },
                              textInputAction:
                                  TextInputAction.next, //엔터 치면 다음 필드로 이동
                            ),
                          ),

                          //비밀번호 입력 필드
                          Container(
                            child: TextFormField(
                              autofocus: false, //자동으로 텍스트 필드가 선택되는 것을 막음
                              controller: pwController,
                              decoration: InputDecoration(labelText: '비밀번호'),
                              keyboardType: TextInputType.text,
                              obscureText: true, //패스워드가 화면에 안보이도록 설정
                              //비밀번호 입력 형식
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (!regex.hasMatch(value!)) {
                                  return ("최소 6자리 이상의 비밀번호가 필요합니다.");
                                }
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          const SizedBox(
                            height: 75.0,
                          ),

                          //로그인 버튼
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
                              onPressed: () { //버튼을 누르면 로그인 처리 함수 호출
                                signIn(emailController.text, pwController.text);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

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

  //로그인 처리 함수
  void signIn(String email, String password) async {
    //모든 입력폼의 형식이 맞으면 로그인 성공
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword( //유저 sign in
            email: email, password: password);
        //로그인 성공시 Home 페이지로 이동
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BottomBarPage()));
      } catch (e) { //오류 처리
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
