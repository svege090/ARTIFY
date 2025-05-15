import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';
import '../models/product.dart';
import '../widgets/custom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  List<Product> get filteredProducts {
    if (selectedCategory == 'All') return mockProducts;
    return mockProducts.where((p) => p.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Artify Store')),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ['All', 'Colors', 'Pens', 'Papers']
                  .map((cat) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChoiceChip(
                          label: Text(cat),
                          selected: selectedCategory == cat,
                          onSelected: (_) => setState(() => selectedCategory = cat),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 3 / 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (_, i) => ProductCard(
                product: filteredProducts[i],
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(product: filteredProducts[i]),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/cart');
          }
        },
      ),
    );
  }
}
