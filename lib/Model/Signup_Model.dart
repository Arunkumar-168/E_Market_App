class SignupModel {
  final int? id;
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String confirmPassword;
  final String address;


  SignupModel({
    this.id,
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.address,
    required this.confirmPassword,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      address: json['address'],
      confirmPassword: json['confirmPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
      'address': address,
      'confirmPassword': confirmPassword,
    };
  }
}