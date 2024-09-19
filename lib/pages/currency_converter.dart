import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final _dolar_value = TextEditingController();
  final _euro_value = TextEditingController();
  final _cop_value = TextEditingController();
  final _bitcoin_value = TextEditingController();

  void _dolar_exchange(){
    setState(() {
      if(_dolar_value.text.isValidNumber()) {
        _euro_value.text = "${double.parse(_dolar_value.text) * 1.21}";
        _cop_value.text = "${double.parse(_dolar_value.text) * 4180.68}";
      }
      else{
        _euro_value.text = "";
        _cop_value.text = "";
      }
    });
  }

  void _euro_exchange(){
    setState(() {
      if(_euro_value.text.isValidNumber()) {
        _dolar_value.text = "${double.parse(_euro_value.text) * 1.1}";
        _cop_value.text = "${double.parse(_euro_value.text) * 4612.76}";
      }
      else{
        _dolar_value.text = "";
        _cop_value.text = "";
      }
    });
  }

  void _cop_exchange(){
    setState(() {
      if(_cop_value.text.isValidNumber()) {
        _euro_value.text = "${double.parse(_cop_value.text) * 0.00022}";
        _dolar_value.text = "${double.parse(_cop_value.text) * 0.00024}";
      }
      else{
        _dolar_value.text = "";
        _euro_value.text = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de monedas"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/money_converter.png'),
                  width: 250,
                  height: 250,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/estados-unidos-de-america.png'),
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    const Text("Dolares"),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _dolar_value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "USD",
                          prefixIcon: Icon(Icons.currency_exchange),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                        value!.isValidNumber() ? null : "Número invalido",
                        onChanged: (text){
                          _dolar_exchange();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/union-europea.png'),
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    const Text("Euros"),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _euro_value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "EUR",
                          prefixIcon: Icon(Icons.euro),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                        value!.isValidNumber() ? null : "Número invalido",
                        onChanged: (text){
                          _euro_exchange();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/circulo.png'),
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    const Text(
                      "Pesos\nColombianos",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _cop_value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "COP",
                          prefixIcon: Icon(Icons.currency_exchange),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                        value!.isValidNumber() ? null : "Número invalido",
                        onChanged: (text){
                          _cop_exchange();
                        },
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

extension on String {
  bool isValidNumber(){
    return RegExp(
        r'^\s*$|^\d{1,50}([\,\.]\d{1,50})?([eE][+-]?\d{1,50})?$')
        .hasMatch(this);
    }
}