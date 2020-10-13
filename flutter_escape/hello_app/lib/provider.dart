import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class Provider extends StatefulWidget {
  Provider({Key key}) : super(key: key);

  @override
  _ProviderState createState() => _ProviderState();
}

class _ProviderState extends State<Provider> {
  var control = new TextEditingController();

  Future<String> dosyaYolu() async {
    var dosya = await getApplicationDocumentsDirectory();
    debugPrint(dosya.toString());
    return dosya.path;
  }

  Future<File> dosyaOlus() async {
    return File(await dosyaYolu() + "/myDosta.txt");
  }

  Future<String> dosyOKu() async {
    var icerik = (dosyaOlus() as File).readAsString();
    return icerik;
  }

  Future<File> dosyayaz(String yazilacaklar) async {
    return await (dosyaOlus() as File).writeAsString(yazilacaklar);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(dosyaYolu().toString());
    debugPrint("ajskfnkjsafn");
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: TextField(
          controller: control,
        ),
      ),
    );
  }
}
