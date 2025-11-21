import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/functions/kelvin_to_celsius.dart';

void main() {
  group('Kelvin to celsuis Function', () {
    test('converts kelvin to celsius correctly (simple case)', () {
      expect(kelvinToCelsius(273.15), '0.0');
    });

    test('handles decimal values', () {
      expect(kelvinToCelsius(300.0), '26.9');
      // 300 - 273.15 = 26.85 → rounded to 26.9
    });

    test('handles very large values', () {
      expect(kelvinToCelsius(500.0), '226.9');
    });

    test('handles below freezing', () {
      expect(kelvinToCelsius(250.0), '-23.1');
    });

    test('works with extreme edge case of zero kelvin', () {
      expect(kelvinToCelsius(0.0), '-273.1');
    });
  });
}
