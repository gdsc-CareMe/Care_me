import 'package:flutter/material.dart';
import 'package:care_me/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = FirebaseAuth.instance; //사용자 인증 instance
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(); //이름 컨트롤러
  final phoneController = TextEditingController(); //전화번호 컨트롤러
  final emailController = TextEditingController(); //이메일 컨트롤러
  final pwController = TextEditingController(); //비밀번호 컨트롤러

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
                key: _formKey, //입력폼을 하나로 묶어 관리
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
                          //이름 입력 필드
                          Container(
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(labelText: '이름'),
                              keyboardType: TextInputType.text,
                              //이름 입력 형식
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'[a-zA-Z0-9]').hasMatch(value)) {
                                  return ("사용할 수 없는 이름입니다.");
                                }
                              },
                              //nameController의 text값을 저장
                              onSaved: (value) {
                                nameController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          ),

                          //전화번호 입력 필드
                          Container(
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(labelText: '전화번호'),
                              //전화번호 입력 형식
                              validator: (value) {
                                if (value!.isEmpty ||
                                    value.length != 11 ||
                                    !RegExp(r'[0-9]').hasMatch(value)) {
                                  return ("잘못된 번호 형식입니다.");
                                }
                              },
                              //phoneController의 text값을 저장
                              onSaved: (value) {
                                phoneController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          ),

                          //아이디 입력 필드
                          Container(
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(labelText: '아이디'),
                              //아이디 입력 형식
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return ("잘못된 이메일 형식입니다.");
                                }
                              },
                              //emailController의 text값을 저장
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          ),

                          //비밀번호 입력 필드
                          Container(
                            child: TextFormField(
                              controller: pwController,
                              decoration: InputDecoration(labelText: '비밀번호'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              //비밀번호 입력 형식
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (!regex.hasMatch(value!)) {
                                  return ("최소 6자리 이상의 비밀번호가 필요합니다.");
                                }
                              },
                              //pwController의 text값을 저장
                              onSaved: (value) {
                                pwController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                            ),
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
                              color: const Color(0xffff8585),
                              child: const Text(
                                '회원가입',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              onPressed: () { //버튼을 누르면 회원가입 처리 함수 호출
                                signUp(emailController.text, pwController.text);
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

  //회원가입 처리 함수
  void signUp(String email, String password) async {
    //모든 입력 형식이 맞으면 회원가입에 성공
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.createUserWithEmailAndPassword( //유저 정보 create
            email: email, password: password);
        //registerDetails();
        Fluttertoast.showToast(msg: '회원가입이 완료되었습니다.');
        //회원가입 성공시 Login 페이지로 이동
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      } catch (e) { //오류 처리
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
