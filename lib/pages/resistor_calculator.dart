import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class ResistorCalculator extends StatefulWidget {
  const ResistorCalculator({super.key});

  @override
  State<ResistorCalculator> createState() => _ResistorCalculatorState();
}

const List<String> _bandas = <String>['Negro = 0', 'Marron = 1', 'Rojo = 2', 'Naranja = 3',
            'Amarillo = 4', 'Verde = 5', 'Azul = 6', 'Purpura = 7', 'Gris = 8', 'Blanco = 9'];
const List<String> _tolerance = <String>['Marron = 1%', 'Rojo = 2%', 'Dorado = 5%', 'Plateado = 10%'];

class _ResistorCalculatorState extends State<ResistorCalculator> {
  String dropdown1Value = _bandas.first;
  String dropdown2Value = _bandas.first;
  String dropdown3Value = _bandas.first;
  String dropdown4Value = _tolerance.first;

  int _resistor_value = 0;
  int _tolerance_value = 1;

  void _calculated_resistor(){
    setState(() {
      int _banda1 = _bandas.indexOf(dropdown1Value, 0);
      int _banda2 = _bandas.indexOf(dropdown2Value, 0);
      int _banda3 = _bandas.indexOf(dropdown3Value, 0);
      num _multiplier = pow(10, _banda3);
      _resistor_value = (_banda1*10+_banda2)*(_multiplier.toInt());

      int _tolerance_index = _tolerance.indexOf(dropdown4Value, 0);
      switch(_tolerance_index){
        case 0:
          _tolerance_value = 1;
          break;
        case 1:
          _tolerance_value = 2;
          break;
        case 2:
          _tolerance_value = 5;
          break;
        case 3:
          _tolerance_value = 10;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de resistencias"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/Colores-bandas-resistencias.png'),
                  width: 300,
                  height: 300,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Color 1a Cifra",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(15),
                      alignment: Alignment.center,
                      value: dropdown1Value,
                      items: _bandas.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          dropdown1Value =value!;
                          _calculated_resistor();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Color 2a Cifra",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(15),
                      alignment: Alignment.center,
                      value: dropdown2Value,
                      items: _bandas.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          dropdown2Value =value!;
                          _calculated_resistor();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Color Multiplicador",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(15),
                      alignment: Alignment.center,
                      value: dropdown3Value,
                      items: _bandas.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          dropdown3Value =value!;
                          _calculated_resistor();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Color Tolerancia",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(15),
                      alignment: Alignment.center,
                      value: dropdown4Value,
                      items: _tolerance.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          dropdown4Value =value!;
                          _calculated_resistor();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "El valor de la resistencia es de:\n${_resistor_value} ohmios\ncon una tolerancia del $_tolerance_value %",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
