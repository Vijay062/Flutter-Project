class Shopkeeper {
  final String id;
  final String shopname;
  final String ownername;
  final String email;
  final String password;
  final String mobile;
  final String address;

  Shopkeeper({
    required this.id,
    required this.shopname,
    required this.ownername,
    required this.email,
    required this.password,
    required this.mobile,
    required this.address,
  });

  factory Shopkeeper.fromJson(Map<String, dynamic> json) {
    return Shopkeeper(
      id: json['_id'] ?? '',
      shopname: json['shopname'] ?? '',
      ownername: json['ownername'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      mobile: json['mobile'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
