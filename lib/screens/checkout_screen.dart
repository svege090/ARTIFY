import 'package:flutter/material.dart';
import 'order_confirmed_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Shipping Information', style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(decoration: const InputDecoration(labelText: 'Name')),
            TextFormField(decoration: const InputDecoration(labelText: 'Address')),
            TextFormField(decoration: const InputDecoration(labelText: 'City')),
            TextFormField(decoration: const InputDecoration(labelText: 'Zip Code')),

            const SizedBox(height: 16),
            const Text('Payment Method', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'card', child: Text('Credit Card')),
                DropdownMenuItem(value: 'paypal', child: Text('PayPal')),
              ],
              onChanged: (_) {},
              decoration: const InputDecoration(labelText: 'Select Payment'),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderConfirmedScreen()));
              },
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
