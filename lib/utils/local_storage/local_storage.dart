import 'package:get_storage/get_storage.dart';

class LocalStorageHelper {
  
    late final GetStorage _storage;

  static LocalStorageHelper? _instance;
  LocalStorageHelper._internal();

  factory LocalStorageHelper.instance() {
    _instance ??= LocalStorageHelper._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async{
    await GetStorage.init(bucketName);
    _instance = LocalStorageHelper._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    return _storage.remove(key);
  }

  Future<void> clearAll() async {
    return _storage.erase();
  }

  //very much generics
  // static final LocalStorageHelper _instance = LocalStorageHelper._internal();

  // factory LocalStorageHelper() {
  //   return _instance;
  // }

  // LocalStorageHelper._internal();
  // final storage = GetStorage();

  // Future<void> saveData<T>(String key, T value) async {
  //   await storage.write(key, value);
  // }

  // T? readData<T>(String key) {
  //   return storage.read<T>(key);
  // }

  // Future<void> removeData(String key) async {
  //   return storage.remove(key);
  // }

  // Future<void> clearAll() async {
  //   return storage.erase();
  // }
}
