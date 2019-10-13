import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    var data1 = [
      Timteknis("PPTA", 15, Colors.red[200]),
      Timteknis("PTA", 30, Colors.green[200]),
      Timteknis("PYAA", 45, Colors.yellow[300]),
      Timteknis("PBT", 20, Colors.blue),
      Timteknis("PUTA", 50, Colors.brown[200]),
      Timteknis("PTIK", 35, Colors.indigoAccent),
      Timteknis("PHTA", 0, Colors.cyan),
      Timteknis("BTIP", 0, Colors.grey)
    ];

    var data2 = [
      Status("Pembahasan Awal", 10),
      Status("Penawaran", 5),
      Status("Diskusi/Negosiasi", 7),
      Status("Proses Kontrak", 12),
      Status("Kontrak", 4),
      Status("Gagal", 6),
    ];

    var series1 = [
      charts.Series(
          domainFn: (Timteknis timteknis, _) => timteknis.nama,
          measureFn: (Timteknis timteknis, _) => timteknis.jumlah,
          colorFn: (Timteknis timteknis, _) => timteknis.color,
          id: 'Tim Teknis',
          data: data1,
          labelAccessorFn: (Timteknis timteknis, _) =>
              '${timteknis.nama} : ${timteknis.jumlah.toString()}')
    ];

    var series2 = [
      charts.Series(
          domainFn: (Status status, _) => status.nama,
          measureFn: (Status status, _) => status.jumlah,
          id: 'Status',
          data: data2,
          labelAccessorFn: (Status status, _) =>
              '${status.nama} : ${status.jumlah.toString()}')
    ];

    var chartdonut = charts.PieChart(series1,
        defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [
            charts.ArcLabelDecorator(),
          ],
          arcWidth: 170,
        ),
        animate: true,
        animationDuration: Duration(milliseconds: 1100)
        //untuk bar chart
        //vertical: false,
        //barRendererDecorator: charts.BarLabelDecorator<String>/(),
        //domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
        );

    var chartbar = charts.BarChart(
      series2,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Text(
                "Tim Teknis Analisis",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 400,
                child: chartdonut,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text('Status Jumlah'),
                padding: EdgeInsets.all(90.0),
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
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Status Kegiatan Analisis",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 300,
                child: chartbar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Timteknis {
  final String nama;
  final int jumlah;
  final charts.Color color;

  Timteknis(this.nama, this.jumlah, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class Status {
  final String nama;
  final int jumlah;

  Status(this.nama, this.jumlah);
}
