class InfoMB {
  late String titulo;
  late String imagem;
  late String email;
  late String desc;
  late String genero;
  late String instagram;
  late String pshow;

  InfoMB(
      {required this.titulo,
      required this.imagem,
      required this.email,
      required this.desc,
      required this.genero,
      required this.instagram,
      required this.pshow});

  InfoMB.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    imagem = json['imagem'];
    email = json['email'];
    desc = json['desc'];
    genero = json['genero'];
    instagram = json['instagram'];
    pshow = json['pshow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['titulo'] = this.titulo;
    data['imagem'] = this.imagem;
    data['email'] = this.email;
    data['desc'] = this.desc;
    data['genero'] = this.genero;
    data['instagram'] = this.instagram;
    data['pshow'] = this.pshow;

    return data;
  }
}
