// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: camel_case_types
class Tugas extends StatefulWidget {
  const Tugas({Key? key}) : super(key: key);

  @override
  State<Tugas> createState() => _Tugas();
}

// ignore: camel_case_types
class _Tugas extends State<Tugas> {
  TextEditingController ctrPanjang = TextEditingController();
  TextEditingController ctrLebar = TextEditingController();
  TextEditingController ctrHasil = TextEditingController();
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: duplicate_ignore
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("formRegistration"),
      ),
      body: Container(
        // ignore: prefer_const_constructors
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: ctrPanjang,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Panjang',
              ),
            ),
            Container(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: ctrLebar,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Lebar',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                // ignore: sized_box_for_whitespace
                child: Container(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (ctrPanjang.text.isNotEmpty &&
                          ctrLebar.text.isNotEmpty) {
                        ctrHasil.text = (int.parse(ctrPanjang.text) *
                                int.parse(ctrLebar.text))
                            .toString();
                      } else {
                        // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
                        var AlertType;
                        var error = AlertType.error;
                        Alert(
                          context: context,
                          type: error,
                          title: "Masukan Angka",
                          //desc: "Selamat anda berhasil login",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Selanjutnya",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ).show();
                        return;
                      }
                    });
                  },
                  child: Text("Submit")),
            )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Hasil : ${ctrHasil.text}cm",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  DialogButton({required Text child, required void Function() onPressed}) {}
  // ignore: non_constant_identifier_names
  Alert(
      {required BuildContext context,
      required type,
      required String title,
      required List buttons}) {}
}
//Jangan Lupa ke github
