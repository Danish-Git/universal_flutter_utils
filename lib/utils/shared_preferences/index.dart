import 'package:get_storage/get_storage.dart';

class UFPrefUtils {

  final String loggedIn = 'isLoggedIn';
  String authToken = 'authToken';
  String rememberMeData = 'rememberMeData';
  String userData = 'userData';
  String skippedAppVersion = 'skippedAppVersion';

  void clearPref() {
    final mStorage = GetStorage();
    final Iterable<String> mIterable = mStorage.getKeys();
    final keys = mIterable.toList();
    for (var element in keys) {
      if (element != rememberMeData) {
        mStorage.remove(element);
      }
    }
  }

  void writeString(String key, String value) {
    final mStorage = GetStorage();
    mStorage.write(key, value);
  }

  String? readString(String key) {
    final mStorage = GetStorage();
    return mStorage.read(key) as String?;
  }

  void writeBoolean(String key, bool value) {
    final mStorage = GetStorage();
    mStorage.write(key, value);
  }

  bool readBoolean(String key) {
    final mStorage = GetStorage();
    return mStorage.read(key) as bool? ?? false;
  }

  void writeObject(String key, dynamic value) {
    final mStorage = GetStorage();
    mStorage.write(key, value);
  }

  dynamic readObject(String key) {
    final mStorage = GetStorage();
    return mStorage.read(key);
  }

  String readAuthToken() {
    final mStorage = GetStorage();
    return mStorage.read(authToken) as String? ?? '';
  }
}