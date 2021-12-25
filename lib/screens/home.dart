import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/providers/providers.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:flutter_ecommerce_app/widgets/home_carousel.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AfterLayoutMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProvider, ProductsProvider>(
      builder: (context, userProvider, productsProvider, _) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Welcome ' + userProvider.currentUser.name),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, CartScreen.id),
              icon: Icon(Icons.shopping_basket),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: [
            HomeCarousel(
              images: [
                'https://www.taylorandscott.com.au/wp-content/uploads/2016/06/iStock_000081037361_Large-1024x680.jpg',
                'https://s3.eu-west-1.amazonaws.com/prod.news.product.which.co.uk/news/wp-content/uploads/2021/06/MAIN-13.jpg',
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Categories',
                          style: GoogleFonts.poppins(),
                        ),
                        TextButton(
                          onPressed: productsProvider.categories.isNotEmpty
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CategoryListScreen(),
                                    ),
                                  );
                                }
                              : null,
                          child: Text(
                            'View all',
                            style: GoogleFonts.poppins(),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 96,
                    width: double.infinity,
                    child: productsProvider.isCategoryLoading
                        ? Center(child: CircularProgressIndicator())
                        : productsProvider.categories.isEmpty
                            ? Center(child: Text('No Categories Found 😞'))
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                itemCount: productsProvider.categories.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: CategoryCard(
                                      category:
                                          productsProvider.categories[index]),
                                ),
                              ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest Products',
                          style: GoogleFonts.poppins(),
                        ),
                        TextButton(
                          onPressed: productsProvider.products.isNotEmpty
                              ? () => Navigator.pushNamed(
                                    context,
                                    ProductListScreen.id,
                                  )
                              : null,
                          child: Text(
                            'View all',
                            style: GoogleFonts.poppins(),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 210,
                    width: double.infinity,
                    child: productsProvider.isProductLoading
                        ? Center(child: CircularProgressIndicator())
                        : productsProvider.products.isEmpty
                            ? Center(child: Text('No Products Found 😞'))
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                itemCount: productsProvider.products.length,
                                itemBuilder: (context, index) => ProductCard(
                                  product: productsProvider.products[index],
                                ),
                              ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Electronics',
                          style: GoogleFonts.poppins(),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            ProductListScreen.id,
                          ),
                          child: Text(
                            'View all',
                            style: GoogleFonts.poppins(),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // SizedBox(
                  //   height: 210,
                  //   width: double.infinity,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     padding: EdgeInsets.symmetric(horizontal: 4),
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) => ProductCard(),
                  //   ),
                  // ),
                  // const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Provider.of<ProductsProvider>(context, listen: false).getCategories();
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
  }
}
