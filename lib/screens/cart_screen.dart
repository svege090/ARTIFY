import 'package:flutter/material.dart';
import '../models/product.dart';

// Dummy cart list for now
final List<CartItem> cartItems = [
  CartItem(product: Product(
    id: '1',
    name: 'Watercolor Set',
    description: 'High-quality watercolor paints with vibrant pigments.',
    price: 15.99,
    image: 'assets/images/watercolor.png',
    category: 'Colors',
  ), quantity: 1),
  CartItem(product: Product(
    id: '5',
    name: 'Brushes',
    description: 'Elegant pen set for beautiful handwriting.',
    price: 14.25,
    image: 'assets/images/brushes.png',
    category: 'Pens',
  ), quantity: 2),
];

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _incrementQty(CartItem item) {
    setState(() => item.quantity++);
  }

  void _decrementQty(CartItem item) {
    if (item.quantity > 1) {
      setState(() => item.quantity--);
    }
  }

  void _removeItem(CartItem item) {
    setState(() => cartItems.remove(item));
  }

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.asset(item.product.image, width: 50),
                        title: Text(item.product.name),
                        subtitle: Text('\$${item.product.price.toStringAsFixed(2)} x ${item.quantity}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => _decrementQty(item),
                            ),
                            Text(item.quantity.toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => _incrementQty(item),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removeItem(item),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Total: \$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/checkout');
                        },
                        child: const Text('Proceed to Checkout'),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
