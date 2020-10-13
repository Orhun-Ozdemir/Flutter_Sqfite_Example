class Ogrenci {
  int _id;
  String _name;
  String _surname;

  String get name => _name;

  String get surname => _surname;

  set name(String name) {
    _name = name;
  }

  set surname(String surname) {
    _surname = surname;
  }

  Ogrenci(this._name, this._surname);

  Map<String, dynamic> toMap() {
    var go = Map<String, dynamic>();

    go["name"] = _name;
    go["id"] = _id;
    go["surname"] = _surname;

    return go;
  }

  Ogrenci fromMap(Map<String, dynamic> map) {
    _name = map["name"];
    _surname = map["surname"];
  }
}
