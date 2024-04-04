import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calcular IMC ",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: CalculadoraIMCPage(),
    );
  }
}

class CalculadoraIMC {
  double CalcularIMC(double peso, double altura) {
    return peso / (altura * altura);
  }
}

class CalculadoraIMCPage extends StatefulWidget {
  _CalculadoraIMGPageState createState() => _CalculadoraIMGPageState();
}

class _CalculadoraIMGPageState extends State<CalculadoraIMCPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double resultadoIMC = 0.0;

  void calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0.0;
    double altura = double.tryParse(alturaController.text) ?? 0.0;

    setState(() {
      resultadoIMC = CalculadoraIMC().CalcularIMC(peso, altura);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcular IMC"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //alinha na vertical
          crossAxisAlignment: CrossAxisAlignment.center, //alinha na horizontal
          children: [
            TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Altura(m)")),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Peso(kg)"),
            ),
            ElevatedButton(onPressed: calcularIMC, child: Text("Calcular IMC")),
            Text("Seu IMC é : ${resultadoIMC.toStringAsFixed(2)}")
          ],
        ),
      ),
    );
  }
}
