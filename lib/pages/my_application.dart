import 'dart:math';
import 'package:flutter/material.dart';

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  final _teravalue = TextEditingController();
  final _gigavalue = TextEditingController();
  final _megavalue = TextEditingController();
  final _kilovalue = TextEditingController();
  final _hectovalue = TextEditingController();
  final _dekavalue = TextEditingController();
  final _basevalue = TextEditingController();
  final _decivalue = TextEditingController();
  final _centivalue = TextEditingController();
  final _milivalue = TextEditingController();
  final _microvalue = TextEditingController();
  final _nanovalue = TextEditingController();
  final _picovalue = TextEditingController();

  void _showMessage(String msg) {
    setState(() {
      SnackBar snackBar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void _values_in_zero(int index) {
    setState(() {
      if (index != 0) _teravalue.text = "";
      if (index != 1) _gigavalue.text = "";
      if (index != 2) _megavalue.text = "";
      if (index != 3) _kilovalue.text = "";
      if (index != 4) _hectovalue.text = "";
      if (index != 5) _dekavalue.text = "";
      if (index != 6) _basevalue.text = "";
      if (index != 7) _decivalue.text = "";
      if (index != 8) _centivalue.text = "";
      if (index != 9) _milivalue.text = "";
      if (index != 10) _microvalue.text = "";
      if (index != 11) _nanovalue.text = "";
      if (index != 12) _picovalue.text = "";
    });
  }

  int _index_calculated() {
    if (_teravalue.text.length != 0 && _teravalue.text.isValidNumber())
      return 0;
    else if (_gigavalue.text.length != 0 && _gigavalue.text.isValidNumber())
      return 1;
    else if (_megavalue.text.length != 0 && _megavalue.text.isValidNumber())
      return 2;
    else if (_kilovalue.text.length != 0 && _kilovalue.text.isValidNumber())
      return 3;
    else if (_hectovalue.text.length != 0 && _hectovalue.text.isValidNumber())
      return 4;
    else if (_dekavalue.text.length != 0 && _dekavalue.text.isValidNumber())
      return 5;
    else if (_basevalue.text.length != 0 && _basevalue.text.isValidNumber())
      return 6;
    else if (_decivalue.text.length != 0 && _decivalue.text.isValidNumber())
      return 7;
    else if (_centivalue.text.length != 0 && _centivalue.text.isValidNumber())
      return 8;
    else if (_milivalue.text.length != 0 && _milivalue.text.isValidNumber())
      return 9;
    else if (_microvalue.text.length != 0 && _microvalue.text.isValidNumber())
      return 10;
    else if (_nanovalue.text.length != 0 && _nanovalue.text.isValidNumber())
      return 11;
    else if (_picovalue.text.length != 0 && _picovalue.text.isValidNumber())
      return 12;
    else
      return -1;
  }

  void _calculated_equivalences(int index) {
    setState(() {
      num _exponent = pow(10, -12);
      switch (index) {
        case -1:
          _showMessage("Número invalidó, ¡Verificar!");
          break;
        case 0:
          _exponent = pow(10, -12);
          _basevalue.text =
              (double.parse(_teravalue.text) * (_exponent.toDouble()))
                  .toString();
          break;
        case 1:
          _exponent = pow(10, -9);
          _basevalue.text =
              (double.parse(_gigavalue.text) * (_exponent.toDouble()))
                  .toString();
          break;
        case 2:
          _exponent = pow(10, -6);
          _basevalue.text =
              (double.parse(_megavalue.text) * (_exponent.toDouble()))
                  .toString();
          break;
        case 3:
          _exponent = pow(10, -3);
          _basevalue.text =
              (double.parse(_kilovalue.text) * (_exponent.toDouble()))
                  .toString();
          break;
        case 4:
          _exponent = pow(10, -2);
          _basevalue.text =
              (double.parse(_hectovalue.text) * (_exponent.toDouble()))
                  .toString();
          break;
        case 5:
          _exponent = pow(10, -1);
          _basevalue.text =
              (double.parse(_dekavalue.text) * (_exponent.toDouble()))
                  .toString();
          break;
        case 6:
          _exponent = pow(10, 0);
          _basevalue.text =
              (double.parse(_basevalue.text) * (_exponent.toInt())).toString();
          break;
        case 7:
          _exponent = pow(10, 1);
          _basevalue.text =
              (double.parse(_decivalue.text) * (_exponent.toInt())).toString();
          break;
        case 8:
          _exponent = pow(10, 2);
          _basevalue.text =
              (double.parse(_centivalue.text) * (_exponent.toInt())).toString();
          break;
        case 9:
          _exponent = pow(10, 3);
          _basevalue.text =
              (double.parse(_milivalue.text) * (_exponent.toInt())).toString();
          break;
        case 10:
          _exponent = pow(10, 6);
          _basevalue.text =
              (double.parse(_microvalue.text) * (_exponent.toInt())).toString();
          break;
        case 11:
          _exponent = pow(10, 9);
          _basevalue.text =
              (double.parse(_nanovalue.text) * (_exponent.toInt())).toString();
          break;
        case 12:
          _exponent = pow(10, 12);
          _basevalue.text =
              (double.parse(_picovalue.text) * (_exponent.toInt())).toString();
          break;
      }
      if(index != -1) {
        _exponent = pow(10, 12);
        _teravalue.text =
            (double.parse(_basevalue.text) * (_exponent.toInt())).toString();
        _exponent = pow(10, 9);
        _gigavalue.text =
            (double.parse(_basevalue.text) * (_exponent.toInt())).toString();
        _exponent = pow(10, 6);
        _megavalue.text =
            (double.parse(_basevalue.text) * (_exponent.toInt())).toString();
        _exponent = pow(10, 3);
        _kilovalue.text =
            (double.parse(_basevalue.text) * (_exponent.toInt())).toString();
        _exponent = pow(10, 2);
        _hectovalue.text =
            (double.parse(_basevalue.text) * (_exponent.toInt())).toString();
        _exponent = pow(10, 1);
        _dekavalue.text =
            (double.parse(_basevalue.text) * (_exponent.toInt())).toString();
        _exponent = pow(10, -1);
        _decivalue.text =
            (double.parse(_basevalue.text) * (_exponent.toDouble())).toString();
        _exponent = pow(10, -2);
        _centivalue.text =
            (double.parse(_basevalue.text) * (_exponent.toDouble())).toString();
        _exponent = pow(10, -3);
        _milivalue.text =
            (double.parse(_basevalue.text) * (_exponent.toDouble())).toString();
        _exponent = pow(10, -6);
        _microvalue.text =
            (double.parse(_basevalue.text) * (_exponent.toDouble())).toString();
        _exponent = pow(10, -9);
        _nanovalue.text =
            (double.parse(_basevalue.text) * (_exponent.toDouble())).toString();
        _exponent = pow(10, -12);
        _picovalue.text =
            (double.parse(_basevalue.text) * (_exponent.toDouble())).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de unidades"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/equivalences.jpg'),
                  width: 350,
                  height: 150,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Seleccione el valor conocido, luego en la parte inferior oprima convertir",
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _teravalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en Teras 1e+12",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(0);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _gigavalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en Gigas 1e+9",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(1);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _megavalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en Megas 1e+6",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(2);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _kilovalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en Kilo 1e+3",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(3);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _hectovalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en Hecto 1e+2",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(4);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _dekavalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en Deka 1+e1",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(5);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _basevalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en base 10",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(6);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _decivalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en deci 1e-1",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(7);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _centivalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en centi 1e-2",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(8);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _milivalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en mili 1e-3",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(9);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _microvalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en micro 1e-6",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(10);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _nanovalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en nano 1e-9",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(11);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _picovalue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Valor en pico 1e-12",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNumber() ? null : "Número invalido",
                  onChanged: (text) {
                    _values_in_zero(12);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    _calculated_equivalences(_index_calculated());
                  },
                  child: const Text("Convertir"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on String {
  bool isValidNumber() {
    return RegExp(r'^\s*$|^\d{1,50}([\,\.]\d{1,50})?([eE][+-]?\d{1,50})?$').hasMatch(this);
  }
}
