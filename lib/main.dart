import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Nombre de la aplicación (puedes modificarlo si gustas)
  final String appName = 'Bienvenido, Luis';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: Scaffold(
        // Quitamos appBar si deseas pantalla completa. 
        // Puedes dejarla si necesitas un título fijo en la parte superior.
        body: Container(
          // DECORACIÓN: imagen de fondo
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fondo.jpg'), // Ajusta la ruta a tu imagen
              fit: BoxFit.cover,
            ),
          ),
          // Este color semi-transparente se puede usar para oscurecer o aclarar la imagen
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/fondo.jpg'),
          //     fit: BoxFit.cover,
          //     colorFilter: ColorFilter.mode(
          //       Colors.black.withOpacity(0.3),
          //       BlendMode.darken,
          //     ),
          //   ),
          // ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Ícono de tu elección (puedes cambiar el icono, el tamaño y color)
                Icon(
                  Icons.android,
                  size: 80.0,
                  color: Colors.white,
                ),
                SizedBox(height: 20.0),
                // Nombre de la aplicación
                Text(
                  appName,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                // Mensaje principal
                Text(
                  'Movies Night',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white54,
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
