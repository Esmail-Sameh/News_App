import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper{
   static late SharedPreferences _sharedPreferences;

   static init()async{
     _sharedPreferences = await SharedPreferences.getInstance();
   }

   //methods
   //1. set

   static Future<bool> setData ({required String key , required dynamic value})async
   {
     if(value is int) {
      await _sharedPreferences.setInt(key , value);
      return true;
     }
     if(value is String) {
       await _sharedPreferences.setString(key , value);
       return true;
     }
     if(value is bool) {
       await _sharedPreferences.setBool(key , value);
       return true;
     }
     if(value is double) {
       await _sharedPreferences.setDouble(key , value);
       return true;
     }
     return false;
   }

   static dynamic getData({required String key}){
     return _sharedPreferences.get(key);
   }

}