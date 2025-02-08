import 'package:epsi_shop/bo/cart.dart';
import 'package:epsi_shop/bo/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Produit"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.image,
            height: 150,
          ),
          TitleLinePrice(product: product),
          Description(product: product),
          Spacer(),
          ButtonAddCart(product: product)
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        product.description,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class TitleLinePrice extends StatelessWidget {
  const TitleLinePrice({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            product.getPrice(),
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}

class ButtonAddCart extends StatelessWidget {
  final Product product;

  const ButtonAddCart({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {
              context.read<Cart>().addProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Produit ajouté au panier')),
              );
            },
            child: Text("Ajouter au panier")),
      ),
    );
  }
}
