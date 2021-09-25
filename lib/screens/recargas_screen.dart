import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class RecargasScreen extends StatefulWidget {
  const RecargasScreen({Key? key}) : super(key: key);

  @override
  _RecargasScreenState createState() => _RecargasScreenState();
}

class _RecargasScreenState extends State<RecargasScreen> {
  // props
  final _identidad = TextEditingController();
  final _monto = TextEditingController();
  final _receptor = TextEditingController();

  // methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recargas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FlutterPhoneDirectCaller.callNumber(
              "*555*2*1*${_receptor.text}*${_identidad.text}*${_monto.text}#");
        },
        child: const Icon(Icons.send),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _receptor,
                maxLength: 8,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // hintText: 'Numbero...'
                    border: const OutlineInputBorder(),
                    labelText: 'Numero Receptor',
                    suffixIcon: IconButton(
                        onPressed: _receptor.clear,
                        icon: const Icon(Icons.clear))),
              ),
              TextFormField(
                controller: _identidad,
                maxLength: 13,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // hintText: 'Numbero...'
                    border: const OutlineInputBorder(),
                    labelText: 'Identidad',
                    suffixIcon: IconButton(
                        onPressed: _identidad.clear,
                        icon: const Icon(Icons.clear))),
              ),
              TextFormField(
                controller: _monto,
                maxLength: 5,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // hintText: 'Numbero...'
                    border: const OutlineInputBorder(),
                    labelText: 'Monto',
                    suffixIcon: IconButton(
                        onPressed: _monto.clear,
                        icon: const Icon(Icons.clear))),
              ),
              // ElevatedButton(
              //     onPressed: () async {
              //       await FlutterPhoneDirectCaller.callNumber(_receptor.text);
              //     },
              //     child: const Text('Enviar'))
            ],
          ),
        ),
      ),
    );
  }
}
