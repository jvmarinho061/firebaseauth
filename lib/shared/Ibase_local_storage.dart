// ignore: file_names
abstract class IbaseLocalStorage {
  static const String keyLogin = 'login';
  static const String keyTemaPadrao = 'keyTemaPadrao';

  Future read(String key);
  Future save(String key, value);
  Future remove(String key);
  Future removeAll();
  Future<bool> existe(String key);
}
