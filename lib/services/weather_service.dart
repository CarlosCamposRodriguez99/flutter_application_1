// lib/services/weather_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  static const _apiKey = '173d3f176fdb3e71acedcc7a7de04a62';
  static const _baseUrl = 'api.openweathermap.org';
  static const _path    = '/data/2.5/weather';

  Future<Weather> fetchWeatherByCity(String city) async {
    final uri = Uri.https(_baseUrl, _path, {
      'q': city,
      'appid': _apiKey,
      'units': 'metric',
      'lang': 'es',
    });

    // Depuración
    print('🌐 [WeatherService] GET $uri');
    final resp = await http.get(uri);
    print('✅ [WeatherService] status: ${resp.statusCode}');

    if (resp.statusCode == 200) {
      final data = json.decode(resp.body) as Map<String, dynamic>;
      return Weather.fromJson(data);
    } else {
      throw Exception('Error al cargar clima (${resp.statusCode})');
    }
  }
}
