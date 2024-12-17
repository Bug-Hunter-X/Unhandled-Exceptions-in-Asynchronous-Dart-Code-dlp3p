```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException('HTTP request failed with status: ${response.statusCode}', Uri.parse('https://api.example.com/data'), response.body);
    }
  } on SocketException catch (e) {
    throw Exception('No Internet Connection');
  } on FormatException catch (e) {
    throw Exception('Invalid JSON format: $e');
  } on HttpException catch (e) {
    rethrow; //Re-throw HttpException for higher-level handling.
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
}

class HttpException implements Exception {
  final String message;
  final Uri uri;
  final String responseBody;

  HttpException(this.message, this.uri, this.responseBody);

  @override
  String toString() => 'HttpException: $message, URI: $uri, Response Body: $responseBody';
}
```