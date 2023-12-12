import 'package:http/http.dart' as http;

class Google_S {
  final url =
      "https://script.google.com/macros/s/AKfycbycCuBUzt1FU1aQinBrFYT7Npk5cPhdyjZ0ixg05pna2VgZgdSM0noJ6xo6gC_1Y37t/exec";

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
}
