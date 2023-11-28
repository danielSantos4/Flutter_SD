import 'package:firebase_database/firebase_database.dart';

class Disciplina {
  String nome;
  List<String> alunos = [];
  List<List<String>> dias = [];

  Disciplina(this.nome);
}

class Professor {
  late DatabaseReference ref;
  String nome;
  int ra_professor;
  List<Disciplina> disciplinas = [];

  Professor(this.nome, this.ra_professor) {
    List<Disciplina> disc = [];
    ref = FirebaseDatabase.instance.ref("/$nome");
  }

  Future<bool> setDisciplina(String nomeDisciplina) async {
    await ref.set({nomeDisciplina: []}).then((_) => { return true; });
    return false;
  }

  Future<void> getAllDisciplinas (String nomeDisc) async {}
}
