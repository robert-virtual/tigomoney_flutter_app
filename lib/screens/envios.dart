import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class EnviosScreen extends StatefulWidget {
  const EnviosScreen({Key? key}) : super(key: key);

  @override
  _EnviosScreenState createState() => _EnviosScreenState();
}

class _EnviosScreenState extends State<EnviosScreen> {
  final _identidad = TextEditingController();
  final _monto = TextEditingController();
  final _receptor = TextEditingController();
  final _emisor = TextEditingController();
  final _birthday = TextEditingController();
  String errors = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Envios'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            
          });
          if (_receptor.text.length != 8) {
            errors = "Numero de receptor incompleto";
            return;
          }
          if (_monto.text.length >= 2 && _emisor.text.length == 8 && _identidad.text.length == 13 && _birthday.text.length ==8) {
            await FlutterPhoneDirectCaller.callNumber(
                "*555*2*2*${_receptor.text}*${_monto.text}*${_emisor.text}*${_identidad.text}*${_birthday.text}#");

          } else {
            errors = "Datos incompletos";
            return;
          }
        },
        child: const Icon(Icons.send),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(errors),
              const SizedBox(height: 20.0,),
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
                controller: _emisor,
                maxLength: 8,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // hintText: 'Numbero...'
                    border: const OutlineInputBorder(),
                    labelText: 'Numero Emisor',
                    suffixIcon: IconButton(
                        onPressed: _emisor.clear,
                        icon: const Icon(Icons.clear))),
              ),
              TextFormField(
                controller: _identidad,
                maxLength: 13,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // hintText: 'Numbero...'
                    border: const OutlineInputBorder(),
                    labelText: 'Identidad Emisor',
                    suffixIcon: IconButton(
                        onPressed: _identidad.clear,
                        icon: const Icon(Icons.clear))),
              ),
              TextFormField(
                controller: _birthday,
                maxLength: 8,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // hintText: 'Numbero...'
                    border: const OutlineInputBorder(),
                    labelText: 'Fecha Nacimiento Emisor',
                    hintText: "Ejemplo: 31082000 (DiaMesAño)",
                    suffixIcon: IconButton(
                        onPressed: _birthday.clear,
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
