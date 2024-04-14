import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ranking_app/setup.dart';

void main() async {
  await dotenv.load();
  startApp();
}
