// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// This library attempts to expose the definitions necessary to use the
/// browsers `window.crypto.subtle` APIs.
@JS()
library common;

import 'dart:js_interop';

import 'package:web/web.dart' hide JsonWebKey;

export 'jsonwebkey.dart' show JsonWebKey;

/// Minimal interface for promises as returned from the browsers WebCrypto API.



/// Anonymous object to be used for constructing the `algorithm` parameter in
/// `subtle.crypto` methods.
///
/// Note this only works because [WebIDL specification][1] for converting
/// dictionaries say to ignore properties whose values are `null` or
/// `undefined`. Otherwise, this object would define a lot of properties that
/// are not permitted. If two parameters for any algorithms in the Web
/// Cryptography specification has conflicting types in the future, we might
/// have to split this into multiple types. But so long as they don't have
/// conflicting parameters there is no reason to make a type per algorithm.
///
/// [1]: https://www.w3.org/TR/WebIDL-1/#es-dictionary

@JS('crypto.subtle.decrypt')
external JSPromise<JSArrayBuffer> decrypt(
  JSObject algorithm,
  JSObject key,
  JSTypedArray data,
);

@JS('crypto.subtle.encrypt')
external JSPromise<JSArrayBuffer> encrypt(
  JSObject algorithm,
  JSObject key,
  JSTypedArray data,
);

@JS('crypto.subtle.exportKey')
external JSPromise<JSArrayBuffer> exportKey(
  String format,
  JSObject key,
);

@JS('crypto.subtle.generateKey')
external JSPromise<CryptoKey> generateKey(
  JSObject algorithm,
  bool extractable,
  JSArray<JSString> usages,
);

@JS('crypto.subtle.importKey')
external JSPromise<CryptoKey> importKey(
  String format,
  JSTypedArray keyData,
  JSObject algorithm,
  bool extractable,
  JSArray<JSString> usages,
);
