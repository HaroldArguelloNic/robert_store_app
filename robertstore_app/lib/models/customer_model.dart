import 'package:flutter/material.dart';

class CustomerModel {
  final int idCustomer;
  final int idUser;
  final String nameCustomer;
  final String lastNameCustomer;
  final Characters rucCustomer;
  final String addressCustomer;
  final String phoneCustomer;

  CustomerModel({
    required this.idCustomer,
    required this.idUser,
    required this.nameCustomer,
    required this.lastNameCustomer,
    required this.rucCustomer,
    required this.addressCustomer,
    required this.phoneCustomer,
  });

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
        idCustomer: map['idCustomer'],
        idUser: map['idUser'],
        nameCustomer: map['nameCustomer'],
        lastNameCustomer: map['lastNameCustomer'],
        rucCustomer: map['rucCustomer'],
        addressCustomer: map['addressCustomer'],
        phoneCustomer: map['phoneCustomer']);
  }
}
