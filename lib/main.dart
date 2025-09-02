import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:product_list_animation/detail_screen.dart';
import '../Model/model.dart'; // Yahan Product model import karna hai
void main() {
  runApp(const MyApp());
}

// ✅ MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hakeem Products Carousel',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const ProductDisplay(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ✅ ProductDisplay Screen
class ProductDisplay extends StatefulWidget {
  const ProductDisplay({super.key});

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            // Background image
            Image.network(
              products[current].image,
              fit: BoxFit.cover,
              height: size.height,
              width: size.width,
            ),

            // Gradient overlay
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: size.height * 0.33,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white.withOpacity(0.9),
                      Colors.white.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),

            // Carousel slider
            Positioned(
              bottom: 5,
              height: size.height * 0.7,
              width: size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: size.height * 0.7,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                ),
                items: products.map((product) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(product: product),
                              ),
                            
                        
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // Product image
                                  Hero(
                                    tag: product.name,
                                    child: Container(
                                      height: 250,
                                      width: size.width * 0.55,
                                      margin: const EdgeInsets.only(top: 20),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.network(
                                        product.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // Product name
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),

                                  // Brand
                                  Text(
                                    product.brand,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // Price & Discount Price
                                  AnimatedOpacity(
                                    duration: const Duration(milliseconds: 500),
                                    opacity: current == products.indexOf(product)
                                        ? 1.0
                                        : 0.0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Original price
                                          Row(
                                            children: [
                                              const Icon(Icons.attach_money,
                                                  color: Colors.green, size: 20),
                                              const SizedBox(width: 5),
                                              Text(product.price,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black45,
                                                      decoration: TextDecoration
                                                          .lineThrough)),
                                            ],
                                          ),

                                          // Discount price
                                          Row(
                                            children: [
                                              const Icon(Icons.local_offer,
                                                  color: Colors.red, size: 20),
                                              const SizedBox(width: 5),
                                              Text(product.discountPrice,
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          ),

                                          // Buy Now button placeholder
                                          Row(
                                            children: const [
                                              Icon(Icons.shopping_cart,
                                                  color: Colors.black, size: 20),
                                              SizedBox(width: 5),
                                             
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
