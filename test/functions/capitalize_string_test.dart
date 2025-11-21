import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/functions/capitalize_string.dart';

void main() {
  group('Capitalize String Function', () {
    test('returns empty string when input is empty', () {
      expect(capitalizeString(''), '');
    });

    test('capitalizes first letter of a lowercase word', () {
      expect(capitalizeString('hello'), 'Hello');
    });

    test('keeps the rest of the string unchanged', () {
      expect(capitalizeString('hello world'), 'Hello world');
    });

    test('returns same string if already capitalized', () {
      expect(capitalizeString('Hello'), 'Hello');
    });

    test('works with one-character strings', () {
      expect(capitalizeString('a'), 'A');
    });

    test('does not modify numbers or symbols', () {
      expect(capitalizeString('123abc'), '123abc');
      expect(capitalizeString('@tag'), '@tag');
    });
  });
}
