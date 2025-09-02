import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../Model/model.dart'; // Yahan Product model import karna hai

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Color> colors = [Colors.green, Colors.orange, Colors.purple];
  int selectedVariant = 0;
  // Example variants (could be different pack sizes or flavors)
  List<String> variants = ["125 gm", "250 gm", "500 gm"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: size.height * 0.61,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Hero(
                tag: widget.product.name,
                transitionOnUserGestures: true,
                child: Image.network(
                  widget.product.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: Transform.translate(
                  offset: const Offset(0, 1),
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 65,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product name, brand & price
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeInUp(
                                child: Text(
                                  widget.product.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              FadeInUp(
                                delay: const Duration(milliseconds: 200),
                                child: Text(
                                  widget.product.brand,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          FadeInUp(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Price: ${widget.product.price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "Discount: ${widget.product.discountPrice}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Product description
                      FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: Text(
                          "${widget.product.name} is a high-quality Hakeem product, carefully prepared to ensure safety, purity, and effectiveness.",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade700),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Variants (e.g., pack sizes)
                      FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: const Text(
                          "Available Variants",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: variants.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedVariant = index;
                                });
                              },
                              child: FadeInUp(
                                delay: Duration(milliseconds: index * 100),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: selectedVariant == index ? 3 : 0,
                                      color: selectedVariant == index
                                          ? Colors.blue
                                          : Colors.transparent,
                                    ),
                                    shape: BoxShape.circle,
                                    color: selectedVariant == index
                                        ? colors[index]
                                        : colors[index].withOpacity(0.5),
                                  ),
                                  height: 60,
                                  width: 60,
                                  child: Center(
                                    child: Text(
                                      variants[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: selectedVariant == index
                                            ? Colors.white
                                            : Colors.black54,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Buy Now button
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 15),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
