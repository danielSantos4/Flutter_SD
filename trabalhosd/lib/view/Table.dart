import 'package:flutter/material.dart';
import 'package:trabalhosd/model/Google_S.dart';

class SuaPagina extends StatefulWidget {
  @override
  _SuaPaginaState createState() => _SuaPaginaState();
}

class _SuaPaginaState extends State<SuaPagina> {
  Future<List<List<dynamic>>>? _dados;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    // Substitua este código pelo seu código de busca de dados do Apps Script
    Google_S req = new Google_S();
    _dados = req.getSheet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sua Página'),
        ),
        body: FutureBuilder<List<List<dynamic>>>(
          future: _dados,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar dados'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Sem dados disponíveis'));
            } else {
              // Construa sua tabela ou qualquer componente aqui
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: TabelaDeDados(dados: snapshot.data!),
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.lightBlueAccent,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: 1,
          onTap: (value) {
            if (value == 0) {
              Navigator.pop(context);
            }
            // Respond to item press.
          },
          items: const [
            BottomNavigationBarItem(
              label: ('Chamada'),
              icon: Icon(Icons.calendar_today),
            ),
            BottomNavigationBarItem(
              label: ('Registro'),
              icon: Icon(Icons.description),
            ),
          ],
        ));
  }
}

class TabelaDeDados extends StatelessWidget {
  final List<List<dynamic>> dados;

  TabelaDeDados({required this.dados}) {
    for (var i = 1; i < dados[0].length; i++) {
      var aux = DateTime.parse(dados[0][i]);
      dados[0][i] = '${aux.day}/${aux.month}';
    } /*
    for (var i = 1; i < dados[0].length; i++) {
      int total = 0;
      for (var j = 1; j < dados[i].length; j++) {
        if (dados[i][j] == "") {
          total += 2;
        } else {
          total += int.tryParse(dados[i][j]);
        }
      }
      dados[i].add(total);
      total = 0;
    }*/
    List<List<dynamic>> _dados =
        dados.map((lista) => List.from(lista)).toList();
    for (var i = 1; i < _dados.length; i++) {
      for (var j = 1; j < _dados[i].length; j++) {
        if (_dados[i][j] == "") _dados[i][j] = 2;
      }
    }
    num total = 0;
    for (var i = 1; i < _dados.length; i++) {
      for (var j = 1; j < _dados[i].length; j++) {
        total += _dados[i][j];
      }
      dados[i].add(total);
      total = 0;
    }
    dados[0].add("Faltas");
  }

  @override
  Widget build(BuildContext context) {
    // Aqui você pode construir a tabela usando os dados
    return DataTable(
      columns: dados[0]
          .map((e) => DataColumn(label: Text(e?.toString() ?? '')))
          .toList(),
      rows: List.generate(
        dados.length - 1,
        (index) => DataRow(
          cells: dados[index + 1]
              .map((e) => DataCell(Text(e?.toString() ?? '')))
              .toList(),
        ),
      ),
    );
  }
}