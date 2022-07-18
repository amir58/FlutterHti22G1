void main() {

  var screenOne = ScreenOne(screenName: "LoginScreen");

  // BaseScreen baseScreen = BaseScreen(screenName: '');

}


// Check Wifi
// Check Data
// Check Number
abstract class BaseScreen{

  String screenName;

  BaseScreen({required this.screenName});

  void checkCycle() {
    if (isWifiEnabled()) {
      showErrorMessage("Turn off Wifi");
      return;
    }

    if (isDataEnabled()) {
      checkPhoneNumberCycle();
    } else {
      showErrorMessage("Turn on data");
    }
  }

  void checkPhoneNumberCycle() {
    if (isNumberValid()) {
      // navigate to main screen
    } else {
      showErrorMessage("Phone number is invalid");
    }
  }

  bool isWifiEnabled() => false;

  bool isDataEnabled() => true;

  bool isNumberValid() => true;

  void showErrorMessage(String message) {
    print(message);
  }

  void getData();

}

class ScreenOne extends BaseScreen{
  ScreenOne({required super.screenName});

  void build() {
    super.checkCycle();

    super.showErrorMessage("Invalid");
  }

  @override
  void showErrorMessage(String message){
    print('=> $message <=');
  }

  @override
  void getData() {

  }

}

class ScreenTwo extends BaseScreen {
  ScreenTwo({required super.screenName});

  void build() {
    super.checkCycle();

    showErrorMessage("Error");
  }

  @override
  void showErrorMessage(String message){
    super.showErrorMessage(message);
    print('= - = - = - = - = - = - =');
  }

  @override
  void getData() {
    // TODO: implement getData
  }

}

abstract class ScreenThree extends BaseScreen{
  ScreenThree({required super.screenName});

  void checkCycle() {
    if (isWifiEnabled()) {
      showErrorMessage("Turn off Wifi");
      return;
    }

    if (isDataEnabled()) {
      checkPhoneNumberCycle();
    } else {
      showErrorMessage("Turn on data");
    }
  }

  void checkPhoneNumberCycle() {
    if (isNumberValid()) {
      // navigate to main screen
    } else {
      showErrorMessage("Phone number is invalid");
    }
  }

  bool isWifiEnabled() => false;

  bool isDataEnabled() => true;

  bool isNumberValid() => true;

  void showErrorMessage(String message) {
    print(message);
  }


}

class Test extends ScreenThree {
  Test({required super.screenName});

  @override
  void getData() {
    // TODO: implement getData
  }

  @override
  void startLoadingAnimation() {

  }

  @override
  void stopLoadingAnimation() {
    // TODO: implement stopLoadingAnimation
  }

}

class LoadingAnimation{

  void startLoadingAnimation(){
    print('start loading');
  }

  void stopLoadingAnimation(){
    print('stop loading');
  }

}
