

class Login {
  late String email;
  late String senha;

  Login({required this.email, required this.senha});

  Login.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['senha'] = senha;
    return data;
  }
}
