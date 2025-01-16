// import 'package:epsi_shop/ui/pages/detail.page.dart';
import 'package:epsi_shop/ui/pages/detail.page.dart';
import 'package:epsi_shop/ui/pages/list_product_page.dart';
// import 'package:epsi_shop/ui/pages/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = GoRouter(routes: [
    GoRoute(path: "/", builder: (_, __) => ListProductPage(), routes: [
      GoRoute(path: "detail", builder: (_, __) => DetailPage()),
    ]),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
