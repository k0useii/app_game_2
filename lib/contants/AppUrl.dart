// ignore_for_file: file_names

class AppUrl {
  AppUrl._();
  static const String baseUrl = 'http://10.0.2.2:5000'; // For Android Emulator
  //static const String baseUrl = 'http://127.0.0.1:5000'; // For Web

  // receiveTimeout
  static const Duration receiveTimeout = Duration(milliseconds: 15000);

  // connectTimeout
  static const Duration connectionTimeout = Duration(milliseconds: 15000);

  // image url
  static const String imageUrl = 'assets/images/';
}