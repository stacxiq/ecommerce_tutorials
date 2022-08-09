import 'dart:convert';

import 'package:ecommerce_tutorials/models/categoryModal.dart';
import 'package:flutter/foundation.dart';

import 'package:hive/hive.dart';
part 'category.g.dart';

@HiveType(typeId: 4)
class CategoryModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String icone;
  @HiveField(3)
  String? parent_id;
  @HiveField(4)
  List<CategoryModal>? children;
  CategoryModel({
    this.id,
    required this.name,
    required this.icone,
    this.parent_id,
    this.children,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    String? icone,
    String? parent_id,
    List<CategoryModal>? children,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icone: icone ?? this.icone,
      parent_id: parent_id ?? this.parent_id,
      children: children ?? this.children,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icone': icone,
      'parent_id': parent_id,
      'children': children?.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'] ?? '',
      icone: map['icone'] ?? '',
      parent_id: map['parent_id'],
      children: map['children'] != null
          ? List<CategoryModal>.from(
              map['children']?.map((x) => CategoryModal.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, icone: $icone, parent_id: $parent_id, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.id == id &&
        other.name == name &&
        other.icone == icone &&
        other.parent_id == parent_id &&
        listEquals(other.children, children);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        icone.hashCode ^
        parent_id.hashCode ^
        children.hashCode;
  }
}
