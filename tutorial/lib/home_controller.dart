import 'package:tutorial/models/time.dart';

class HomeController {

  late List<Time> tabela;

  HomeController() {
    tabela = [
      Time(
        nome: 'Flamengo',
        brasao: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Flamengo_braz_logo.svg/1200px-Flamengo_braz_logo.svg.png',
        pontos: 71,
      ),
      Time(
        nome: 'Botafogo',
        brasao: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Botafogo_de_Futebol_e_Regatas_logo.svg/1200px-Botafogo_de_Futebol_e_Regatas_logo.svg.png',
        pontos: 64,
      ),
      Time(
        nome: 'Cruzeiro',
        brasao: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Cruzeiro_Esporte_Clube_%28logo%29.svg/1200px-Cruzeiro_Esporte_Clube_%28logo%29.svg.png',
        pontos: 100,
      )
    ];
  }

}