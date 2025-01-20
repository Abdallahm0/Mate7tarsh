// To parse this JSON data, do
//
//     final email = emailFromJson(jsonString);

import 'dart:convert';

Email emailFromJson(String str) => Email.fromJson(json.decode(str));

String emailToJson(Email data) => json.encode(data.toJson());

class Email {
    int id;
    String name;
    int age;
    String email;
    String favoritePlaces;
    String favoriteFood;
    String diseases;

    Email({
        required this.id,
        required this.name,
        required this.age,
        required this.email,
        required this.favoritePlaces,
        required this.favoriteFood,
        required this.diseases,
    });

    factory Email.fromJson(Map<String, dynamic> json) => Email(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        email: json["email"],
        favoritePlaces: json["favorite_places"],
        favoriteFood: json["favorite_food"],
        diseases: json["diseases"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "email": email,
        "favorite_places": favoritePlaces,
        "favorite_food": favoriteFood,
        "diseases": diseases,
    };
}
