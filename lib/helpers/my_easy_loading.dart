import 'package:flutter_easyloading/flutter_easyloading.dart';

void showErrorMessage(String errorMessage) {
  EasyLoading.showError(errorMessage);
}

void showSuccessMessage(String message) {
  EasyLoading.showSuccess(message);
}

void showInfoMessage(String message) {
  EasyLoading.showInfo(message);
}

void startLoading() {
  EasyLoading.show(
    // status: 'loading...',
  );
}

void stopLoading() {
  EasyLoading.dismiss();
}
