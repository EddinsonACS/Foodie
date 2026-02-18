// Mock classes to replace Firebase and other removed dependencies

class Timestamp {
  final int seconds;
  final int nanoseconds;
  Timestamp(this.seconds, this.nanoseconds);
  factory Timestamp.now() => Timestamp(DateTime.now().millisecondsSinceEpoch ~/ 1000, 0);
  factory Timestamp.fromDate(DateTime date) => Timestamp(date.millisecondsSinceEpoch ~/ 1000, 0);
  DateTime toDate() => DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  @override
  String toString() => "Timestamp(seconds=$seconds, nanoseconds=$nanoseconds)";
}

class GeoPoint {
  final double latitude;
  final double longitude;
  GeoPoint(this.latitude, this.longitude);
}

// Firestore Mocks
class FirebaseFirestore {
  static var instance = FirebaseFirestore();
  CollectionReference collection(String path) => CollectionReference();
}

class CollectionReference {
  DocumentReference doc([String? path]) => DocumentReference();
  Query where(String field, {dynamic isEqualTo, dynamic isGreaterThan, dynamic isLessThan, dynamic isGreaterThanOrEqualTo, dynamic arrayContains}) => Query();
  Query orderBy(String field, {bool descending = false}) => Query();
  Future<QuerySnapshot> get() async => QuerySnapshot();
  Stream<QuerySnapshot> snapshots() => Stream.empty();
  Future<DocumentReference> add(Map<String, dynamic> data) async => DocumentReference();
}

class DocumentReference {
  Future<void> set(Map<String, dynamic> data, [dynamic options]) async {}
  Future<void> update(Map<String, dynamic> data) async {}
  Future<void> delete() async {}
  Future<DocumentSnapshot> get() async => DocumentSnapshot();
  Stream<DocumentSnapshot> snapshots() => Stream.empty();
  CollectionReference collection(String path) => CollectionReference();
  String get id => "mock_id";
}

class DocumentSnapshot {
  bool get exists => true;
  Map<String, dynamic>? data() => {};
  String get id => "mock_id";
  dynamic operator [](String key) => null;
  dynamic get reference => DocumentReference();
}

class QuerySnapshot {
  List<QueryDocumentSnapshot> get docs => [];
  int get size => 0;
}

class QueryDocumentSnapshot extends DocumentSnapshot {}

class Query<T> {
  Query<T> where(String field, {dynamic isEqualTo, dynamic isGreaterThan, dynamic isLessThan, dynamic isGreaterThanOrEqualTo, dynamic arrayContains}) => this;
  Query<T> orderBy(String field, {bool descending = false}) => this;
  Query<T> limit(int limit) => this;
  Future<QuerySnapshot> get() async => QuerySnapshot();
  Stream<QuerySnapshot> snapshots() => Stream.empty();
}

// Auth Mocks
class FirebaseAuth {
  static var instance = FirebaseAuth();
  User? get currentUser => User();
  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password}) async => UserCredential();
  Future<void> signOut() async {}
  Future<void> sendPasswordResetEmail({required String email}) async {}
  Future<UserCredential> createUserWithEmailAndPassword({required String email, required String password}) async => UserCredential();
}

class User {
  String get uid => "mock_user_123";
  String? get email => "mock@example.com";
  String? get displayName => "Mock User";
  Future<void> delete() async {}
  Future<void> updatePassword(String password) async {}
  Future<void> reload() async {}
}

class UserCredential {
  User? get user => User();
}

class FirebaseAuthException implements Exception {
  final String code;
  final String? message;
  FirebaseAuthException({required this.code, this.message});
}

// Storage Mocks
class FirebaseStorage {
  static var instance = FirebaseStorage();
  Reference ref([String? path]) => Reference();
}

class Reference {
  Reference child(String path) => this;
  UploadTask putFile(dynamic file, [dynamic metadata]) => UploadTask();
  Future<String> getDownloadURL() async => "https://example.com/mock_image.png";
  Future<dynamic> getMetadata() async => null;
}

class UploadTask {
  Future<dynamic> whenComplete(void Function() action) async => null;
  dynamic get ref => Reference();
}

class SettableMetadata {
  SettableMetadata({String? contentType});
}

class RemoteMessage {
  String? get messageId => "mock_id";
  dynamic get notification => null;
  Map<String, dynamic> get data => {};
}

// App Check Mocks
class FirebaseAppCheck {
  static var instance = FirebaseAppCheck();
  Future<void> activate({dynamic webProvider, dynamic androidProvider, dynamic appleProvider}) async {}
}
class ReCaptchaV3Provider { ReCaptchaV3Provider(String key); }
enum AndroidProvider { playIntegrity }
enum AppleProvider { appAttest }

// Firebase Core Mocks
class Firebase {
  static Future<void> initializeApp({dynamic options}) async {}
}

// Payment Mocks
class PaymentGateway {
  static const wallet = _PaymentGatewayStub("wallet");
  static const cod = _PaymentGatewayStub("cod");
  final String name;
  const PaymentGateway(this.name);
}

class _PaymentGatewayStub {
  final String name;
  const _PaymentGatewayStub(this.name);
}

class Stripe {
  static String publishableKey = "";
  static String merchantIdentifier = "";
  static var instance = Stripe();
  void applySettings() {}
  Future<void> initPaymentSheet({required dynamic paymentSheetParameters}) async {}
  Future<void> presentPaymentSheet() async {}
}

class flutterStipe {
  static var Stripe = StripeMock();
}
class StripeMock {
  String publishableKey = "";
  String merchantIdentifier = "";
  var instance = StripeInstanceMock();
  void applySettings() {}
}
class StripeInstanceMock {
  void applySettings() {}
  Future<void> initPaymentSheet({required dynamic paymentSheetParameters}) async {}
  Future<void> presentPaymentSheet() async {}
}

class SetupPaymentSheetParameters {
  SetupPaymentSheetParameters({required String paymentIntentClientSecret, required bool allowsDelayedPaymentMethods, required dynamic googlePay, required bool customFlow, required dynamic style, required dynamic appearance, required String merchantDisplayName});
}

class PaymentSheetGooglePay {
  const PaymentSheetGooglePay({required String merchantCountryCode, required bool testEnv, required String currencyCode});
}

class PaymentSheetAppearance {
  const PaymentSheetAppearance({required dynamic colors});
}

class PaymentSheetAppearanceColors {
  const PaymentSheetAppearanceColors({required dynamic primary});
}

class Razorpay {
  static const EVENT_PAYMENT_SUCCESS = "success";
  static const EVENT_EXTERNAL_WALLET = "wallet";
  static const EVENT_PAYMENT_ERROR = "error";
  void on(String event, Function handler) {}
  void open(Map<String, dynamic> options) {}
}

class PaymentSuccessResponse {}
class ExternalWalletResponse {}
class PaymentFailureResponse {}

class AllInOneSdk {
  static Future startTransaction(String mid, String orderId, String amount, String txnToken, String callBackUrl, bool isStaging, bool restrictAppInvoke, bool enableAssist) async {
    return {"RESPMSG": "Txn Success"};
  }
}

class FlutterPaypalNative {
  static var instance = FlutterPaypalNative();
  static bool isDebugMode = false;
  bool canAddMorePurchaseUnit = true;
  Future<void> init({required String returnUrl, required String clientID, required dynamic payPalEnvironment, required dynamic currencyCode, required dynamic action}) async {}
  void setPayPalOrderCallback({required dynamic callback}) {}
  void addPurchaseUnit(dynamic unit) {}
  void makeOrder({required dynamic action}) {}
}

enum FPayPalEnvironment { sandbox, live }
enum FPayPalCurrencyCode { usd }
enum FPayPalUserAction { payNow }
class FPayPalOrderCallback {
  FPayPalOrderCallback({required Function onCancel, required Function onSuccess, required Function onError, required Function onShippingChange});
}
class FPayPalPurchaseUnit {
  FPayPalPurchaseUnit({required double amount, required String referenceId});
}
class FPayPalStrHelper {
  static String getRandomString(int length) => "random";
}

class StripeException implements Exception {
  final String? message;
  StripeException(this.message);
}

class Xendit {
  static String apiKey = "";
  static factory fromJson(Map<String, dynamic> json) => Xendit();
  Map<String, dynamic> toJson() => {};
}

class XenditModel {
  String? id;
  String? invoiceUrl;
  XenditModel();
  factory XenditModel.fromJson(Map<String, dynamic> json) => XenditModel();
}

// Payment Model Mocks
class PayFastModel { PayFastModel(); factory PayFastModel.fromJson(Map<String, dynamic> json) => PayFastModel(); Map<String, dynamic> toJson() => {}; }
class MercadoPagoModel { MercadoPagoModel(); factory MercadoPagoModel.fromJson(Map<String, dynamic> json) => MercadoPagoModel(); Map<String, dynamic> toJson() => {}; }
class PayPalModel { PayPalModel(); factory PayPalModel.fromJson(Map<String, dynamic> json) => PayPalModel(); Map<String, dynamic> toJson() => {}; String? paypalClient; bool? isLive; }
class StripeModel { StripeModel(); factory StripeModel.fromJson(Map<String, dynamic> json) => StripeModel(); Map<String, dynamic> toJson() => {}; String? clientpublishableKey; String? stripeSecret; }
class FlutterWaveModel { FlutterWaveModel(); factory FlutterWaveModel.fromJson(Map<String, dynamic> json) => FlutterWaveModel(); Map<String, dynamic> toJson() => {}; String? secretKey; }
class PayStackModel { PayStackModel(); factory PayStackModel.fromJson(Map<String, dynamic> json) => PayStackModel(); Map<String, dynamic> toJson() => {}; String? secretKey; String? callbackURL; }
class PaytmModel { PaytmModel(); factory PaytmModel.fromJson(Map<String, dynamic> json) => PaytmModel(); Map<String, dynamic> toJson() => {}; bool? isSandboxEnabled; String? paytmMID; String? pAYTMMERCHANTKEY; }
class WalletSettingModel { WalletSettingModel(); factory WalletSettingModel.fromJson(Map<String, dynamic> json) => WalletSettingModel(); Map<String, dynamic> toJson() => {}; }
class CodSettingModel { CodSettingModel(); factory CodSettingModel.fromJson(Map<String, dynamic> json) => CodSettingModel(); Map<String, dynamic> toJson() => {}; }
class MidTrans { MidTrans(); factory MidTrans.fromJson(Map<String, dynamic> json) => MidTrans(); Map<String, dynamic> toJson() => {}; bool? isSandbox; String? serverKey; }
class OrangeMoney { OrangeMoney(); factory OrangeMoney.fromJson(Map<String, dynamic> json) => OrangeMoney(); Map<String, dynamic> toJson() => {}; bool? isSandbox; String? merchantKey; String? auth; String? returnUrl; String? cancelUrl; String? notifUrl; }
class XenditData { XenditData(); factory XenditData.fromJson(Map<String, dynamic> json) => XenditData(); Map<String, dynamic> toJson() => {}; String? apiKey; }
class PayStackUrlModel { PayStackUrlModel(); factory PayStackUrlModel.fromJson(Map<String, dynamic> json) => PayStackUrlModel(); dynamic data; }
class GetPaymentTxtTokenModel { GetPaymentTxtTokenModel(); factory GetPaymentTxtTokenModel.fromJson(Map<String, dynamic> json) => GetPaymentTxtTokenModel(); dynamic body; }
class StripePayFailedModel { StripePayFailedModel(); factory StripePayFailedModel.fromJson(Map<String, dynamic> json) => StripePayFailedModel(); dynamic error; }
class PayStackURLGen { static Future<PayStackUrlModel?> payStackURLGen({required String amount, required String currency, required String secretKey, required dynamic userModel}) async => null; static Future<String?> getPayHTML({required dynamic payFastSettingData, required String amount, required dynamic userModel}) async => null; }

class MercadoPagoScreen { MercadoPagoScreen({required String initialURl}); }
class PayStackScreen { PayStackScreen({required String secretKey, required String callBackUrl, required String initialURl, required String amount, required String reference}); }
class OrangeMoneyScreen { OrangeMoneyScreen({required String initialURl, required String accessToken, required String amount, required dynamic orangePay, required String orderId, required String payToken}); }
class MidtransScreen { MidtransScreen({required String initialURl}); }
class XenditScreen { XenditScreen({required String initialURl, required String transId, required String apiKey}); }
class PayFastScreen { PayFastScreen({required String htmlData, required dynamic payFastSettingData}); }
