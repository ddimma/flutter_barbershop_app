import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class BarbershopController extends GetxController {
  Rxn<BannerModel> banner = Rxn<BannerModel>();
  RxList<Barbershop> nearestBarbershops = <Barbershop>[].obs;
  RxList<Barbershop> mostRecommended = <Barbershop>[].obs;

  // Fetch data from JSON file in the project
  Future<void> fetchData() async {
    try {
      String jsonString = await rootBundle.loadString('lib/assets/v2.json');
      final jsonData = jsonDecode(jsonString);

      banner.value = BannerModel.fromJson(jsonData['banner']);
      nearestBarbershops.value = (jsonData['nearest_barbershop'] as List)
          .map((item) => Barbershop.fromJson(item))
          .toList();
      mostRecommended.value = (jsonData['list'] as List)
          .map((item) => Barbershop.fromJson(item))
          .toList();
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}

class BannerModel {
  final String image;
  final String buttonTitle;

  BannerModel({required this.image, required this.buttonTitle});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      image: json['image'],
      buttonTitle: json['button_title'],
    );
  }
}

class Barbershop {
  final String name;
  final String locationWithDistance;
  final String image;
  final double reviewRate;

  Barbershop({
    required this.name,
    required this.locationWithDistance,
    required this.image,
    required this.reviewRate,
  });

  factory Barbershop.fromJson(Map<String, dynamic> json) {
    return Barbershop(
      name: json['name'],
      locationWithDistance: json['location_with_distance'],
      image: json['image'],
      reviewRate: json['review_rate'],
    );
  }
}
