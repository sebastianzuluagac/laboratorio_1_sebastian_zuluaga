import 'package:flutter/material.dart';
import 'package:laboratorio_1_sebastian_zuluaga/pages/currency_converter.dart';
import 'package:laboratorio_1_sebastian_zuluaga/pages/grade_calculator.dart';
import 'package:laboratorio_1_sebastian_zuluaga/pages/my_application.dart';
import 'package:laboratorio_1_sebastian_zuluaga/pages/resistor_calculator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laboratorio 1"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/letra-f.png'),
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Selecciona\nuna\naplicación",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text(
                        "Conversor\nde\nmonedas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CurrencyConverter()),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 32.0,
                    ),
                    ElevatedButton(
                      child: const Text(
                        "Conversor\nde\nunidades",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApplication()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text(
                        "Calculadora\nde\nnotas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GradeCalculator()),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 32.0,
                    ),
                    ElevatedButton(
                      child: const Text(
                        "Calculadora \n de \n resistencias",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResistorCalculator()),
                        );
                      },
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
