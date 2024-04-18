class InfoLocaisRestaurantes {
  late String imagem;
  late String titulo;
  late String email;
  late String desc;

   InfoLocaisRestaurantes(
      {required this.imagem,
      required this.titulo,
      required this.email,
      required this.desc});

  InfoLocaisRestaurantes.fromJson(Map<String, dynamic> json){
    imagem = json['imagem'];
    titulo = json['titulo'];
    email = json['email'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['imagem'] = this.imagem;
    data['titulo'] = this.titulo;
    data['email'] = this.email;
    data['desc'] = this.desc;


    return data;
  }



}
