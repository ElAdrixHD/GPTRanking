import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVars {
  String get apiUrl => dotenv.env['API_URL'] ?? '';

  String get apiKey => dotenv.env['API_KEY'] ?? '';
}
