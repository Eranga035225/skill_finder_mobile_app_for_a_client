import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:skill_finder/components/custom_button.dart';
import 'package:skill_finder/components/custom_text_field.dart';
import 'package:skill_finder/components/number_stepper.dart';
import 'package:skill_finder/controllers/service_provider_controller.dart';
import 'package:skill_finder/utils/custom_colors.dart';
import 'package:skill_finder/utils/custom_dialogs.dart';

class ServiceProvidersAddScreen extends StatefulWidget {
  const ServiceProvidersAddScreen({super.key});

  @override
  State<ServiceProvidersAddScreen> createState() =>
      _ServiceProvidersAddScreenState();
}

class _ServiceProvidersAddScreenState extends State<ServiceProvidersAddScreen> {
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();

  int _initialRating = 1;
  int _yearsOfExperience = 0;
  String? selectedCategory;

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add Service Provider',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: "Provider Name",
              controller: _nameController,
            ),
            CustomTextField(
              label: "Contact Number",
              keyboardType: TextInputType.number,
              controller: _contactController,
            ),
            CustomTextField(
              label: "Provider's Email",
              controller: _emailController,
            ),
            NumberStepper(
              label: "Years of Experience",
              min: 0,
              max: 50,
              initialValue: _yearsOfExperience,
              onChanged: (value) {
                setState(() {
                  _yearsOfExperience = value;
                });
              },
            ),
            NumberStepper(
              label: "Initial Ratings",
              min: 1,
              max: 5,
              initialValue: _initialRating,
              onChanged: (value) {
                setState(() {
                  _initialRating = value;
                });
              },
            ),
            SizedBox(height: 8),
            Text("Select Category"),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              decoration: InputDecoration(
                labelText: "Category",
                border: OutlineInputBorder(),
              ),
              items:
                  [
                    "carpenters",
                    "plumbers",
                    "electricians",
                    "painters",
                    "masons",
                    "gardeners",
                  ].map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              buttonColor: CustomColors.primaryColor,
              text: "Add Provider",
              onTap: () async {
                // basic validation
                if (_nameController.text.trim().isEmpty) {
                  CustomDialogs.showErrorSnackBar(
                    context,
                    'Please enter provider name',
                  );
                  return;
                }
                if (_contactController.text.trim().isEmpty) {
                  CustomDialogs.showErrorSnackBar(
                    context,
                    'Please enter contact number',
                  );
                  return;
                }
                if (_emailController.text.trim().isEmpty) {
                  CustomDialogs.showErrorSnackBar(
                    context,
                    'Please enter email',
                  );
                  return;
                }
                if (selectedCategory == null) {
                  CustomDialogs.showErrorSnackBar(
                    context,
                    'Please select a category',
                  );
                  return;
                }

                EasyLoading.show(status: 'Saving...');

                final success = await ServiceProviderController()
                    .createAndSaveProvider(
                      name: _nameController.text.trim(),
                      contactNumber: _contactController.text.trim(),
                      email: _emailController.text.trim(),
                      yearsOfExperience: _yearsOfExperience,
                      initialRating: _initialRating,
                      category: selectedCategory?.toLowerCase(),
                    );

                EasyLoading.dismiss();
                if (!context.mounted) return;

                if (success) {
                  CustomDialogs.showSuccessSnackBar(
                    context,
                    'Service provider added',
                  );
                  Navigator.pop(context); // go back to previous screen
                } else {
                  CustomDialogs.showErrorSnackBar(
                    context,
                    'Failed to add provider. Please try again.',
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
