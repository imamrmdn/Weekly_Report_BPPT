import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/kasub.provider.dart';

class KasubStatus extends StatefulWidget {
  @override
  _KasubStatusState createState() => _KasubStatusState();
}

class _KasubStatusState extends State<KasubStatus> {
  var initializing = true;

  Future<void> fetchKasub() async {
    try {
      await Provider.of<KasubProvider>(context, listen: false).getAll();
    } catch (error) {
      throw error;
    }
  }

  @override
  void didChangeDependencies() {
    if (initializing) {
      fetchKasub();
    }

    setState(() {
      initializing = false;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<KasubProvider>(
        builder: (ctx, kasub, _) {
          final pembahasanAwal =
              kasub.kasubs.where((kasub) => kasub.status == 'Pembahasan Awal');
          final penawaran =
              kasub.kasubs.where((kasub) => kasub.status == 'Penawaran');
          final diskusiOrNegosiasi = kasub.kasubs
              .where((kasub) => kasub.status == 'Diskusi/Negosiasi');
          final prosesKontrak =
              kasub.kasubs.where((kasub) => kasub.status == 'Kontrak');
          final gagal = kasub.kasubs.where((kasub) => kasub.status == 'Gagal');

          return Column(
            children: <Widget>[
              Text(
                'Jumlah Status',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 35),
              buildStatus('Pemabahasan Awal', pembahasanAwal.length),
              buildStatus('Penawaran', penawaran.length),
              buildStatus('Diskusi/Negosiasi', diskusiOrNegosiasi.length),
              buildStatus('Kontrak', prosesKontrak.length),
              buildStatus('Gagal', gagal.length),
            ],
          );
        },
      ),
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.blue,
        borderRadius: BorderRadius.circular(40),
        //sgradient: LinearGradient(),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(
              10.0,
              10.0,
            ),
          )
        ],
      ),
      width: 500,
      height: 300,
    );
  }

  Widget buildStatus(String title, int value) => Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
}
