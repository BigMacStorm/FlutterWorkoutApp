import 'dart:math' show Random;

class Uuid {
  final Random _random = new Random();

  /// Generate a version 4 (random) UUID. This is a UUID scheme that only uses
  /// random numbers as the source of the generated UUID.
  String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final int special = 8 + _random.nextInt(4);

    return
      '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
          '${_bitsDigits(16, 4)}-'
          '4${_bitsDigits(12, 3)}-'
          '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
          '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');
}