import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

class KasubScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KasubScreenState();
  }
}

class _KasubScreenState extends State<KasubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              DropDownField(
                //value: ,
                required: true,
                labelText: 'Kasub',
                //item: ,
                //setter: (),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Kegiatan'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mitra'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tim Teknis'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nilai'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              DropDownField(
                //value: ,
                required: true,
                labelText: 'Status',
                //item: ,
                //setter: (),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Keterangan'),
                textInputAction: TextInputAction.next,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
