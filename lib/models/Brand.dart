import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
part 'Brand.g.dart';

@HiveType(typeId: 3)
class Brand {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? image;
  Brand([
    this.id,
    this.name,
    this.image,
  ]);

  Brand copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return Brand(
      id ?? this.id,
      name ?? this.name,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      map['id'],
      map['name'],
      map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Brand.fromJson(String source) => Brand.fromMap(json.decode(source));

  @override
  String toString() => 'Brand(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Brand &&
      other.id == id &&
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
