import 'dart:convert';

import 'package:epsi_shop/bo/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatelessWidget {
  Future<void> sendPurchaseRequest(Cart cart) async {
    final url = Uri.parse('http://ptsv3.com/t/EPSISHOPC1/');

    final List<Map<String, dynamic>> products = cart.getAll().map((product) {
      return {
        "title": product.title,
        "price": product.price,
      };
    }).toList();

    final Map<String, dynamic> body = {
      "products": products,
      "total_ht": cart.totalPriceHt,
      "total_ttc": cart.totalPriceTtc,
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Commande envoyée avec succès !");
      } else {
        print("Erreur : ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Erreur de requête : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Panier'),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          final items = cart.getAll();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx, index) {
                    final product = items[index];
                    return ListTile(
                      leading: Image.network(
                        product.image,
                        width: 90,
                        height: 90,
                      ),
                      title: Text(product.title),
                      subtitle: Text(product.getPrice()),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart),
                        onPressed: () {
                          cart.removeProduct(product);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Total HT : ${cart.totalPriceHt} €'),
                    Text('Total TTC : ${cart.totalPriceTtc} €'),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        await sendPurchaseRequest(cart);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Commande envoyée !')),
                        );
                      },
                      child: Text('Procéder au paiement'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
