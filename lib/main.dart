import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LDSW - Actividad Widgets',
      home: Scaffold(
        appBar: AppBar(
          title: Text('LDSW - Actividad'),
        ),
        body: Center(
          // Container para aplicar márgenes, padding y decoración
          child: Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8.0),
            ),
            // Stack permite superponer widgets
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // Posicionamos un Text en la esquina superior derecha
                Positioned(
                  top: 10,
                  right: 10,
                  child: Text(
                    'Texto en Stack',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
                // Column organiza los widgets de manera vertical
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Widget Text principal
                    Text(
                      'Hello World',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    // Row organiza widgets horizontalmente
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Container 1 dentro de la Row
                        Container(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.red[200],
                          child: Text('Contenedor 1'),
                        ),
                        // Container 2 dentro de la Row
                        Container(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.green[200],
                          child: Text('Contenedor 2'),
                        ),
                      ],
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
