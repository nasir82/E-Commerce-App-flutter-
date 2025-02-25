import 'package:intl/intl.dart';

class MyFormatter{

  static String formateDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount){

    return NumberFormat.currency(locale: 'en_US',symbol:'\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber){
    return "  ";
  }

  // another one international format phone number

  
}