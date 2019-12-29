import 'dart:ffi';
import 'types.dart';
import 'helpers.dart';

// See:
// https://commondatastorage.googleapis.com/chromium-boringssl-docs/ec_key.h.html

//---------------------- EC key objects.

/// EC_KEY_new_by_curve_name returns a fresh EC_KEY for group specified by nid or NULL on error.
///
/// ```c
/// OPENSSL_EXPORT EC_KEY *EC_KEY_new_by_curve_name(int nid);
/// ```
final EC_KEY_new_by_curve_name = lookup('EC_KEY_new_by_curve_name')
    .lookupFunc<Pointer<EC_KEY> Function(Int32)>()
    .asFunction<Pointer<EC_KEY> Function(int)>();

/// EC_KEY_free frees all the data owned by key and key itself.
///
/// ```c
/// OPENSSL_EXPORT void EC_KEY_free(EC_KEY *key);
/// ```
final EC_KEY_free = lookup('EC_KEY_free')
    .lookupFunc<Void Function(Pointer<EC_KEY>)>()
    .asFunction<void Function(Pointer<EC_KEY>)>();

/// EC_KEY_get0_group returns a pointer to the EC_GROUP object inside key.
///
/// ```c
/// OPENSSL_EXPORT const EC_GROUP *EC_KEY_get0_group(const EC_KEY *key);
/// ```
final EC_KEY_get0_group = lookup('EC_KEY_get0_group')
    .lookupFunc<Pointer<EC_GROUP> Function(Pointer<EC_KEY>)>()
    .asFunction<Pointer<EC_GROUP> Function(Pointer<EC_KEY>)>();

/// EC_KEY_get0_public_key returns a pointer to the public key point inside key.
///
/// ```c
/// OPENSSL_EXPORT const EC_POINT *EC_KEY_get0_public_key(const EC_KEY *key);
/// ```
final EC_KEY_get0_public_key = lookup('EC_KEY_get0_public_key')
    .lookupFunc<Pointer<EC_POINT> Function(Pointer<EC_KEY>)>()
    .asFunction<Pointer<EC_POINT> Function(Pointer<EC_KEY>)>();

/// EC_KEY_set_public_key sets the public key of key to pub, by copying it.
/// It returns one on success and zero otherwise. key must already have had a
/// group configured (see EC_KEY_set_group and EC_KEY_new_by_curve_name), and
/// pub must also belong to that group.
///
/// ```c
/// OPENSSL_EXPORT int EC_KEY_set_public_key(EC_KEY *key, const EC_POINT *pub);
/// ```
final EC_KEY_set_public_key = lookup('EC_KEY_set_public_key')
    .lookupFunc<Int32 Function(Pointer<EC_KEY>, Pointer<EC_POINT>)>()
    .asFunction<int Function(Pointer<EC_KEY>, Pointer<EC_POINT>)>();

/// Key encoding parameters.
/// ```c
/// #define EC_PKEY_NO_PARAMETERS 0x001
/// #define EC_PKEY_NO_PUBKEY 0x002
/// ```
const int EC_PKEY_NO_PARAMETERS = 0x001, EC_PKEY_NO_PUBKEY = 0x002;

/// EC_KEY_get_enc_flags returns the encoding flags for key, which is a
/// bitwise-OR of EC_PKEY_* values.
///
/// ```c
/// OPENSSL_EXPORT unsigned EC_KEY_get_enc_flags(const EC_KEY *key);
/// ```
final EC_KEY_get_enc_flags = lookup('EC_KEY_get_enc_flags')
    .lookupFunc<Uint32 Function(Pointer<EC_KEY>)>()
    .asFunction<int Function(Pointer<EC_KEY>)>();

/// EC_KEY_set_enc_flags sets the encoding flags for key, which is a bitwise-OR
/// of EC_PKEY_* values.
/// ```c
/// OPENSSL_EXPORT void EC_KEY_set_enc_flags(EC_KEY *key, unsigned flags);
/// ```
final EC_KEY_set_enc_flags = lookup('EC_KEY_set_enc_flags')
    .lookupFunc<Void Function(Pointer<EC_KEY>, Uint32)>()
    .asFunction<void Function(Pointer<EC_KEY>, int)>();

/// EC_KEY_check_key performs several checks on key (possibly including an
/// expensive check that the public key is in the primary subgroup). It returns
/// one if all checks pass and zero otherwise. If it returns zero then detail
/// about the problem can be found on the error stack.
///
/// ```c
/// OPENSSL_EXPORT int EC_KEY_check_key(const EC_KEY *key);
/// ```
final EC_KEY_check_key = lookup('EC_KEY_check_key')
    .lookupFunc<Int32 Function(Pointer<EC_KEY>)>()
    .asFunction<int Function(Pointer<EC_KEY>)>();

//---------------------- Key generation.

/// EC_KEY_generate_key generates a random, private key, calculates the
/// corresponding public key and stores both in key. It returns one on success
/// or zero otherwise.
///
/// ```c
/// OPENSSL_EXPORT int EC_KEY_generate_key(EC_KEY *key);
/// ```
final EC_KEY_generate_key = lookup('EC_KEY_generate_key')
    .lookupFunc<Int32 Function(Pointer<EC_KEY>)>()
    .asFunction<int Function(Pointer<EC_KEY>)>();
