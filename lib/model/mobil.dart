import 'dart:convert';

import 'package:flutter/material.dart';

Mobil mobilFromJson(String str) => Mobil.fromJson(json.decode(str));
String mobilToJson(Mobil data) => json.encode(data.toJson());

class Mobil {
  String merek, tipe, warna;
  int noMesin;

  Mobil(
      {required this.merek,
      required this.tipe,
      required this.warna,
      required this.noMesin});

  factory Mobil.fromJson(Map<String, dynamic> json) => Mobil(
      merek: json['merek'],
      tipe: json['tipe'],
      warna: json['warna'],
      noMesin: json['no_mesin']);

  Map<String, dynamic> toJson() =>
      {'merek': merek, 'tipe': tipe, 'warna': warna, 'no_mesin': noMesin};

  showDetails() {
    return "Merek $merek \n Tipe $tipe \n Warna $warna \n No Mesin $noMesin";
  }

  Widget details() {
    return Column(
      children: [
        Text(
          "Merek $merek",
          style: const TextStyle(color: Colors.red),
        ),
        Text("Tipe $tipe", style: const TextStyle(color: Colors.blue)),
        Text("Warna $warna", style: const TextStyle(color: Colors.green)),
        Text("No. Mesin $noMesin",
            style: const TextStyle(color: Colors.yellow)),
      ],
    );
  }
}
