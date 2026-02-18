import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:driver/models/currency_model.dart';
import 'package:driver/models/language_model.dart';
import 'package:driver/models/mail_setting.dart';
import 'package:driver/models/tax_model.dart';
import 'package:driver/models/user_model.dart';
import 'package:driver/models/zone_model.dart';
import 'package:driver/themes/app_them_data.dart';
import 'package:driver/utils/preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class Constant {
  static String userRoleDriver = 'driver';
  static String userRoleCustomer = 'customer';
  static String userRoleVendor = 'vendor';


  static ShippingAddress selectedLocation = ShippingAddress();
  static LocationData? locationDataFinal;

  static UserModel? userModel;
  static const globalUrl = "Frontend Only";

  static bool singleOrderReceive = false;
  static String driverLocationUpdate = '50';
  static String minimumDepositToRideAccept = '0.0';
  static String minimumAmountToWithdrawal = '0.0';


  static bool isDriverVerification = false;

  static ZoneModel? selectedZone;

  static String mapAPIKey = "";
  static String placeHolderImage = "";

  static String senderId = '';
  static String jsonNotificationFileURL = '';

  static String distanceType = "km";
  static String? referralAmount = "0.0";

  static String googlePlayLink = "";
  static String appStoreLink = "";
  static String appVersion = "1.0.0";
  static String termsAndConditions = "";
  static String privacyPolicy = "";
  static String supportURL = "";
  static String minimumAmountToDeposit = "0.0";
  static String? mapType = "inappmap";

  static const String orderPlaced = "Order Placed";
  static const String orderAccepted = "Order Accepted";
  static const String orderRejected = "Order Rejected";
  static const String driverPending = "Driver Pending";
  static const String driverAccepted = "Driver Accepted";
  static const String driverRejected = "Driver Rejected";
  static const String orderShipped = "Order Shipped";
  static const String orderInTransit = "In Transit";
  static const String orderCompleted = "Order Completed";

  static CurrencyModel? currencyModel = CurrencyModel(symbol: "$", decimalDigits: 2, symbolAtRight: false);
  static List<TaxModel>? taxList = [];

  static MailSettings? mailSettings;

  static String selectedMapType = 'google';

  static String amountShow({required String? amount}) {
    return "$amount";
  }

  static Color statusText({required String? status}) {
    return AppThemeData.grey50;
  }

  static Color statusColor({required String? status}) {
    return AppThemeData.secondary300;
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
