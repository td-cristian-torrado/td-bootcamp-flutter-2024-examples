import 'dart:math';
import 'dart:ui';

String generateRandomString() {
    const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random random = Random();
    return List.generate(Random() 
      .nextInt(50), 
      (index) => chars[random.nextInt(chars.length)])
      .join();
}

Color generateRandomColors() {
    const List<Color> colorList = [
      Color(0xFFFD99FF), 
      Color.fromARGB(255, 30, 26, 26), 
      Color(0xFF91F48F), 
      Color(0xFFFFF599), 
      Color(0XFF9EFFFF), 
      Color(0XFFB69CFF) ];
    final Random random = Random();
    return colorList[random.nextInt(6)];
}

