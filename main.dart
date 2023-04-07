import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';

class PasswordChecker extends StatefulWidget {
  PasswordChecker({Key? key}) : super(key: key);

  @override
  _PasswordCheckerState createState() => _PasswordCheckerState();
}

class _PasswordCheckerState extends State<PasswordChecker> {
  final TextEditingController _regexController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _resultText = 'NA';

  void _checkPassword() {
    String passText = _passwordController.text;
    String regexText = _regexController.text;

    try {
      RegExp regex = new RegExp(regexText);
    } on FormatException {
      setState(() {
        _resultText = 'Invalid Pattern';
      });
      return;
    }

    if (RegExp(regexText).hasMatch(passText)) {
      setState(() {
        _resultText = 'Valid';
      });
    } else {
      setState(() {
        _resultText = 'Invalid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regular Expression Check'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _regexController,
              decoration: InputDecoration(
                labelText: 'Add Regular Expression to be Checked',
                hintText: 'Enter regular expression',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Add Password to be Checked',
                hintText: 'Enter password',
              ),
            ),
            Text(
              _resultText,
              style: TextStyle(fontSize: 20.0, color: Colors.red),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: _checkPassword,
              child: Text('Check'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(home: PasswordChecker()));
}
