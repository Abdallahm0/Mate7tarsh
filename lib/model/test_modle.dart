class TestModle {
  final String img;
  final String name;
  final String cuisineType;
  final String location;
  final String description;
  final double rating;

  TestModle({
    required this.img,
    required this.name,
    required this.cuisineType,
    required this.location,
    required this.description,
    required this.rating,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TestModle) return false;

    return other.img == img &&
        other.name == name &&
        other.cuisineType == cuisineType &&
        other.location == location &&
        other.description == description &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return img.hashCode ^
        name.hashCode ^
        cuisineType.hashCode ^
        location.hashCode ^
        description.hashCode ^
        rating.hashCode;
  }

  @override
  String toString() {
    return 'TestModle(img: $img, name: $name, cuisineType: $cuisineType, location: $location, description: $description, rating: $rating)';
  }

  static fromJson(item) {}
}