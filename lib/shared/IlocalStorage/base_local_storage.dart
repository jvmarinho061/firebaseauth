abstract class IlocalStorage {
  static const String keyLogin = 'key_login';
  static const String keyTemaPadrao = 'key_tema_padrao';

  Future<bool> existe(String key);
  Future<void> save(String key, dynamic value);
  Future<void> remove(String key);
  Future<void> removeAll();
}