import 'dart:math';

String? generateRandomCharacters() {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  return List.generate(25, (index) => chars[random.nextInt(chars.length)]).join();
}