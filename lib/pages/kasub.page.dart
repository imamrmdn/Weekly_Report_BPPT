import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

class KasubScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KasubScreenState();
  }
}

class _KasubScreenState extends State<KasubScreen> {
  //var _isLoading = false;
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
              SizedBox(height: 20),
              // ButtonTheme(
              //   splashColor: Colors.tealAccent,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10)),
              //   textTheme: ButtonTextTheme.primary,
              //   buttonColor: Colors.teal,
              //   minWidth: double.infinity,
              //   height: 65,
              //   child: RaisedButton(
              //     child: _isLoading
              //         ? CircularProgressIndicator(backgroundColor: Colors.white)
              //         : Text('Simpan'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
