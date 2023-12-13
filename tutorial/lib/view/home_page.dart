import 'package:flutter/material.dart';
import 'package:tutorial/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brasileirao'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext context, int i){
          final tabela = controller.tabela;
          // O Item da tabela vai ser construído a partir do ListTile, que é uma estrutura 
          return ListTile(
            leading: Image.network(tabela[i].brasao),
            title: Text(tabela[i].nome),
            trailing: Text(tabela[i].pontos.toString()),
          );
        }, 
        separatorBuilder: (_, __) => Divider(),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}