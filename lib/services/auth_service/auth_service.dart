import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_steps_tracker/services/auth_service/models/auth_user.dart';
import 'package:get/state_manager.dart';

enum AuthState { unknown, authed, unauthed }

class AuthService extends GetxService {
  final _firebaseService = FirebaseAuth.instance;
  final _firebaseStore = FirebaseFirestore.instance;

  final authState = AuthState.unknown.obs;
  late final StreamSubscription _authSub;

  late AuthUser authUser;
  late DocumentReference<Map<String, dynamic>> authFireStoreRef;

  @override
  void onInit() async {
    _authSub = _firebaseService.authStateChanges().listen((event) async {
      authState.value = event == null ? AuthState.unauthed : AuthState.authed;
    });
    super.onInit();
  }

  Future<void> ensureInit() async {
    authUser = await getCurrentUser();
    authFireStoreRef = (await _firebaseStore
            .collection("users")
            .where("id", isEqualTo: authUser.id)
            .get())
        .docs
        .first
        .reference;
  }

  @override
  void onClose() {
    _authSub.cancel();
    super.onClose();
  }

  Future<AuthUser> signup(String name) async {
    final cres = await _firebaseService.signInAnonymously();
    final authUser = AuthUser(
      id: _firebaseService.currentUser!.uid,
      name: name,
    );

    await _firebaseStore.collection("users").add(authUser.toJson());

    return authUser;
  }

  Future<AuthUser> getCurrentUser() async {
    final cred = _firebaseService.currentUser!;
    final data = await _firebaseStore
        .collection("users")
        .where("id", isEqualTo: cred.uid)
        .get();

    return AuthUser.fromJson(data.docs.first.data());
  }

  Future<void> logout() async {
    _firebaseService.signOut();
  }
}
