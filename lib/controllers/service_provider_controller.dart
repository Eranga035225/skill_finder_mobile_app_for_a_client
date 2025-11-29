import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/web.dart';
import 'package:skill_finder/models/service_provider_model.dart';

class ServiceProviderController {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  /// Add a new service provider to Firestore
  Future<bool> addServiceProvider(ServiceProviderModel provider) async {
    try {
      await _firestore
          .collection('serviceProviders')
          .doc(provider.id)
          .set(provider.toMap());
      return true;
    } catch (e) {
      Logger().e("Error adding service provider: $e");
      return false;
    }
  }

  /// Helper to create model and save in one go
  Future<bool> createAndSaveProvider({
    required String name,
    required String contactNumber,
    required String email,
    required int yearsOfExperience,
    required int initialRating,
    String? category,
  }) async {
    final currentUser = _auth.currentUser;
    final docRef = _firestore.collection('serviceProviders').doc();

    final provider = ServiceProviderModel(
      id: docRef.id,
      name: name,
      contactNumber: contactNumber,
      email: email,
      yearsOfExperience: yearsOfExperience,
      initialRating: initialRating,
      category: category?.toLowerCase(),
      createdBy: currentUser?.uid ?? 'unknown',
      createdAt: DateTime.now(),
    );

    try {
      await docRef.set(provider.toMap());
      return true;
    } catch (e) {
      Logger().e("Error creating service provider: $e");
      return false;
    }
  }
}
