import 'package:doks/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  Future<void> setToken(String token) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString(Strings.xAuthToken, token);
  }

  Future<String?> getToken() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(Strings.xAuthToken);
  }
}
