import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradeCalculator extends StatefulWidget {
  const GradeCalculator({super.key});

  @override
  State<GradeCalculator> createState() => _GradeCalculatorState();
}

class _GradeCalculatorState extends State<GradeCalculator> {
  late final _practices = TextEditingController();
  final _advance1 = TextEditingController();
  final _advance2 = TextEditingController();
  final _final_project = TextEditingController();

  double _nota_final = 0;

  void _showMessage(String msg) {
    setState(() {
      SnackBar snackBar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  String _RangeEvaluate(final _value) {

    setState(() {
      if(_practices.text.isValidNote() && _advance1.text.isValidNote() &&
                _advance2.text.isValidNote() && _final_project.text.isValidNote()){
        _nota_final = (double.parse(_practices.text)*0.6)+
            (double.parse(_advance1.text)*0.1)+
            (double.parse(_advance2.text)*0.1)+
            (double.parse(_final_project.text)*0.2);
      }
      else{
        _showMessage("Por favor ingrese todas las notas");
      }
    });
    //return _value;

    if((double.parse(_value.text)) > 5.0){
      return "5.0";
    }
    else if(double.parse(_value.text) < 0){
      return "0";
    }
    if((_value.text)[0] == '.'){
      return "0";
    }
    else{
      return _value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de notas"),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Calculó de notas curso de programación de dispositivos moviles",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Image(
                  image: AssetImage('assets/images/calificacion.png'),
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _practices,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Practicas de laboratorio (60%)",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNote() ? null : "Nota invalida",
                  onChanged: (text){
                    _practices.text = _RangeEvaluate(_practices);
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _advance1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Primer avance proyecto final (10%)",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNote() ? null : "Nota invalida",
                  onChanged: (text){
                    _advance1.text = _RangeEvaluate(_advance1);
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _advance2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Segundo avance proyecto final (10%)",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNote() ? null : "Nota invalida",
                  onChanged: (text){
                    _advance2.text = _RangeEvaluate(_advance2);
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _final_project,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Entrega proyecto final 20%)",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  value!.isValidNote() ? null : "Nota invalida",
                  onChanged: (text){
                    _final_project.text = _RangeEvaluate(_final_project);
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  "La nota final es ${_nota_final.toStringAsPrecision(3)}",
                  style: const TextStyle(
                    fontSize: 30,
                  ),
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
  bool isValidNote(){
    return RegExp(
        //r'^\s*$|^\d{1, 1}([\,\.]\d{1,2})?$')
      r'^(\s*|([0-4](\.\d{1,2})?|5(\.0{1,2})?))$')
        .hasMatch(this);
  }
}