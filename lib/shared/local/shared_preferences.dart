import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences? sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }
//---------------------------------------- PUT ----------------------------------------------------------

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async
  {
    return await sharedPreferences!.setBool(key, value);
  }


//---------------------------------------- GET ----------------------------------------------------------

  static dynamic getData({
    required String key,
  })
  {
    return sharedPreferences?.get(key);
  }

//---------------------------------------- SAVE ----------------------------------------------------------

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else {
      return await sharedPreferences!.setDouble(key, value);
    }
  }

//---------------------------------------- REMOVE ----------------------------------------------------------

  static Future<bool> removeData({
    required String key,
  }) async{
    return await sharedPreferences!.remove(key);
  }
}