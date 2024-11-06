import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefexamit/enum.dart';

class MyCache{

  static SharedPreferences? preferences;

  static Future<void>init()async{
    preferences =await SharedPreferences.getInstance();
  }

// id "1"
  static void putString ({required MyCacheKeys key ,required String value})async{
    await preferences?.setString(key.name, value);
  }
  // MyCacheKeys.email , esra@amit.com
  // MyCacheKeys.password , 1314256
  static String? getString ({required MyCacheKeys key }){
    return preferences?.getString(key.name) ;
  }

  void putInt({required MyCacheKeys key ,required int value}){
    preferences?.setInt(key.name, value);
  }
  int getInt({required key }){
    return preferences?.getInt(key) ?? 0;
  }

  void putBool({required MyCacheKeys key ,required bool value}){
    preferences?.setBool(key.name, value);
  }
  bool getBool({required MyCacheKeys key }){
    return preferences?.getBool(key.name) ?? false;
  }

  void putDouble({required MyCacheKeys key ,required double value}){
    preferences?.setDouble(key.name, value);
  }
  double getDouble({required MyCacheKeys key }){
    return preferences?.getDouble(key.name) ?? 0.0;
  }

  void removeFromShared({required key})
  {
    preferences?.remove(key);
  }

  void clearShared(){
    preferences?.clear();
  }

}