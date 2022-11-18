import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  @override
  _InsertDataState createState() => _InsertDataState();
}

class Manusia {
  int ID;
  String Nama, Kelas;

  Manusia(this.ID, this.Nama, this.Kelas);
}

class _InsertDataState extends State<InsertData> {
  int SelectedPageIndex = 0;
  bool IsRailExtended = false;

  List<Manusia> DaftarSiswa = <Manusia>[
    Manusia(1, "Mel", "X IPA 2"),
    Manusia(2, "Sigit Rendang", "XI IPS 1")
  ];

  final formKey = new GlobalKey<FormState>();
  var ID_Controller = new TextEditingController();
  var Name_Controller = new TextEditingController();
  var Class_Controller = new TextEditingController();
  var lastID = 2;

  @override
  void initState() {
    super.initState();
    lastID++;
    ID_Controller.text = lastID.toString();
  }

  refreshList() {
    setState(() {
      ID_Controller.text = lastID.toString();
    });
  }

  validate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();

      String ID = ID_Controller.text;
      String N = Name_Controller.text;
      String A = Class_Controller.text;

      Manusia baru = Manusia(int.parse(ID), N, A);
      DaftarSiswa.add(baru);
      lastID++;
      refreshList();
      Name_Controller.text = "";
      Class_Controller.text = "";
    }
  }

  bool NotIntCheck(var N) {
    final V = int.tryParse(N);

    if (V == null) {
      print("Bukan Angka");
      return true;
    } else {
      print("Angka");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Tamu"),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("No:"),
                  TextField(
                    controller: ID_Controller,
                    enabled: false,
                  ),
                  Text("Nama:"),
                  TextFormField(
                    controller: Name_Controller,
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        val?.length == 0 ? 'Masukan Nama' : null,
                  ),
                  Text("Kelas :"),
                  TextFormField(
                    controller: Class_Controller,
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        val?.length == 0 ? 'Masukan Kelas' : null,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        'Tambah Data',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: validate,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  Text(
                    "Daftar Tamu Perpustakaan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text("No"),
                  ),
                  DataColumn(
                    label: Text("Nama"),
                  ),
                  DataColumn(
                    label: Text("Kelas"),
                  ),
                ],
                rows: DaftarSiswa.map(
                  (p) => DataRow(cells: [
                    DataCell(
                      Text(p.ID.toString()),
                    ),
                    DataCell(
                      Text(p.Nama),
                    ),
                    DataCell(
                      Text(p.Kelas.toString()),
                    ),
                  ]),
                ).toList(),
              ))
        ],
      ),
    );
  }
}
