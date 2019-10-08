import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:provider/provider.dart';
import 'package:pusyantek/provider/kasub.provider.dart';

class KasubScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KasubScreenState();
  }
}

class _KasubScreenState extends State<KasubScreen> {
  final List<String> listTimTeknis = [
    "PTA",
    "PTB",
    "PTFM",
    "PTE",
    "PTSEIK",
    "PTA",
    "PTPP",
    "PTKSSI",
    "PPIPE",
    "PPIMTE",
    "PSAT",
    "PTIP",
    "PTSPT",
    "PTIk",
    "BJIK",
    "BTP",
    "BBTKE",
    "BTMPPO",
    "BTMP",
    "BTH",
    "BIT",
    "BTIKK",
    "BTIPDP",
    "BTSK",
    "BBTMC",
    "BBTA3",
    "BBTKS",
    "BB",
    "BTBBRD"
  ];
  final formKey = GlobalKey<FormState>();
  final kegiatanController = TextEditingController();
  final mitraController = TextEditingController();
  final nilaiController = TextEditingController();
  final keteranganController = TextEditingController();
  var timTeknisInput = 'PTA';
  var kasubInput = 'Perencanaan';
  var statusInput = "Pembahasan Awal";
  var isLoading = false;
  final kasubList = ['Perencanaan', 'Pemasyarakatan'];
  final statusList = [
    "Pembahasan Awal",
    "Penawaran",
    "Diskusi / Negosiasi",
    "Proses Kontrak",
    "Kontrak"
  ];
  final kegiatanFocusNode = FocusNode();
  final mitraFocusNode = FocusNode();
  final nilaiFocusNode = FocusNode();
  final keteranganFocusNode = FocusNode();

  handleOnSave() async {
    try {
      setState(() => isLoading = true);
      final data = {
        'kategori': kasubInput,
        'kegiatan': kegiatanController.text,
        'mitra': mitraController.text,
        'tim_teknis': timTeknisInput,
        'nilai': int.parse(nilaiController.text),
        'status': statusInput,
        'keterangan': keteranganController.text,
      };

      await Provider.of<KasubProvider>(context).create(data);
      setState(() => isLoading = false);
    } catch (error) {
      print(error.response);
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    kegiatanController.dispose();
    mitraController.dispose();
    nilaiController.dispose();
    keteranganController.dispose();
    kegiatanFocusNode.dispose();
    mitraFocusNode.dispose();
    nilaiFocusNode.dispose();
    super.dispose();
  }

  //var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Text(
                'Kepala Sub Bidang',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Column(
                children: [
                  Wrap(
                    // alignment: WrapAlignment.end,
                    //crossAxisAlignment: WrapCrossAlignment.start,
                    children: List<Widget>.generate(
                      kasubList.length,
                      (int index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        child: ChoiceChip(
                          selectedColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.grey,
                          labelStyle: TextStyle(color: Colors.white),
                          label: Text(kasubList[index]),
                          selected: kasubInput == kasubList[index],
                          onSelected: (bool selected) {
                            setState(() => kasubInput = kasubList[index]);
                            kegiatanFocusNode.requestFocus();
                          },
                        ),
                      ),
                    ).toList(),
                  ),
                ],
              ),
              TextFormField(
                controller: kegiatanController,
                decoration: InputDecoration(labelText: 'Kegiatan'),
                textInputAction: TextInputAction.next,
                focusNode: kegiatanFocusNode,
                onFieldSubmitted: (_) => mitraFocusNode.requestFocus(),
              ),
              TextFormField(
                controller: mitraController,
                decoration: InputDecoration(labelText: 'Mitra'),
                textInputAction: TextInputAction.next,
                focusNode: mitraFocusNode,
              ),
              SizedBox(
                height: 25,
              ),
              DropDownField(
                value: timTeknisInput,
                required: true,
                labelText: 'Tim Teknis',
                items: listTimTeknis,
                strict: false,
                setter: (dynamic newValue) {
                  setState(() => timTeknisInput = newValue);
                  nilaiFocusNode.requestFocus();
                },
              ),
              TextFormField(
                controller: nilaiController,
                decoration: InputDecoration(labelText: 'Nilai'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: nilaiFocusNode,
              ),
              SizedBox(height: 20),
              Text(
                'Status',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Column(
                children: [
                  Wrap(
                    children: List<Widget>.generate(
                      statusList.length,
                      (int index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        child: ChoiceChip(
                          selectedColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.grey,
                          labelStyle: TextStyle(color: Colors.white),
                          label: Text(statusList[index]),
                          selected: statusInput == statusList[index],
                          onSelected: (bool selected) {
                            setState(() => statusInput = statusList[index]);
                            keteranganFocusNode.requestFocus();
                          },
                        ),
                      ),
                    ).toList(),
                  ),
                ],
              ),
              TextFormField(
                controller: keteranganController,
                decoration: InputDecoration(labelText: 'Keterangan'),
                textInputAction: TextInputAction.next,
                focusNode: keteranganFocusNode,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: 20),
              ButtonTheme(
                splashColor: Colors.tealAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                textTheme: ButtonTextTheme.primary,
                buttonColor: Colors.teal,
                minWidth: double.infinity,
                height: 65,
                child: RaisedButton(
                  child: isLoading
                      ? CircularProgressIndicator(backgroundColor: Colors.white)
                      : Text('Simpan'),
                  onPressed: handleOnSave,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
