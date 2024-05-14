import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class HiveService {
  Future<void> put(String key, dynamic value);
  Future<dynamic> get(String key);
  Future<void> delete(String key);
  Future<int> clear();
}

@LazySingleton(as: HiveService)
class HiveServiceImpl implements HiveService {
  final Box<dynamic> hive;

  HiveServiceImpl({required this.hive});

  @override
  Future<int> clear() async {
    return await hive.clear();
  }

  @override
  Future<void> delete(key) async {
    return await hive.delete(key);
  }

  @override
  Future<dynamic> get(key) async {
    return hive.get(key);
  }

  @override
  Future<void> put(String key, dynamic value) async {
    hive.put(key, value);
  }
}
