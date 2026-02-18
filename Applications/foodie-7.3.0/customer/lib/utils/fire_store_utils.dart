import "package:customer/models/mock_types.dart";
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:customer/constant/collection_name.dart';
import 'package:customer/constant/constant.dart';
import 'package:customer/models/BannerModel.dart';
import 'package:customer/models/dine_in_booking_model.dart';
import 'package:customer/models/coupon_model.dart';
import 'package:customer/models/notification_model.dart';
import 'package:customer/models/on_boarding_model.dart';
import 'package:customer/models/order_model.dart';
import 'package:customer/models/product_model.dart';
import 'package:customer/models/tax_model.dart';
import 'package:customer/models/user_model.dart';
import 'package:customer/models/vendor_category_model.dart';
import 'package:customer/models/vendor_model.dart';
import 'package:customer/models/zone_model.dart';
import 'package:flutter/material.dart';
import 'package:customer/utils/preferences.dart';
import 'package:get/get.dart';

class FireStoreUtils {
  // Mocking Firestore instance as null or dynamic
  static var fireStore = null;

  static String getCurrentUid() {
    return "mock_user_123";
  }

  static Future<bool> isLogin() async {
    return true; // Always logged in for frontend testing
  }

  static Future<bool> userExistOrNot(String uid) async {
    return true;
  }

  static Future<UserModel?> getUserProfile(String uuid) async {
    return UserModel(
      id: uuid,
      firstName: "User",
      lastName: "Mock",
      email: "mock@example.com",
      phoneNumber: "123456789",
      role: "customer",
      active: true,
      walletAmount: "100.0"
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
      OnBoardingModel(title: "Welcome", description: "Foodie App Frontend", image: ""),
    ];
  }

  static Future<List<VendorModel>> getVendors() async {
    return [
      VendorModel(id: "1", title: "Mock Restaurant 1", description: "Delicious food", latitude: 0.0, longitude: 0.0),
    ];
  }

  static Future<bool?> setWalletTransaction(dynamic walletTransactionModel) async {
    return true;
  }

  getSettings() async {
    // Fill with default constants
    Constant.radius = "50";
    Constant.theme = "theme_1";
    return;
  }

  static Future<List<ZoneModel>?> getZone() async {
    return [ZoneModel(id: "1", name: "Mock Zone", publish: true)];
  }

  static Future getPaymentSettingsData() async {
    return;
  }

  static Future<VendorModel?> getVendorById(String vendorId) async {
    return VendorModel(id: vendorId, title: "Mock Vendor", latitude: 0.0, longitude: 0.0);
  }

  static Stream<List<VendorModel>> getAllNearestRestaurant({bool? isDining}) async* {
    yield [VendorModel(id: "1", title: "Mock Nearest", latitude: 0.0, longitude: 0.0)];
  }

  static Future<List<ProductModel>> getProductByVendorId(String vendorId) async {
    return [
      ProductModel(id: "p1", name: "Mock Burger", price: "10.0", vendorID: vendorId),
    ];
  }

  static Future<List<CouponModel>> getHomeCoupon() async {
    return [];
  }

  static Future<List<VendorCategoryModel>> getHomeVendorCategory() async {
    return [VendorCategoryModel(id: "c1", title: "Burgers", publish: true, showInHomepage: true)];
  }

  static Future<List<BannerModel>> getHomeTopBanner() async {
    return [];
  }

  static Future<List<OrderModel>> getAllOrder() async {
    return [];
  }

  static Future<List<DineInBookingModel>> getDineInBooking(bool isUpcoming) async {
    return [];
  }

  // Add other necessary stubs as needed by the UI
  static Future<EmailTemplateModel?> getEmailTemplates(String type) async {
    return null;
  }
}
