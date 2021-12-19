class User {
  late final String id,
      token,
      name,
      email,
      phoneNumber,
      username,
      image,
      gender,
      role,
      shippingAddress,
      billingAddress;

  // factory constructor / factory method
  User.fromJson(Map<String, dynamic> json) {
    this.token = json['token'];
    this.id = json['data']['user']['_id'];
    this.name = json['data']['user']['name'];
    this.email = json['data']['user']['email'];
    this.phoneNumber = json['data']['user']['phone'];
    this.username = json['data']['user']['username'];
    this.image = json['data']['user']['image'];
    this.gender = json['data']['user']['gender'];
    this.role = json['data']['user']['role'];
    this.shippingAddress = json['data']['user']['shippingAddress'];
    this.billingAddress = json['data']['user']['billingAddress'];
  }
}
