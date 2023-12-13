# Flutter_SD
Projeto final da matéria de Sistemas Distribuidos.
Consiste em um aplicativo de presença, em que o celular vai ler um código de barras da identificação do aluno e sua presença será verificada. Além da verificação da presença é possível adicionar um novo aluno pelo aplicativo. As presenças são salvas em uma planilha do Google, Google Sheets, em que é possível ver a matrícula do aluno e os dias em que ele esteve presente.

## Membros do grupo:
- Daniel Messias Santos **(202110168)**
- Luiz Filipe Bartelega Penha **(202111082)**
- Vitor Pires Zini **(202110189)**

## Tecnologias utilizadas:
- Flutter
- Javascript
- Google Sheets

## Arquitetura de Sistema
  Arquitetura de Centralizada Cliente Servidor.

  Cliente lê o código de barras.

  API recebe a requisição e realiza as modificações no Google Sheets.
  
  ![Arquitetura de sistema](imagens-readme/arquiteturaSistemas.jpg)

## Arquitetura de Software
  Em nosso sistema foi utilizado a arquitetura de software MVC (Model, View, Controller)

  ![Arquitetura de software](imagens-readme/arquiteturaSoftware.png)

  ## Tutorial
  - Após a instalação de tudo que é necessário para ter o Flutter em sua máquina e verificação para ver se está tudo certo utilizando o comando flutter doctor, vamos iniciar o nosso tutorial.
    
  ***1. Iniciando um projeto Flutter.***  
    Para iniciar um novo projeto vá para o diretório de deseja iniciar o projeto e abra o terminal. Com o terminal aberto digite o comando flutter create para iniciar um novo projeto.

  ```sh
  flutter create tutorial
  ```
  ***2. Apague o projeto de exemplo.***  
  Você pode utilizar este projeto para inicializá-lo e testar para ver se está tudo funcionando corretamente. No entanto vamos apagá-lo para fazer o nosso.  
  Para isso deixa o arquivo main.dart apenas com a função void main().

  ```sh
  import 'package:flutter/material.dart';

  void main() {
    runApp(MeuAplicativo());
  }
  ```
  
  
***3. Setup da tela inicial***
```sh
import 'package:flutter/material.dart';
import 'package:tutorial/view/home_page.dart';

void main() {
  runApp(MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Brasileirao",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomePage(),
    );
  }
}
```

 ***4. Criando a tela inicial***
```sh
  import 'package:flutter/material.dart';
  
  class HomePage extends StatelessWidget {
    const HomePage({super.key});
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Text("Olá ALUNOS", style: TextStyle(
            fontSize: 30,
          ),), 
        ),
      );
    }
  }
```
