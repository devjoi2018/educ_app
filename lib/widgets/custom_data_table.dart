import 'package:flutter/material.dart';

/// Dibuja un data table personalizado con checkbox independientes
class CustomDataTable extends StatefulWidget {
  @override
  _CustomDataTableState createState() => new _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  Map<String, dynamic> _listaFechas = {
    'dia1': '01/02/2020',
    'dia2': '02/02/2020',
    'dia3': '03/02/2020',
    'dia4': '04/02/2020',
    'dia5': '05/02/2020',
    'dia6': '06/02/2020',
    'dia7': '07/02/2020',
    'dia8': '08/02/2020',
    'dia9': '09/02/2020',
    'dia10': '10/02/2020',
    'dia11': '11/02/2020',
    'dia12': '12/02/2020',
    'dia13': '13/02/2020',
    'dia14': '14/02/2020',
    'dia15': '15/02/2020',
    'dia16': '16/02/2020',
    'dia17': '17/02/2020',
    'dia18': '18/02/2020',
    'dia19': '19/02/2020',
    'dia20': '20/02/2020',
    'dia21': '21/02/2020',
    'dia22': '22/02/2020',
    'dia23': '23/02/2020',
    'dia24': '24/02/2020',
    'dia25': '25/02/2020',
    'dia26': '26/02/2020',
    'dia27': '27/02/2020',
    'dia28': '28/02/2020',
    'dia29': '29/02/2020',
    'dia30': '30/02/2020',
    'dia31': '31/02/2020',
  };

  Map<String, dynamic> _listTitle = {
    'title1': 'Fechas',
    'title2': 'Danilo',
    'title3': 'Andres',
    'title4': 'Rogelio',
    'title5': 'Maria',
    'title6': 'Pedro',
    'title7': 'Juan',
  };

  Map<String, bool> _mapaDanilo = {
    'box1': false,
    'box2': false,
    'box3': false,
    'box4': false,
    'box5': false,
    'box6': false,
    'box7': false,
    'box8': false,
    'box9': false,
    'box10': false,
    'box11': false,
    'box12': false,
    'box13': false,
    'box14': false,
    'box15': false,
    'box16': false,
    'box17': false,
    'box18': false,
    'box19': false,
    'box20': false,
    'box21': false,
    'box22': false,
    'box23': false,
    'box24': false,
    'box25': false,
    'box26': false,
    'box27': false,
    'box28': false,
    'box29': false,
    'box30': false,
    'box31': false,
  };
  Map<String, bool> _mapaAndres = {
    'box1': false,
    'box2': false,
    'box3': false,
    'box4': false,
    'box5': false,
    'box6': false,
    'box7': false,
    'box8': false,
    'box9': false,
    'box10': false,
    'box11': false,
    'box12': false,
    'box13': false,
    'box14': false,
    'box15': false,
    'box16': false,
    'box17': false,
    'box18': false,
    'box19': false,
    'box20': false,
    'box21': false,
    'box22': false,
    'box23': false,
    'box24': false,
    'box25': false,
    'box26': false,
    'box27': false,
    'box28': false,
    'box29': false,
    'box30': false,
    'box31': false,
  };
  Map<String, bool> _mapaRogelio = {
    'box1': false,
    'box2': false,
    'box3': false,
    'box4': false,
    'box5': false,
    'box6': false,
    'box7': false,
    'box8': false,
    'box9': false,
    'box10': false,
    'box11': false,
    'box12': false,
    'box13': false,
    'box14': false,
    'box15': false,
    'box16': false,
    'box17': false,
    'box18': false,
    'box19': false,
    'box20': false,
    'box21': false,
    'box22': false,
    'box23': false,
    'box24': false,
    'box25': false,
    'box26': false,
    'box27': false,
    'box28': false,
    'box29': false,
    'box30': false,
    'box31': false,
  };
  Map<String, bool> _mapaMaria = {
    'box1': false,
    'box2': false,
    'box3': false,
    'box4': false,
    'box5': false,
    'box6': false,
    'box7': false,
    'box8': false,
    'box9': false,
    'box10': false,
    'box11': false,
    'box12': false,
    'box13': false,
    'box14': false,
    'box15': false,
    'box16': false,
    'box17': false,
    'box18': false,
    'box19': false,
    'box20': false,
    'box21': false,
    'box22': false,
    'box23': false,
    'box24': false,
    'box25': false,
    'box26': false,
    'box27': false,
    'box28': false,
    'box29': false,
    'box30': false,
    'box31': false,
  };
  Map<String, bool> _mapaPedro = {
    'box1': false,
    'box2': false,
    'box3': false,
    'box4': false,
    'box5': false,
    'box6': false,
    'box7': false,
    'box8': false,
    'box9': false,
    'box10': false,
    'box11': false,
    'box12': false,
    'box13': false,
    'box14': false,
    'box15': false,
    'box16': false,
    'box17': false,
    'box18': false,
    'box19': false,
    'box20': false,
    'box21': false,
    'box22': false,
    'box23': false,
    'box24': false,
    'box25': false,
    'box26': false,
    'box27': false,
    'box28': false,
    'box29': false,
    'box30': false,
    'box31': false,
  };
  Map<String, bool> _mapaJuan = {
    'box1': false,
    'box2': false,
    'box3': false,
    'box4': false,
    'box5': false,
    'box6': false,
    'box7': false,
    'box8': false,
    'box9': false,
    'box10': false,
    'box11': false,
    'box12': false,
    'box13': false,
    'box14': false,
    'box15': false,
    'box16': false,
    'box17': false,
    'box18': false,
    'box19': false,
    'box20': false,
    'box21': false,
    'box22': false,
    'box23': false,
    'box24': false,
    'box25': false,
    'box26': false,
    'box27': false,
    'box28': false,
    'box29': false,
    'box30': false,
    'box31': false,
  };

  @override
  Widget build(BuildContext context) {
    final _anchoContainer = 110.0;
    final _altoContainer = 50.0;
    BoxDecoration _decoration = BoxDecoration(
      border: Border.all(
        width: 0.5,
        color: Colors.black54,
      ),
    );
    TextStyle _tituloFecha = TextStyle(
      color: Colors.black54,
      fontSize: 18.0,
      fontWeight: FontWeight.w900,
    );

    Widget _checkBox(String key, Map mapa) {
      return GestureDetector(
        child: mapa[key] == false
            ? Icon(
                Icons.check_box_outline_blank,
                size: 25.0,
              )
            : Container(
                width: 19.0,
                height: 19.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.7,
                  ),
                ),
                child: Center(
                  child: Text(
                    'F',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
        onTap: () {
          setState(() {
            mapa[key] = true;
          });
        },
        onDoubleTap: () {
          setState(() {
            mapa[key] = false;
          });
        },
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: _listTitle.keys.map((key) {
                return Container(
                  decoration: _decoration,
                  width: _anchoContainer,
                  height: _altoContainer,
                  child: Center(
                    child: Text(
                      _listTitle[key],
                      style: _tituloFecha,
                    ),
                  ),
                );
              }).toList(),
            ),
            Row(
              children: <Widget>[
                Column(
                  children: _listaFechas.keys.map((key) {
                    return Container(
                      decoration: _decoration,
                      width: _anchoContainer,
                      height: _altoContainer,
                      child: Center(
                        child: Text(
                          _listaFechas[key],
                          style: _tituloFecha,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: _mapaDanilo.keys.map((key) {
                    return Container(
                      decoration: _decoration,
                      width: _anchoContainer,
                      height: _altoContainer,
                      child: Center(
                        child: _checkBox(key, _mapaDanilo),
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: _mapaAndres.keys.map((key) {
                    return Container(
                      decoration: _decoration,
                      width: _anchoContainer,
                      height: _altoContainer,
                      child: Center(
                        child: _checkBox(key, _mapaAndres),
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: _mapaRogelio.keys.map((key) {
                    return Container(
                      decoration: _decoration,
                      width: _anchoContainer,
                      height: _altoContainer,
                      child: Center(
                        child: _checkBox(key, _mapaRogelio),
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: _mapaMaria.keys.map((key) {
                    return Container(
                      decoration: _decoration,
                      width: _anchoContainer,
                      height: _altoContainer,
                      child: Center(
                        child: _checkBox(key, _mapaMaria),
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: _mapaPedro.keys.map((key) {
                    return Container(
                      decoration: _decoration,
                      width: _anchoContainer,
                      height: _altoContainer,
                      child: Center(
                        child: _checkBox(key, _mapaPedro),
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: _mapaJuan.keys.map((key) {
                    return Container(
                      decoration: _decoration,
                      width: _anchoContainer,
                      height: _altoContainer,
                      child: Center(
                        child: _checkBox(key, _mapaJuan),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
