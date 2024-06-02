class UserClass {
  String username;
  String password;
  String? name;
  int? phone;

  UserClass({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return ({
      "email": username,
      "password": password,
      "name":name,
      "phone":phone,
    });
  }

  get getUsername => this.username;

  set setUsername(Username) => this.username = Username;

  get getPassword => this.password;

  set setPassword(password) => this.password = password;
}
