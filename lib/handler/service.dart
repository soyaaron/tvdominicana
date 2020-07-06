import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:tvdominicana/handler/model.dart';
import 'package:tvdominicana/home2.dart';

// Future<List<Canal>> fetchCanal(http.Client client) async {
//   final response =
//       await client.get('assets/test.json');

//   // Use the compute function to run parseCanal in a separate isolate.
//   return compute(parseCanal, response.body);
// }

// // A function that converts a response body into a List<Canal>.
// List<Canal> parseCanal(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Canal>((json) => Canal.fromJson(json)).toList();
// }

Future<List<Canal>>fetchCanal() async {
  return await rootBundle.loadString('assets/test.json');
}

// A function that converts a response body into a List<Canal>.
List<Canal> parseCanal(String fetchCanal) {
  final parsed = jsonDecode(fetchCanal).cast<Map<String, dynamic>>();

  return parsed.map<Canal>((json) => Canal.fromJson(json)).toList();
}

