import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusyantek/provider/kasub.provider.dart';

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListScreenState();
  }
}

class _ListScreenState extends State<ListScreen> {
  getColor(String status) {
    switch (status) {
      case "Gagal":
        return Colors.red;

      case "Pembahasan Awal":
        return Colors.amberAccent;

      case "Penawaran":
        return Colors.amber;

      case "Diskusi/Negosiasi":
        return Colors.yellowAccent;

      case "Proses Kontrak":
        return Colors.yellow;

      case "Kontrak":
        return Colors.greenAccent;

      default:
        return Colors.cyanAccent;
    }
  }

  Widget buildLeftItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title),
        SizedBox(height: 5),
        Text(
          subtitle.length > 25 ? subtitle.substring(0, 25) + '...' : subtitle,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildRightItem(String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(title),
        SizedBox(height: 5),
        Text(
          subtitle.substring(0, 10),
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KasubProvider>(
      builder: (ctx, kasub, _) {
        return ListView.builder(
          itemCount: kasub.kasubs.length,
          itemBuilder: (_, index) {
            final item = kasub.kasubs[index];
            return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildLeftItem(item.kategori, item.kegiatan),
                    buildRightItem(item.status, item.tanggalDibuat),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
