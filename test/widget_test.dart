import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imc_calculator/main.dart';
import 'package:imc_calculator/core/app_colors.dart';

void main() {
  group('MainApp Widget Tests', () {
    
    // Test básico: verifica que la app se construya sin errores
    testWidgets('MainApp builds without errors', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(const MainApp());
      
      // Assert
      expect(find.byType(MainApp), findsOneWidget);
    });

    // Test del AppBar
    testWidgets('AppBar displays correct title', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(const MainApp());
      
      // Assert
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('IMC calculator'), findsOneWidget);
    });

    // Test del texto en el body
    testWidgets('Body displays hello world text', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(const MainApp());
      
      // Assert
      expect(find.text('Hello World! - loquesea'), findsOneWidget);
    });

    // Test de colores del AppBar
    testWidgets('AppBar has correct background color', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(const MainApp());
      
      // Assert
      final AppBar appBar = tester.widget(find.byType(AppBar));
      expect(appBar.backgroundColor, equals(AppColors.primary));
    });

    // Test de color de fondo del Scaffold
    testWidgets('Scaffold has correct background color', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(const MainApp());
      
      // Assert
      final Scaffold scaffold = tester.widget(find.byType(Scaffold));
      expect(scaffold.backgroundColor, equals(AppColors.background));
    });

    // Test de estructura completa
    testWidgets('App has correct widget structure', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(const MainApp());
      
      // Assert
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(2)); // Título del AppBar + texto del body
    });

    // Test de propiedades del MaterialApp
    testWidgets('MaterialApp has debugShowCheckedModeBanner disabled', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(const MainApp());
      
      // Assert
      final MaterialApp materialApp = tester.widget(find.byType(MaterialApp));
      expect(materialApp.debugShowCheckedModeBanner, isFalse);
    });

    // Test de integración: verifica que el texto sea visible en pantalla
    testWidgets('Hello world text is visible on screen', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(const MainApp());
      
      // Assert
      final textFinder = find.text('Hello World! - loquesea');
      expect(textFinder, findsOneWidget);
      
      // Verifica que el texto esté centrado
      final Center centerWidget = tester.widget(find.byType(Center));
      expect(centerWidget.child, isA<Text>());
    });
  });
}