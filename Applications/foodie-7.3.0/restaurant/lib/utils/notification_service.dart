import "package:restaurant/models/mock_types.dart";
import 'dart:developer';

class NotificationService {
  initInfo() async {
    log("Mock Notification Init");
  }

  Future<void> setupInteractedMessage() async {
    log("Mock Interacted Message Setup");
  }

  static getToken() async {
    return "mock_token";
  }

  void display(dynamic message) async {
    log('Mock Display Message');
  }
}
