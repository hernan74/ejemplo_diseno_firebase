import 'package:shared_preferences/shared_preferences.dart';

class Shp {
  static final Shp _instancia = new Shp._internal();

  factory Shp() {
    return _instancia;
  }

  Shp._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del IdUsuario
  String get idFirebase {
    return _prefs?.getString('idFirebase') ?? '';
  }

  set idFirebase(String? value) {
    _prefs?.setString('idFirebase', value ?? '');
  }
}
