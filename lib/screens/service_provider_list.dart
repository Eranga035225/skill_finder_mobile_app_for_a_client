import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skill_finder/models/service_provider_model.dart';

class ServiceProviderList extends StatefulWidget {
  final String categoryName;
  const ServiceProviderList({super.key, required this.categoryName});

  @override
  State<ServiceProviderList> createState() => _ServiceProviderListState();
}

class _ServiceProviderListState extends State<ServiceProviderList> {
  Stream<List<ServiceProviderModel>> _providersStream() {
    return FirebaseFirestore.instance
        .collection('serviceProviders')
        .where('category', isEqualTo: widget.categoryName.toLowerCase())
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => ServiceProviderModel.fromMap(doc.id, doc.data()),
              ) // adjust to your fromMap
              .toList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.categoryName,
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
                'Top ${widget.categoryName}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              Expanded(
                child: StreamBuilder<List<ServiceProviderModel>>(
                  stream: _providersStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No providers found'));
                    }

                    final providers = snapshot.data!;

                    return ListView.builder(
                      itemCount: providers.length,
                      itemBuilder: (context, index) {
                        final p = providers[index];

                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Text(p.name.isNotEmpty ? p.name[0] : '?'),
                          ),
                          title: Text(
                            p.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(p.email),
                          trailing: Text(
                            p.initialRating.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      },
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
