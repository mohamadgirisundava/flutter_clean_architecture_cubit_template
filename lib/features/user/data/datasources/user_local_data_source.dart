import 'dart:convert';

import 'package:flutter_clean_architecture_cubit_template/core/constants/database.dart';
import 'package:flutter_clean_architecture_cubit_template/features/user/domain/entities/user_model.dart';
import 'package:hive/hive.dart';

abstract class UserLocalDataSource {
  Future setToken(String token);

  Future<String?> getToken();

  Future<bool> clearSession();

  Future setUserData(UserModel? data);

  Future<UserModel?> getUserData();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future setToken(String token) async {
    var box = await Hive.openBox(DATABASE.dbName);
    box.put(DATABASE.token, token);
  }

  @override
  Future<String?> getToken() async {
    var box = await Hive.openBox(DATABASE.dbName);
    return box.get(DATABASE.token);
  }

  @override
  Future<bool> clearSession() async {
    try {
      var box = await Hive.openBox(DATABASE.dbName);
      box.delete(DATABASE.token);
      box.delete(DATABASE.userData);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future setUserData(UserModel? data) async {
    var temp = json.encode(data?.toJson());
    var box = await Hive.openBox(DATABASE.dbName);
    box.put(DATABASE.userData, temp);
  }

  @override
  Future<UserModel?> getUserData() async {
    var box = await Hive.openBox(DATABASE.dbName);
    var temp = box.get(DATABASE.userData) as String?;
    if (temp != null) {
      return UserModel.fromJson(json.decode(temp));
    }
    return null;
  }
}
