class UserModel {

  late String? id;
  late String? name;
  late String? email;
  late String? urlImage;
  late List<dynamic>? pedidos;
  late List<dynamic>? carrinho;

  UserModel({this.id, this.name, this.email, this.urlImage, this.pedidos, this.carrinho});

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "urlImage": urlImage,
    "pedidos" : pedidos,
    "carrinho" : carrinho
  };

  UserModel.fromMap(Map<String, dynamic> json){
    id = json["id"] ?? "";
    name = json["name"] ?? "";
    email = json["email"] ?? "";
    urlImage =json["urlImage"] ?? "";
    pedidos = json["pedidos"] ?? [];
    carrinho =  json["carrinho"] ?? [];
  }
}
