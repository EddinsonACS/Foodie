import "package:customer/models/mock_types.dart";
import "package:customer/models/mock_types.dart";
import 'package:customer/constant/constant.dart';
import 'package:customer/models/currency_model.dart';
import 'package:customer/utils/fire_store_utils.dart';
import 'package:get/get.dart';

class GlobalSettingController extends GetxController {
  @override
  void onInit() {
    getCurrentCurrency();
    super.onInit();
  }

  getCurrentCurrency() async {
    // Mock currency
    Constant.currencyModel = CurrencyModel(id: "1", code: "USD", decimalDigits: 2, enable: true, name: "US Dollar", symbol: "\$", symbolAtRight: false);
    await FireStoreUtils().getSettings();
  }
}
