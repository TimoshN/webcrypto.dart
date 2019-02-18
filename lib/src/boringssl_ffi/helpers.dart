import 'dart:ffi';

// TODO: detect this dynamically using Isolate.resolvePackageUri, this will be async :(
final _boringsslPath =
    '/jonasfj/projects/webcrypto/third_party/boringssl/build/ssl/libssl.so';

/// Dynamically loaded boringssl library.
final _boringssl = DynamicLibrary.open(_boringsslPath);

/// Auxiliary for loading functions from [_boringssl].
class _Resolver {
  final String symbolName;
  _Resolver(this.symbolName);
  Pointer<NativeFunction<T>> lookupFunc<T extends Function>() =>
      _boringssl.lookup<NativeFunction<T>>(symbolName);
}

/// Helper function for looking up functions with two calls, such that
/// we don't have multiple type arguments one the same line.
_Resolver lookup(String symbol) => _Resolver(symbol);
