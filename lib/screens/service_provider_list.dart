import 'package:flutter/material.dart';
import 'package:skill_finder/models/service_provider_model.dart';

class ServiceProviderList extends StatefulWidget {
  const ServiceProviderList({super.key});

  @override
  State<ServiceProviderList> createState() => _ServiceProviderListState();
}

class _ServiceProviderListState extends State<ServiceProviderList> {
  List<ServiceproviderModel> serviceProviders = [
    ServiceproviderModel(
      name: 'John Doe',
      description: 'Expert carpenter with 10 years of experience',
      image: 'assets/images/carpenter1.png',
      rating: 4.8,
    ),
    ServiceproviderModel(
      name: 'Jane Smith',
      description: 'Professional carpenter specializing in custom furniture',
      image: 'assets/images/carpenter2.png',
      rating: 4.6,
    ),
    ServiceproviderModel(
      name: 'Mike Johnson',
      description: 'Skilled carpenter for home renovations and repairs',
      image: 'assets/images/carpenter3.png',
      rating: 4.9,
    ),
    ServiceproviderModel(
      name: 'Emily Davis',
      description: 'Creative carpenter with a focus on modern designs',
      image: 'assets/images/carpenter4.png',
      rating: 4.7,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Carpenters',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text(
                    'Search for services',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Top Carpenters',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: serviceProviders.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          serviceProviders[index].image,
                        ),
                        radius: 30,
                      ),
                      title: Text(
                        serviceProviders[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(serviceProviders[index].description),
                      trailing: Text(
                        serviceProviders[index].rating.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
