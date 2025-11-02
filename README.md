# E-commerce Flutter App

This is an e-commerce Flutter app that allows users to browse and purchase products online.



https://github.com/user-attachments/assets/7b9417ee-e51b-4678-96ba-ab66970149d8



## Project Structure

```plaintext
lib/
├── bindings/
│   └── general_bindings.dart
├── commons/
│   └── styles/
│       └── spacing_style.dart
├── widgets/
│   ├── appbar/
│   ├── brand/
│   ├── custom_shapes/
│   ├── favourite_icon/
│   ├── icons/
│   ├── image_text_widget/
│   ├── images/
│   ├── loader/
│   ├── products/
│   │   ├── brand_title.dart
│   │   ├── divider_with_text.dart
│   │   ├── promo_slider.dart
│   │   ├── verified_brand_title_text.dart
│   │   └── product_price_text.dart
├── localization/
├── navigation/
│   └── navigation_menu.dart
├── routes/
│   ├── app_routes.dart
│   └── routes.dart
├── utils/
│   ├── constants/
│   ├── device/
│   ├── exceptions/
│   ├── formatters/
│   ├── helpers/
│   ├── http/
│   ├── loader/
│   ├── local_storage/
│   ├── logging/
│   ├── popup/
│   ├── shimmer/
│   ├── theme/
│   └── validator/
├── app.dart
├── firebase_options.dart
└── main.dart

features/
├── authentications/
├── home/
├── personalizations/
└── shop/
├── controllers/
├── models/
└── screens/
├── all_products/
├── brand/
├── cart/
├── checkout/
├── product_details/
├── product_reviews/
├── order/
├── sub_category/
└── product/
```


## Project Motive

The motive of this project is to create an e-commerce app that allows users to easily browse and purchase products online. The app is designed to be user-friendly and provide a seamless shopping experience.

## Screen Descriptions


### Sign Up Screen
<table>
<tr>
<td width="20%">
  <img width="200" height="450" alt="Sign Up Screen" src="https://github.com/user-attachments/assets/7e14af7a-025d-438e-8609-41a15853e52c" />
</td>
<td width="30%" valign="center">

* Allows users to create a new account by providing their personal information: First name, Last name, User name, E-mail, phone, and password.  
* Includes options for signing up with Google, Facebook, or other platforms.  
* Requires agreement to Privacy Policy and Terms of Use.  

</td>
</tr>
</table>

### Sign In Screen

<table>
<tr>
<td width="20%">
  <img width="200" height="450" alt="login" src="https://github.com/user-attachments/assets/2d8dc2c8-c599-4326-8e74-17529e498b18" />

</td>
<td width="30%" valign="center">

* Allows users to log in to their existing accounts using email and password.
* Provides a "Remember me" option and a "Forgot password?" link.
* Includes options for signing in with Google, Facebook, or other platforms.
* Offers a link to create a new account.
</td>
</tr>
</table>


### Home Screen

<table>
<tr>
<td width="20%">
   <img width="200" height="450" alt="home" src="https://github.com/user-attachments/assets/ba508aee-1c1c-4266-9e6e-adfc976108fa" />
</td>
<td width="30%" valign="center">

* Displays a greeting message and a search bar.
* Shows popular categories and products.
* Includes a bottom navigation bar with options
   for Home, Store, Wishlist, and Profile.

</td>
</tr>
</table>



### Product Details Screen

<table>
<tr>
<td width="20%">
  <img width="200" height="450" alt="product_details" src="https://github.com/user-attachments/assets/0f6a4a8b-4745-49a5-bef0-74c057e4435d" />
</td>
<td width="30%" valign="center">

* Shows detailed information about a selected product,
 including its name, price, brand, color, and size.
* Displays product status (e.g., In stock).
* Allows users to add the product to their cart.
* Displays product rating and number of reviews. 

</td>
</tr>
</table>



### Checkout Screen


<table>
<tr>
<td width="20%">
  <img width="200" height="450" alt="checkout" src="https://github.com/user-attachments/assets/f4b29706-46d1-4f93-bcf5-f462e81a1854" />
</td>
<td width="30%" valign="center">

* Allows users to review their order, including product details,
   subtotal, shipping, tax, and order total.
* Provides an option to enter and apply a coupon code.
* Displays payment method and shipping address, with options to change them.
* Includes a "Checkout" button with the total amount..  

</td>
</tr>
</table>


## General Information

* The app uses Firebase for authentication and data storage.
* The app is written in Dart and uses the Flutter framework.
* The app is compatible with Android and iOS devices.
* The project is structured with feature-based organization, separating authentication, home, personalizations, and shop functionalities.
* The `lib/widgets` directory contains reusable UI components.
* The `lib/utils` directory contains helper functions, constants, and other utility classes.
* The `lib/routes` directory manages app navigation.
* The `lib/localization` directory handles app localization.

## 👨‍💻 Author
**Md Nasir Uddin**  
📧 Email: nasirpks36@gmail.com  
