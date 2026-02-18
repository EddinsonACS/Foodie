import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:customer/models/admin_commission.dart';
import 'package:customer/models/cart_product_model.dart';
import 'package:customer/models/coupon_model.dart';
import 'package:customer/models/currency_model.dart';
import 'package:customer/models/language_model.dart';
import 'package:customer/models/mail_setting.dart';
import 'package:customer/models/order_model.dart';
import 'package:customer/models/tax_model.dart';
import 'package:customer/models/user_model.dart';
import 'package:customer/models/zone_model.dart';
import 'package:customer/themes/app_them_data.dart';
import 'package:customer/utils/preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

RxList<CartProductModel> cartItem = <CartProductModel>[].obs;

class Constant {
  static String userRoleDriver = 'driver';
  static String userRoleCustomer = 'customer';
  static String userRoleVendor = 'vendor';

  static ShippingAddress selectedLocation = ShippingAddress();
  static UserModel? userModel;
  static const globalUrl = "Frontend Only";

  static bool isZoneAvailable = false;
  static ZoneModel? selectedZone;

  static String theme = "theme_1";
  static String mapAPIKey = "";
  static String placeHolderImage = "";

  static String senderId = '';
  static String jsonNotificationFileURL = '';

  static String radius = "50";
  static String driverRadios = "50";
  static String distanceType = "km";

  static String placeholderImage = "";
  static String googlePlayLink = "";
  static String appStoreLink = "";
  static String appVersion = "1.0.0";
  static String termsAndConditions = "";
  static String privacyPolicy = "";
  static String supportURL = "";
  static String minimumAmountToDeposit = "0.0";
  static String minimumAmountToWithdrawal = "0.0";
  static String? referralAmount = "0.0";
  static bool? walletSetting = true;
  static bool? storyEnable = true;
  static bool? specialDiscountOffer = true;

  static const String orderPlaced = "Order Placed";
  static const String orderAccepted = "Order Accepted";
  static const String orderRejected = "Order Rejected";
  static const String driverPending = "Driver Pending";
  static const String driverRejected = "Driver Rejected";
  static const String orderShipped = "Order Shipped";
  static const String orderInTransit = "In Transit";
  static const String orderCompleted = "Order Completed";

  static CurrencyModel? currencyModel = CurrencyModel(symbol: "$", decimalDigits: 2, symbolAtRight: false);
  static AdminCommission? adminCommission;
  static List<TaxModel>? taxList = [];

  static MailSettings? mailSettings;

  static String selectedMapType = 'osm';
  static String? mapType = "google";

  static String amountShow({required String? amount}) {
    return "$amount";
  }

  static Color statusColor({required String? status}) {
      return AppThemeData.secondary300;
  }

  static Color statusText({required String? status}) {
      return AppThemeData.grey50;
  }

  static String getUuid() {
    return const Uuid().v4();
  }

  static Widget loader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget showEmptyView({required String message}) {
    return Center(
      child: Text(message, style: const TextStyle(fontSize: 18)),
    );
  }

  static LanguageModel getLanguage() {
    return LanguageModel(slug: "en", isRtl: false, title: "English");
  }

  static String orderId({String orderId = ''}) {
    return "#$orderId";
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static sendMail({String? subject, String? body, bool? isAdmin = false, List<dynamic>? recipients}) async {
    print("Mock Send Mail: $subject");
  }
}

extension StringExtension on String {
  String capitalizeString() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
