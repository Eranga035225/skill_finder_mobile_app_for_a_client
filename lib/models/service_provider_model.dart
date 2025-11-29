// lib/models/service_provider_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceProviderModel {
  final String id; // Firestore doc id
  final String name;
  final String contactNumber;
  final String email;
  final int yearsOfExperience;
  final int initialRating; // 1–5
  final String? category; // optional
  final String createdBy; // uid of admin who added
  final DateTime createdAt;

  ServiceProviderModel({
    required this.id,
    required this.name,
    required this.contactNumber,
    required this.email,
    required this.yearsOfExperience,
    required this.initialRating,
    required this.createdBy,
    required this.createdAt,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contactNumber': contactNumber,
      'email': email,
      'yearsOfExperience': yearsOfExperience,
      'initialRating': initialRating,
      'category': category,
      'createdBy': createdBy,
      'createdAt': createdAt.toUtc(),
    };
  }

  factory ServiceProviderModel.fromMap(String id, Map<String, dynamic> data) {
    return ServiceProviderModel(
      id: id,
      name: data['name'] ?? '',
      contactNumber: data['contactNumber'] ?? '',
      email: data['email'] ?? '',
      yearsOfExperience: (data['yearsOfExperience'] ?? 0) as int,
      initialRating: (data['initialRating'] ?? 1) as int,
      category: data['category'],
      createdBy: data['createdBy'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
