import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce_app/utils/formatters/formatters.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.street,
      required this.city,
      required this.state,
      required this.postalCode,
      required this.country,
      this.dateTime,
      this.selectedAddress = true});

  String get formatedPhoneNo => MyFormatter.formatPhoneNumber(phoneNumber);
  static AddressModel empty() => AddressModel(
      id: '',
      name: '',
      phoneNumber: '',
      street: '',
      city: '',
      state: '',
      postalCode: '',
      country: '');



  AddressModel copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    DateTime? dateTime,
    bool? selectedAddress,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      dateTime: dateTime ?? this.dateTime,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'City': city,
      'State': state,
      'PostalCode': postalCode,
      'Country': country,
      'DateTime': dateTime,
      'SelectedAddress': selectedAddress
    };
  }

  factory AddressModel.forMap(Map<String, dynamic> data) {
  return AddressModel(
    id: data['Id'] as String? ?? '',
    name: data['Name'] as String? ?? '',
    phoneNumber: data['PhoneNumber'] as String? ?? '',
    street: data['Street'] as String? ?? '',
    city: data['City'] as String? ?? '',
    state: data['State'] as String? ?? '',
    postalCode: data['PostalCode'] as String? ?? '',
    country: data['Country'] as String? ?? '',
    
    // ✅ Handle null case before casting
    dateTime: data['DateTime'] != null && data['DateTime'] is Timestamp
        ? (data['DateTime'] as Timestamp).toDate()
        : null,

    selectedAddress: data['SelectedAddress'] as bool? ?? false,
  );
}


  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;

    return  AddressModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      city: data['City'] ?? '',
      state: data['State'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      country: data['Country'] ?? '',
      dateTime: (data['DateTime'] ?? Timestamp.now()).toDate(),
      selectedAddress: data['SelectedAddress'] ?? false
    );
  }

  @override
  String toString() {
    return '$street $city $state $postalCode $country';
  }
}
