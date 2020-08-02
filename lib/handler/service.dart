import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tvdominicana/handler/model.dart';

Future<List<Canal>> fetchCanal(http.Client client) async {
  final response = await http.get(
    'https://soyaaron.github.io/tvchanneljson/test.json',
  );

  // Use the compute function to run parseCanal in a separate isolate.
  return compute(parseCanal, response.body);
}

// A function that converts a response body into a List<Canal>.
List<Canal> parseCanal(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Canal>((json) => Canal.fromJson(json)).toList();
}
