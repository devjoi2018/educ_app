import 'package:educ_app/models/user.dart';
import 'package:educ_app/screens/teste_screen.dart';
import 'package:educ_app/widgets/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class RegistrarFrecuenciaScreen extends StatefulWidget {
  static final routeName = 'registrarFrecuenciaScreen';

  @override
  _RegistrarFrecuenciaScreenState createState() =>
      new _RegistrarFrecuenciaScreenState();
}

class _RegistrarFrecuenciaScreenState extends State<RegistrarFrecuenciaScreen> {
  Resp resp;

  Future<Resp> getJSONData() async {
    var response = await http.get(
        Uri.encodeFull(
            "http://treinamento.educ.ifrn.edu.br/api/educ/diario/meus_diarios/"),
        headers: {
          "Authorization": "Token dfba99dbad894452f843d1af00ffbcd559c63e59"
        });

    print('Response status: ${response.statusCode}');

    Map userMap = jsonDecode(response.body);
    resp = Resp.fromJson(userMap["result"][0]);
    print(resp.componente.text);
    return resp = Resp.fromJson(userMap["result"][0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Register Frecuencia Screen'),
        centerTitle: true,
      ),
      body: _bodyRegisterFrecScreen(context: context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          _alerta(context);
        },
      ),
    );
  }

  Widget _bodyRegisterFrecScreen({BuildContext context}) {
    return FutureBuilder<Resp>(
      future: getJSONData(),
      builder: (BuildContext context, AsyncSnapshot<Resp> snapshot) {
        if (snapshot.hasData) {
          return CustomDataTable();
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  _alerta(BuildContext context) {
    return Alert(
        type: AlertType.success,
        context: context,
        title: 'Enviado com sucesso!',
        buttons: [
          DialogButton(
            child: Text(
              'ACEITAR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w800
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]).show();
  }
}
