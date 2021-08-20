import "package:flutter/material.dart";

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request =
    "https://api.hgbrasil.com/finance?format=json-cors&key=7b2aadc8";

void main() async {
  runApp(MaterialApp(home: Home()));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body)["results"]["currencies"]["USD"];
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("\$ Conversor \$"),
            backgroundColor: Colors.amber,
            centerTitle: true,
          ),
          body: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapsht) {
              switch(snapsht.connectionState){
                case ConnectionState.none:
                  return Center(
                    child: Text("Carregando Dados ...")
                  );
              }
            })
    );
  }
}
