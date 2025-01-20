// // lib/model/dish.dart
// class Dish {
//   final String name;
//   final String price;
//   final String image;

//   Dish({
//     required this.name,
//     required this.price,
//     required this.image,
//   });

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     if (other is! Dish) return false;

//     return other.name == name &&
//         other.price == price &&
//         other.image == image;
//   }

//   @override
//   int get hashCode {
//     return name.hashCode ^ price.hashCode ^ image.hashCode;
//   }

//   @override
//   String toString() {
//     return 'Dish(name: $name, price: $price, image: $image)';
//   }
// }