import "package:customer/models/mock_types.dart";
import "package:customer/models/mock_types.dart";
import 'package:customer/app/dash_board_screens/dash_board_screen.dart';
import 'package:customer/app/location_permission_screen/location_permission_screen.dart';
import 'package:customer/constant/constant.dart';
import 'package:customer/constant/show_toast_dialog.dart';
import 'package:customer/models/user_model.dart';
import 'package:customer/utils/fire_store_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailEditingController = TextEditingController().obs;
  Rx<TextEditingController> passwordEditingController = TextEditingController().obs;

  RxBool passwordVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  loginWithEmailAndPassword() async {
    ShowToastDialog.showLoader("Please wait".tr);
    // Mock login logic
    UserModel? userModel = await FireStoreUtils.getUserProfile("mock_user_123");
    if (userModel != null) {
      Constant.userModel = userModel;
      if (userModel.shippingAddress != null && userModel.shippingAddress!.isNotEmpty) {
        Constant.selectedLocation = userModel.shippingAddress!.first;
        Get.offAll(const DashBoardScreen());
      } else {
        Get.offAll(const LocationPermissionScreen());
      }
    }
    ShowToastDialog.closeLoader();
  }
}
