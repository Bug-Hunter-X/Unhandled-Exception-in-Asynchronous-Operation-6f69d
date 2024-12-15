```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data')).catchError((error) {
      // Handle errors during the HTTP request
      print('HTTP request error: $error');
      // Return a default value or throw a custom exception
      return null; // or throw Exception('HTTP Request Failed');
    });
    if (response != null && response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
    } else {
      // Handle cases where response is null or has non-200 status code
      print('Invalid or missing response.');
    }
  } catch (e) {
    // Handle exceptions that occur after the HTTP request
    print('Error: $e');
    // Consider logging the error to a monitoring service for better diagnostics
  }
}
```