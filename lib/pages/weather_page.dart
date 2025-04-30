// lib/pages/weather_page.dart

import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  final String city;
  const WeatherPage({super.key, required this.city});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Weather> _weatherFuture;
  final _service = WeatherService();

  @override
  void initState() {
    super.initState();
    print('▶️ [WeatherPage] initState()');
    _weatherFuture = _service.fetchWeatherByCity(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clima en ${widget.city}')),
      body: Center(
        child: FutureBuilder<Weather>(
          future: _weatherFuture,
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snap.hasError) {
              return Text('Error: ${snap.error}');
            } else if (snap.hasData) {
              final w = snap.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://openweathermap.org/img/wn/${w.iconCode}@2x.png',
                  ),
                  Text(
                    '${w.temperature.toStringAsFixed(1)} °C',
                    style: const TextStyle(fontSize: 48),
                  ),
                  Text(
                    w.description,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              );
            } else {
              return const Text('Sin datos disponibles');
            }
          },
        ),
      ),
    );
  }
}
