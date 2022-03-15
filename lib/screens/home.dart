import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Image.asset('image/logo.png', width: 53,),
            centerTitle: true
        ),
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10,),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("두통 ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                      textAlign: TextAlign.left),
                ],
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
