import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/providers/product.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  static const String id = 'CategoryListScreen';

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, productsProvider, _) => Scaffold(
        backgroundColor: Color(0xfff5f9ff),
        appBar: AppBar(
          title: Text('Product Categories'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_basket),
            ),
          ],
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productsProvider.categories.length,
          itemBuilder: (context, index) => CategoryCard(
            category: productsProvider.categories[index],
          ),
        ),
      ),
    );
  }
}
