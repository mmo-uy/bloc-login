// ignore_for_file: prefer_const_constructors
import 'package:flutter_login/login/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const passwordString = 'mock-password';
  group('Password', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final password = Password.pure();
        expect(password.value, '');
        expect(password.isPure, isTrue);
      });

      test('dirty creates correct instance', () {
        final password = Password.dirty(passwordString);
        expect(password.value, passwordString);
        expect(password.isPure, isFalse);
      });
    });

    group('validator', () {
      test('returns empty error when password is empty', () {
        expect(
          Password.dirty().error,
          PasswordValidationError.empty,
        );
      });

      test('is valid when password is not empty', () {
        expect(
          Password.dirty(passwordString).error,
          isNull,
        );
      });
    });
  });
}
