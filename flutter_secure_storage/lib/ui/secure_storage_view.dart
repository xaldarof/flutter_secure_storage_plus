import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage/models/key_value_pair.dart';

const _storage = FlutterSecureStorage();

class SecureStorageView extends StatelessWidget {
  final Set<String> keys;
  final FlutterSecureStorage? secureStorage;
  final Widget Function(FlutterSecureStorage preferences, KeyValuePair? pair)
      builder;

  FlutterSecureStorage get flutterSecureStorage => secureStorage ?? _storage;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: flutterSecureStorage.observeSet(keys: keys),
      builder: (BuildContext context, AsyncSnapshot<KeyValuePair> snapshot) {
        return builder(flutterSecureStorage, snapshot.data);
      },
    );
  }

  const SecureStorageView({
    Key? key,
    required this.keys,
    required this.builder,
    this.secureStorage,
  }) : super(key: key);
}
