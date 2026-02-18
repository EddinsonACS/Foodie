import "package:driver/models/mock_types.dart";
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:driver/constant/collection_name.dart';
import 'package:driver/constant/constant.dart';
import 'package:driver/models/order_model.dart';
import 'package:driver/models/user_model.dart';
import 'package:driver/models/vendor_model.dart';
import 'package:driver/models/wallet_transaction_model.dart';
import 'package:driver/models/withdrawal_model.dart';
import 'package:driver/models/zone_model.dart';
import 'package:driver/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:driver/utils/preferences.dart';
import 'package:get/get.dart';

class FireStoreUtils {
  static var fireStore = null;

  static String getCurrentUid() {
    return "mock_driver_123";
  }

  static Future<bool> isLogin() async {
    return true;
  }

  static Future<bool> userExistOrNot(String uid) async {
    return true;
  }

  static Future<UserModel?> getUserProfile(String uuid) async {
    return UserModel(
      id: uuid,
      firstName: "Driver",
      lastName: "Mock",
      email: "driver@example.com",
      phoneNumber: "987654321",
      role: "driver",
      active: true,
      walletAmount: 50.0
    );
  }

  static Future<bool?> updateUserWallet({required String amount, required String userId}) async {
    return true;
  }

  static Future<bool> updateUser(UserModel userModel) async {
    Constant.userModel = userModel;
    return true;
  }

  static Future<List<OnBoardingModel>> getOnBoardingList() async {
    return [
      OnBoardingModel(title: "Driver Welcome", description: "Foodie Driver Frontend", image: ""),
    ];
  }

  static Future<bool?> setWalletTransaction(WalletTransactionModel walletTransactionModel) async {
    return true;
  }

  getSettings() async {
    Constant.mapAPIKey = "";
    return;
  }

  static Future<List<ZoneModel>?> getZone() async {
    return [ZoneModel(id: "1", name: "Mock Zone", publish: true)];
  }

  static Future getPaymentSettingsData() async {
    return;
  }

  static Future<VendorModel?> getVendorById(String vendorId) async {
    return VendorModel(id: vendorId, title: "Mock Vendor");
  }

  static Future<OrderModel?> getOrderById(String orderId) async {
    return null;
  }

  static Future<bool?> setOrder(OrderModel orderModel) async {
    return true;
  }
}
