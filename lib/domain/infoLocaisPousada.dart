class InfoLocaisPousada {
  late String nome;
  late String imagem;
  late String email;
  late String desc;
  late String endereco;


  InfoLocaisPousada(
      {required this.nome,
      required this.imagem,
      required this.email,
      required this.desc,
      required this.endereco,
});

InfoLocaisPousada.fromJson(Map<String, dynamic> json){

nome = json['nome'];
imagem = json['imagem'];
email = json['email'];
desc = json['desc'];
endereco= json['endereco'];



}

Map<String, dynamic> toJson() {
 final Map<String, dynamic> data = new Map<String, dynamic>();
 data['nome'] = this.nome;
 data['imagem'] = this.imagem;
 data['email'] = this.email;
 data['desc'] = this.desc;
 data['endereco']=this.endereco;

 return data;

}

}