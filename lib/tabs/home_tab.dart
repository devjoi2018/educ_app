import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educ_app/models/user.dart';
import 'package:educ_app/screens/aluno_frequencia_screen.dart';
import 'package:educ_app/screens/registrar_frecuencia_Screen.dart';
import 'package:educ_app/widgets/custom_drawer.dart';
import 'package:educ_app/widgets/screen_arguments.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:educ_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:horizontal_data_table/horizontal_data_table.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  Resp resp;

  bool hasData = false;
  final storage = new FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    getJSONData();
  }

  lerToken() async {
    String s = await storage.read(key: "protectToken");
    return s;
  }

  Future<Resp> getJSONData() async {
    var token = await lerToken();
    //var teste = token.replaceAll(new RegExp('""'),'');
    print(token);

    var response = await http.get(
        Uri.encodeFull(
            "http://treinamento.educ.ifrn.edu.br/api/educ/diario/meus_diarios/"),
        headers: {
          "Authorization": "Token dfba99dbad894452f843d1af00ffbcd559c63e59"
        });
    // headers: {"Authorization": "Token ${token}"});

    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    Map userMap = jsonDecode(response.body);
    resp = Resp.fromJson(userMap["result"][0]);
    print(resp.componente.text);

    // Map userMap = jsonDecode(response.body);
    //hasData = true;
    return resp = Resp.fromJson(userMap["result"][0]);

    //  List<User> users = userMap['result'].map<User>((json)=>
    //     User.fromJson(json),
    //  ).toList();
    // print(users.toString());
  }

  final _pageController = PageController(); // Controlar a PageView

  // Trabalhando o Degrade do app
  Widget _buildBodyBack() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 51, 55, 232),
          Color.fromARGB(255, 56, 113, 255),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      );

  @override
  Widget build(BuildContext context) {
    // stack para quando quer escrever algo em cima de um fundo

    final _widthContainer = 150.0;
    final _padding = 8.0;
    TextStyle _textStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w900,
      color: Colors.black87,
    );

//final List<String> dataJson = ['a','b','c','d','e','f', 'g' ];
    return FutureBuilder<Resp>(
      future: getJSONData(),
      builder: (BuildContext context, AsyncSnapshot<Resp> snapshot) {
        if (snapshot.hasData) {
          return HorizontalDataTable(
            leftHandSideColumnWidth: 100,
            rightHandSideColumnWidth: 1050,
            isFixedHeader: true,
            headerWidgets: [
              Container(
                padding: EdgeInsets.all(_padding),
                width: _widthContainer,
                child: Center(
                  child: Text(
                    'ID',
                    style: _textStyle,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(_padding),
                width: _widthContainer,
                child: Center(
                  child: Text(
                    'Componente',
                    style: _textStyle,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(_padding),
                width: _widthContainer,
                child: Center(
                  child: Text(
                    'Profesor',
                    style: _textStyle,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(_padding),
                width: _widthContainer,
                child: Center(
                  child: Text(
                    'Frecuencia',
                    style: _textStyle,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(_padding),
                width: _widthContainer,
                child: Center(
                  child: Text(
                    'Nota',
                    style: _textStyle,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(_padding),
                width: _widthContainer,
                child: Center(
                  child: Text(
                    'Cantidad Alumnos',
                    style: _textStyle,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(_padding),
                width: _widthContainer,
                child: Center(
                  child: Text(
                    'Sala',
                    style: _textStyle,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(_padding),
                width: _widthContainer,
                child: Center(
                  child: Text(
                    'Turma',
                    style: _textStyle,
                  ),
                ),
              ),
            ],
            leftSideItemBuilder: (BuildContext contex, index) {
              return Container(
                color: index % 2 == 0 ? Colors.black12 : Colors.white,
                padding: EdgeInsets.all(14.5),
                width: _widthContainer,
                child: Center(
                  child: Text(
                    index.toString(),
                    style: _textStyle,
                  ),
                ),
              );
            },
            rightSideItemBuilder: (BuildContext contex, index) {
              return Container(
                color: index % 2 == 0 ? Colors.black12 : Colors.white,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(_padding),
                        width: _widthContainer,
                        child: Center(
                          child: Text(
                            resp.componente.text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, RegistrarFrecuenciaScreen.routeName, arguments: ScreenArguments(index));
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(_padding),
                      width: _widthContainer,
                      child: Center(
                        child: Text(
                          resp.professor.text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(_padding),
                      width: _widthContainer,
                      child: Center(
                        child: Text(
                          resp.percentualLancamentoFrequencia.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(_padding),
                      width: _widthContainer,
                      child: Center(
                        child: Text(
                          resp.percentualLancamentoNotas.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(_padding),
                      width: _widthContainer,
                      child: Center(
                        child: Text(
                          resp.qtdAlunos.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(_padding),
                      width: _widthContainer,
                      child: Center(
                        child: Text(
                          resp.sala.text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(_padding),
                      width: _widthContainer,
                      child: Center(
                        child: Text(
                          resp.turma.text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: snapshot.data.componente.id,
            rowSeparatorWidget: const Divider(
              color: Colors.black54,
              height: 1.0,
              thickness: 0.0,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}