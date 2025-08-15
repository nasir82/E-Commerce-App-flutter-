import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/section_heading.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/checkout/widgets/billingpayment.dart';
import 'package:flutter_e_commerce_app/features/shop/models/payment_method_model.dart';
import 'package:flutter_e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController{
static CheckoutController get instance => Get.find();

Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;


@override
void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: "Paypal", image: ImageString.shoes);
    super.onInit();
  }

Future<dynamic> selectPaymentMethod(BuildContext context){
  return showModalBottomSheet(context: context,
   builder: (_) => SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(Sizes.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: "Select Payment Method", isShowButton: false,),
          const SizedBox(height: Sizes.spaceBtwSections,),
          PaymentTile(paymentMethod:PaymentMethodModel(name: "Paypal", image: ImageString.shoes)),
          const SizedBox(height: Sizes.spaceBtwItems/2,),
          PaymentTile(paymentMethod:PaymentMethodModel(name: "Google Pay", image: ImageString.shoes)),
          const SizedBox(height: Sizes.spaceBtwItems/2,),
          PaymentTile(paymentMethod:PaymentMethodModel(name: "Apple Pay", image: ImageString.shoes)),
          const SizedBox(height: Sizes.spaceBtwItems/2,),
          PaymentTile(paymentMethod:PaymentMethodModel(name: "Master Card", image: ImageString.shoes)),
          const SizedBox(height: Sizes.spaceBtwItems/2,),
          PaymentTile(paymentMethod:PaymentMethodModel(name: "Paytm", image: ImageString.shoes)),
          const SizedBox(height: Sizes.spaceBtwItems/2,),
          PaymentTile(paymentMethod:PaymentMethodModel(name: "Paystack", image: ImageString.shoes)),
          const SizedBox(height: Sizes.spaceBtwItems/2,),
          PaymentTile(paymentMethod:PaymentMethodModel(name: "Credit Card", image: ImageString.shoes)),
          const SizedBox(height: Sizes.spaceBtwItems/2,),
          const SizedBox(height: Sizes.spaceBtwSections,),
        ],
      ),
    ),
   )
   
   );
}
}