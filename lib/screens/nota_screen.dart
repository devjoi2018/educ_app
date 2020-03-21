import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educ_app/datas/aluno_data.dart';
import 'package:flutter/material.dart';

class NotaScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final _formKey = GlobalKey<FormState>();

  NotaScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(snapshot.data["title"]),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("alunos")
            .document("lancarNotas")
            .collection("atributos")
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            List<AlunoData> alunos = [];
            for (DocumentSnapshot doc in snapshot.data.documents) {
              alunos.add(AlunoData.fromDocument(doc));
            }
            return DataTable(
              columns: [
                DataColumn(label: Text('Nome')),
                DataColumn(
                    label: Text(
                  'Matricula',
                  overflow: TextOverflow.ellipsis,
                )),
                DataColumn(label: Text('Notas')),
              ],
              rows: _fillRows(alunos),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black54,
        backgroundColor: Colors.yellow[600],
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Nome do aluno"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),

                          child: TextFormField(),
                        ),

                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Nota"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),

                          child: TextFormField(),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: RaisedButton(
                              child: Text("Submit"),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                }
                              },
                            ))
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  List<DataRow> _fillRows(List<AlunoData> alunos) {
    List<DataRow> linhas = [];
    for (AlunoData aluno in alunos) {
      linhas.add(DataRow(cells: [
        DataCell(
          Text(
            aluno.nome,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataCell(Text(
          aluno.matricula.toString(),
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(Text(
          aluno.notas.join(", "),
          overflow: TextOverflow.ellipsis,
        )),
      ]));
    }
    return linhas;
  }
}
