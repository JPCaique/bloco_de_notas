import 'dart:convert';

class BlocoDeNotas {
  String? id;
  String? titulo;
  String? texto;
  BlocoDeNotas({
    this.id,
    this.titulo,
    this.texto,
  });

  BlocoDeNotas copyWith({
    String? id,
    String? titulo,
    String? texto,
  }) {
    return BlocoDeNotas(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      texto: texto ?? this.texto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'texto': texto,
    };
  }

  factory BlocoDeNotas.fromMap(Map<String, dynamic> map) {
    return BlocoDeNotas(
      id: map['id'] != null ? map['id'] as String : null,
      titulo: map['titulo'] != null ? map['titulo'] as String : null,
      texto: map['texto'] != null ? map['texto'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BlocoDeNotas.fromJson(String source) => BlocoDeNotas.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BlocoDeNotas(id: $id, titulo: $titulo, texto: $texto)';

  @override
  bool operator ==(covariant BlocoDeNotas other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.titulo == titulo &&
      other.texto == texto;
  }

  @override
  int get hashCode => id.hashCode ^ titulo.hashCode ^ texto.hashCode;
}
