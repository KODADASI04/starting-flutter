// ignore_for_file: constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'veri.dart';

class Services {
  static const ROOT = "http://database.com/actions.php";
  static const _TABLO_YARAT = "tabloyarat";
  static const _VERI_AL = "verial";
  static const _VERI_EKLE = "veriekle";
  static const _VERI_DUZENLE = "veridüzenle";
  static const _VERI_SIL = "verisil";
  static Future<String> tabloyarat() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _TABLO_YARAT;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Tablo yaratıldı : ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<Veri>> verial() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _VERI_AL;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Alınan Veriler : ${response.body}");
      if (200 == response.statusCode) {
        List<Veri> list = parseResponse(response.body);
        return list;
      } else {
        return <Veri>[];
      }
    } catch (e) {
      return <Veri>[];
    }
  }

  static List<Veri> parseResponse(String responsebody) {
    final parsed = json.decode(responsebody).cast<Map<String, dynamic>>();
    return parsed.map<Veri>((json) => Veri.fromJson(json)).toList();
  }

  static Future<String> veriekle(
      String id, String username, String password, String about) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _VERI_EKLE;
      map['username'] = username;
      map['id'] = id;
      map['pass'] = password;
      map['about'] = about;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Eklenen veri : ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> veriduzenle(
      String id, String username, String password, String about) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _VERI_DUZENLE;
      map['id'] = id;
      map['username'] = username;
      map['pass'] = password;
      map['about'] = about;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Güncellenen Veri : ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> verisil(String id) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _VERI_SIL;
      map['id'] = id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Silinen Veri : ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
