// lib/main.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';  // << añade esto
import 'firebase_options.dart';
import 'pages/weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('✅ Firebase inicializado correctamente');

  // Prueba rápida de Firestore
  final db = FirebaseFirestore.instance;
  db.collection('test_inicializacion')
    .add({'timestamp': Timestamp.now()})
    .then((_) => print('✅ Documento de prueba agregado a Firestore'))
    .catchError((e) => print('❌ Error al agregar doc: $e'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Prueba Clima + Firebase',
      debugShowCheckedModeBanner: false,
      home: WeatherPage(city: 'Mexico City'),
    );
  }
}
