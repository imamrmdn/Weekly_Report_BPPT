import 'package:flutter/material.dart';

class Kasub {
  final String id;
  final String kategori;
  final String kegiatan;
  final String mitra;
  final String timTeknis;
  final int nilai;
  final String status;
  final String keterangan;
  final String tanggalDibuat;

  Kasub({
    @required this.id,
    @required this.kategori,
    @required this.kegiatan,
    @required this.mitra,
    @required this.timTeknis,
    @required this.nilai,
    @required this.status,
    @required this.keterangan,
    @required this.tanggalDibuat,
  });

  factory Kasub.fromJson(Map<String, dynamic> json) {
    return Kasub(
      id: json['_id'],
      kategori: json['kategori'],
      kegiatan: json['kegiatan'],
      mitra: json['mitra'],
      timTeknis: json['tim_teknis'],
      nilai: json['nilai'],
      status: json['status'],
      keterangan: json['keterangan'],
      tanggalDibuat: json['tanggal_dibuat'],
    );
  }
}
