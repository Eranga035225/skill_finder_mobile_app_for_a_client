import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';
import 'package:skill_finder/components/custom_button.dart';
import 'package:skill_finder/providers/user_provider.dart';
import 'package:skill_finder/screens/service_provider_list.dart';
import 'package:skill_finder/utils/custom_colors.dart';

import '../utils/categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Categories'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Column(
          children: [
            // --- GRID VIEW ---
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                ),
                itemCount: Categories.categories.length,
                itemBuilder: (context, index) {
                  final category = Categories.categories[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ServiceProviderList(categoryName: category.type),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 27),
                            category.icon,
                            SizedBox(width: 15),
                            Text(
                              category.type,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 5),

            // --- ADMIN ONLY BUTTON ---
            Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                final user = userProvider.user;

                if (user == null) {
                  return SizedBox.shrink(); // hide while loading
                }

                if (user.role != "Admin") {
                  return SizedBox.shrink(); // hide button for normal users
                }

                return CustomButton(
                  buttonColor: CustomColors.primaryColor,
                  text: "Add new Service Provider",
                  onTap: () {
                    Logger().f("Admin Panel Accessed by ${user.name}");
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
