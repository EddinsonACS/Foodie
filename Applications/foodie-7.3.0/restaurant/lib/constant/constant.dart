import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:audioplayers/audioplayers.dart';
import 'package:restaurant/models/coupon_model.dart';
import 'package:restaurant/models/currency_model.dart';
import 'package:restaurant/models/language_model.dart';
import 'package:restaurant/models/mail_setting.dart';
import 'package:restaurant/models/tax_model.dart';
import 'package:restaurant/models/user_model.dart';
import 'package:restaurant/models/zone_model.dart';
import 'package:restaurant/themes/app_them_data.dart';
import 'package:restaurant/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

AudioPlayer audioPlayer = AudioPlayer(playerId: "playerId");

class Constant {
  static String userRoleDriver = 'driver';
  static String userRoleCustomer = 'customer';
  static String userRoleVendor = 'vendor';

  static UserModel? userModel;
  static const globalUrl = "Frontend Only";

  static bool isZoneAvailable = false;
  static ZoneModel? selectedZone;

  static String mapAPIKey = "";
  static String placeHolderImage = "";

  static String senderId = '';
  static String jsonNotificationFileURL = '';

  static String distanceType = "km";

  static String placeholderImage = "";
  static String googlePlayLink = "";
  static String appStoreLink = "";
  static String appVersion = "1.0.0";
  static String termsAndConditions = "";
  static String privacyPolicy = "";
  static String supportURL = "";
  static String minimumAmountToDeposit = "0.0";
  static String? referralAmount = "0.0";
  static String? selectedMapType = "google";
  static bool? storyEnable = true;
  static bool? autoApproveRestaurant = true;
  static bool isRestaurantVerification = false;
  static bool isDineInEnable = false;
  static bool specialDiscountOfferEnable = false;

  static const String orderPlaced = "Order Placed";
  static const String orderAccepted = "Order Accepted";
  static const String orderRejected = "Order Rejected";
  static const String driverPending = "Driver Pending";
  static const String driverRejected = "Driver Rejected";
  static const String orderShipped = "Order Shipped";
  static const String orderInTransit = "In Transit";
  static const String orderCompleted = "Order Completed";

  static CurrencyModel? currencyModel = CurrencyModel(symbol: "$", decimalDigits: 2, symbolAtRight: false);

  static Color statusColor({required String? status}) {
    return AppThemeData.secondary300;
  }

  static String orderId({String orderId = ''}) {
    return "#$orderId";
  }

  static String amountShow({required String? amount}) {
    return "$amount";
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

  static Color statusText({required String? status}) {
      return AppThemeData.grey50;
  }
}

extension StringExtension on String {
  String capitalizeString() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
