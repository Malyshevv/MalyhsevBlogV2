import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mailto/mailto.dart';
// For Flutter applications, you'll most likely want to use
// the url_launcher package.
import 'package:url_launcher/url_launcher.dart';

class ContactFormPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
    builder: (context) => ContactFormPage(),
  );

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Введите ваше имя',
                  labelText: 'Имя *',
                  border: OutlineInputBorder()
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String value) {
                  if(value == '') {
                    return 'Заполните поле';
                  }
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Введите ваш email',
                  labelText: 'Email *',
                  border: OutlineInputBorder()
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String value) {
                  if(value == '') {
                    return 'Заполните поле';
                  }
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: commentController,
                maxLines: 3,
                decoration: const InputDecoration(
                  icon: Icon(Icons.comment),
                  hintText: 'Комментарий',
                  labelText: 'Комментарий *',
                  border: OutlineInputBorder()
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String value) {
                  if(value == '') {
                    return 'Заполните поле';
                  }
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: RaisedButton(
                  color: Colors.lightBlue,
                  padding: EdgeInsets.all(15),
                  textColor: Colors.white,
                  onPressed: () {

                    var name = nameController.text;
                    var email = emailController.text;
                    var comment = commentController.text;

                    if(name != '' && email != '') {
                      send(name,email,comment);
                    }
                    else {
                      return  'данные не пеерданы';
                    }


                  },
                  child: Text('Отправить сообщение'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void send(name,email,comment) async{

    final mailtoLink = Mailto(
      to: ['malyshev.dev@ya.ru'],
      cc: [email],
      subject: 'Обратная связь с приложения',
      body: comment,
    );
    await launch('$mailtoLink');
  }
}

