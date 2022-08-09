import 'dart:convert';

class CategoryModal {
  String? id;
  String name;
  String icone;
  String? parent_id;

  CategoryModal({
    this.id,
    required this.name,
    required this.icone,
    this.parent_id,
  });

  CategoryModal copyWith({
    String? id,
    String? name,
    String? icone,
    String? parent_id,
  }) {
    return CategoryModal(
      id: id ?? this.id,
      name: name ?? this.name,
      icone: icone ?? this.icone,
      parent_id: parent_id ?? this.parent_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icone': icone,
      'parent_id': parent_id,
    };
  }

  factory CategoryModal.fromMap(Map<String, dynamic> map) {
    return CategoryModal(
      id: map['id'],
      name: map['name'] ?? '',
      icone: map['icone'] ?? '',
      parent_id: map['parent_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModal.fromJson(String source) => CategoryModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModal(id: $id, name: $name, icone: $icone, parent_id: $parent_id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryModal &&
      other.id == id &&
      other.name == name &&
      other.icone == icone &&
      other.parent_id == parent_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      icone.hashCode ^
      parent_id.hashCode;
  }
}
