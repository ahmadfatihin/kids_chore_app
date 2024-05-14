import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  // ignore: invalid_annotation_target
  @preResolve
  Future<Box<dynamic>> get hive async =>
      Hive.box('com.wolkk.kids_behaviour_app');
}
