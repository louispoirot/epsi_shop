import 'package:epsi_shop/bo/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListProductPage extends StatelessWidget {
  ListProductPage({super.key});

  final listProducts = [
    Product(
      id: 1,
      name: "MacBook Pro 16",
      description:
          "Ordinateur portable Apple avec puce M2 Pro, 16 Go de RAM, 512 Go SSD",
      category: "Informatique",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 2699.99,
    ),
    Product(
      id: 2,
      name: "Nike Air Max 270",
      description:
          "Baskets légères et confortables avec une large unité Air au talon",
      category: "Chaussures",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 149.99,
    ),
    Product(
      id: 3,
      name: "iPhone 15 Pro",
      description: "Smartphone avec écran Super Retina XDR 6,1 pouces, 256 Go",
      category: "Téléphonie",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 1299.99,
    ),
    Product(
      id: 4,
      name: "Table à manger en chêne",
      description: "Table en bois massif pour 6 personnes, style contemporain",
      category: "Mobilier",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 899.99,
    ),
    Product(
      id: 5,
      name: "Machine à café Delonghi",
      description: "Machine à café automatique avec broyeur à grains intégré",
      category: "Électroménager",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 599.99,
    ),
    Product(
      id: 6,
      name: "PlayStation 5",
      description: "Console de jeu nouvelle génération avec manette DualSense",
      category: "Gaming",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 499.99,
    ),
    Product(
      id: 7,
      name: "Canapé d'angle convertible",
      description:
          "Canapé en tissu gris avec méridienne gauche et coffre de rangement",
      category: "Mobilier",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 1299.99,
    ),
    Product(
      id: 8,
      name: "Robot aspirateur Roomba",
      description:
          "Robot aspirateur intelligent avec cartographie et contrôle via smartphone",
      category: "Électroménager",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 449.99,
    ),
    Product(
      id: 9,
      name: "Apple Watch Series 9",
      description: "Montre connectée avec GPS et cellular, boîtier 45mm",
      category: "Accessoires",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 499.99,
    ),
    Product(
      id: 10,
      name: "Télévision Samsung QLED 65\"",
      description: "TV 4K UHD Smart TV avec processeur Neural Quantum",
      category: "TV & Home Cinéma",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 1799.99,
    ),
    Product(
      id: 11,
      name: "Vélo électrique Specialized",
      description: "Vélo urbain électrique avec autonomie de 80km",
      category: "Sport",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 2499.99,
    ),
    Product(
      id: 12,
      name: "Appareil photo Sony A7 IV",
      description:
          "Appareil photo hybride plein format 33MP avec objectif 28-70mm",
      category: "Photo",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 2899.99,
    ),
    Product(
      id: 13,
      name: "Lave-linge Samsung",
      description: "Lave-linge frontal 9kg avec technologie EcoBubble",
      category: "Électroménager",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 699.99,
    ),
    Product(
      id: 14,
      name: "iPad Pro 12.9",
      description: "Tablette Apple M2 avec écran Liquid Retina XDR",
      category: "Informatique",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 1449.99,
    ),
    Product(
      id: 15,
      name: "Bureau gaming RGB",
      description: "Bureau gamer avec système LED RGB et support écran intégré",
      category: "Mobilier",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      price: 299.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Produits'),
      ),
      body: ListView.builder(
        itemCount: listProducts.length,
        itemBuilder: (ctx, index) => InkWell(
          onTap: () => ctx.go("/detail"),
          child: ListTile(
            leading: Image.network(
              listProducts[index].image,
              width: 90,
              height: 90,
            ),
            title: Text(listProducts[index].name),
            subtitle: Text(listProducts[index].getPrice()),
          ),
        ),
      ),
    );
  }
}
