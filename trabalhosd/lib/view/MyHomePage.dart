import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:trabalhosd/model/Google_S.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String ticket = '';

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.BARCODE,
    );
    setState(() => ticket = code.length == 9 ? code : '-1');
    if (ticket != '-1') {
      Google_S requisition = new Google_S();
      await requisition.addNewDay();
      await requisition.givePresence(ticket);
    }
  }

  adicionarAluco() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.BARCODE,
    );
    setState(() => ticket = code.length == 9 ? code : '-1');
    if (ticket != '-1') {
      Google_S requisition = new Google_S();
      await requisition.addNewStudent(ticket);
    }
  }

  String toParams() => "?registro=$ticket";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bem vindo'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (ticket != '')
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Ticket: $ticket',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ElevatedButton.icon(
              onPressed: readQRCode,
              icon: const Icon(
                Icons.qr_code,
                size: 30,
              ),
              label: const Text(
                'Dar Presença',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton.icon(
              onPressed: adicionarAluco,
              icon: const Icon(
                Icons.qr_code,
                size: 30,
              ),
              label: const Text(
                'Adicionar Aluno',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
