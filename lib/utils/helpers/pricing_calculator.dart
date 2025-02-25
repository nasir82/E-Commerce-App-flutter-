class MyPricingCalculator{
  static double calculateTotalPrice(double productPrice,String location){

    double taxRate = getTaxRate(location);
    double taxAmount = taxRate*productPrice;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  static  String calculateShippingCost(double productPrice,String location){

    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice,String location){
     double taxRate = getTaxRate(location);
    double taxAmount = taxRate*productPrice;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRate(String location){

    //set the textrate for defferent locations

    return .15;
  }
  static double getShippingCost(String location){
    //set cost logic 
    return 5.00;
  }


}