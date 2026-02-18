import "package:restaurant/models/mock_types.dart";
import 'dart:async';
import 'dart:developer';
import 'package:restaurant/constant/constant.dart';
import 'package:restaurant/models/order_model.dart';
import 'package:restaurant/models/user_model.dart';
import 'package:restaurant/models/vendor_model.dart';
import 'package:restaurant/models/on_boarding_model.dart';
import 'package:restaurant/models/product_model.dart';
import 'package:restaurant/models/vendor_category_model.dart';

class FireStoreUtils {
  static var fireStore = null;

  static String getCurrentUid() {
    return "mock_vendor_123";
  }

  static Future<bool> isLogin() async {
    return true;
  }

  static Future<UserModel?> getUserProfile(String uuid) async {
    return UserModel(
      id: uuid,
      firstName: "Vendor",
      lastName: "Mock",
      email: "vendor@example.com",
      role: "vendor",
      active: true,
    );
  }

  static Future<bool> updateUser(UserModel userModel) async {
    Constant.userModel = userModel;
    return true;
  }

  getSettings() async {
    Constant.mapAPIKey = "";
    return;
  }

  static Future<VendorModel?> getVendor(String vendorId) async {
    return VendorModel(id: vendorId, title: "Mock Restaurant");
  }

  static Future<List<ProductModel>> getProductByVendorId(String vendorId) async {
    return [];
  }

  static Future<List<VendorCategoryModel>> getVendorCategory() async {
    return [];
  }

  static Future<List<OrderModel>> getVendorOrders(String vendorId) async {
    return [];
  }
}
