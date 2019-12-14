import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MYSQL Server',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Flutter MYSQL Server App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(
            'MYSQL DATA : \n\n ${data[index]} \n',
            style: TextStyle(fontSize: 24),
          );
        },
      ),
    );
  }

  Future getData() async {
    var url = 'https://isoclinal-students.000webhostapp.com/get.php';
    http.Response response = await http.get(url);
    data = jsonDecode(response.body);
    print(data);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    setState(() {});
  }
}
