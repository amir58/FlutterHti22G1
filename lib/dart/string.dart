import 'dart:math';

void main() {
  String welcomeText = "Welcome in flutter course";

  print(welcomeText.length);
  print(welcomeText.isEmpty);
  print(welcomeText.isNotEmpty);

  print(welcomeText.substring(8, 10));
  print(welcomeText.toLowerCase().contains('WELCOME'.toLowerCase()));

  print(welcomeText.toUpperCase());
  print(welcomeText.toLowerCase());

  // +201116036522 , 01116036522 , +20111 6036 522 , +20111-6036-522
  // 0111 6036 522 , 0111-6036-522 , 00201116036522
  String phone = "+20111 6036-002";

  print(phone.startsWith("+2"));
  print(phone.startsWith("002"));
  print(phone.startsWith("01"));

  phone = phone.replaceAll("+2", "").replaceAll(" ", "").replaceAll("-", "");

  if (phone.startsWith("002")) {
    phone = phone.replaceFirst("002", "");
  }

  print(phone);

  String dateTime = "27/6/2022-8:41 PM";
  var dateTimes = dateTime.split("-");
  print(dateTimes.length);
  if (dateTimes.length > 0) {
    print(dateTimes[0]);
  }
  if(dateTimes.length > 1){

  print(dateTimes[1]);
  }

  String email = " amir@gmail.com ";
  print(email.length);
  print(email.trim().length);


}
