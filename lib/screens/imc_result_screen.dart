import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;

  const ImcResultScreen({
    super.key,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    double calcularIMC(double height, int weight) {
      double heightInMeters = height / 100;
      double alturaAlCuadrado = heightInMeters * heightInMeters;
      double calculoIMC = weight / alturaAlCuadrado;
      return calculoIMC;
    }

    double resultadoIMC = calcularIMC(height, weight);

    String obtenerCategoria(double imc) {
      if (imc < 18.5) {
        return "Bajo peso";
      } else if (imc < 25) {
        return "Peso Normal";
      } else if (imc < 30) {
        return "Sobrepeso";
      } else {
        return "Obesidad";
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Resultado IMC")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            "Tu IMC es: ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            resultadoIMC.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: AppColors.accent,
            ),
          ),
          SizedBox(height: 20),
          Text(
            obtenerCategoria(resultadoIMC),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 40),
          Text("Altura: ${height.toStringAsFixed(0)} cm"),
          Text("Peso: $weight kg"),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Calcular de nuevo"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
