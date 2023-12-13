import 'dart:convert';

import 'package:http/http.dart' as http;

class Google_S {
  final url =
      "https://script.google.com/macros/s/AKfycbxuNDw5dVkp-AgoSk74PmX_dFgAFBYGPhRuSD8DQ7OcIAHXxsTdcBOf20ZUJAt4SqEF/exec";

  Future<void> addNewDay() async {
    var func = "addNewDay";

    final answer = await http.get(Uri.parse("$url?func=$func"));
    //print('$url?function=$func');
    print(answer.statusCode);
  }

  Future<void> givePresence(register) async {
    final func = "givePresence";

    final answer =
        await http.get(Uri.parse("$url?func=$func&register=$register"));

    print(answer.statusCode);
  }

  Future<void> countPresence(register) async {
    final func = "countPresence";

    final answer =
        await http.get(Uri.parse("$url?func=$func&register=$register"));

    print(answer.statusCode);
  }

  Future<void> addNewStudent(register) async {
    final func = "addNewStudent";

    final answer =
        await http.get(Uri.parse("$url?func=$func&register=$register"));

    print(answer.statusCode);
  }

  Future<List<List<dynamic>>> getSheet() async {
    print("getSheet");
    final func = "getSheet";
    final answer = await http.get(Uri.parse("$url?func=$func"));
    print(answer.body);

    if (answer.statusCode == 200) {
      List<List<dynamic>> data =
          List<List<dynamic>>.from(json.decode(answer.body));

      /*
      for (var i in data) {
        print(i);
      }*/
      return data;
    }
    List<List<dynamic>> lista = [];
    return lista;
  }
}
