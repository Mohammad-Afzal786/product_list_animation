
// ✅ Product model
class Product {
  final String name;
  final String brand;
  final String image;
  final String price;         // Original price
  final String discountPrice; // Discounted price

  Product({
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.discountPrice,
  });
}

// ✅ Sample Hakeem products
List<Product> products = [
  Product(
    name: "Habbe Asgand",
    brand: "Hakeem B",
    image:
        "https://hakeembaqai.com/wp-content/uploads/2022/01/habbe-asgandpng.png",
    price: "Rs 250",
    discountPrice: "Rs 200",
  ),
  Product(
    name: "Majoon Azaraqi",
    brand: "Hakeem B",
    image:
        "https://hakeembaqai.com/wp-content/uploads/2022/01/majoon-azaraqi-125-gm.png",
    price: "Rs 300",
    discountPrice: "Rs 250",
  ),
  Product(
    name: "Jawarish Jalinoos",
    brand: "Hakeem B",
    image:
        "https://hakeembaqai.com/wp-content/uploads/2022/01/JAWARISH-JALINOOS-125-GM-600x600.png",
    price: "Rs 275",
    discountPrice: "Rs 225",
  ),
];
