```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success, parse the JSON response
      final jsonData = jsonDecode(response.body);
      // Access and use the data
      print(jsonData['key']);
    } else {
      // Handle error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions (e.g., network errors)
    print('Error fetching data: $e');
    //In this catch block, rethrow the exception to be handled by a higher-level function or caller.
    rethrow;
  }
}
```