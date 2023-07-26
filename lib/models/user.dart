// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String name;
  String email;
  String pass;
  User(
    this.name,
    this.email,
    this.pass,
  );


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'pass': pass,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['name'] as String,
      map['email'] as String,
      map['pass'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, email: $email, pass: $pass)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.pass == pass;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ pass.hashCode;

  User copyWith({
    String? name,
    String? email,
    String? pass,
  }) {
    return User(
      name ?? this.name,
      email ?? this.email,
      pass ?? this.pass,
    );
  }
}

// this is model data type defined by us. it stores our structurized data.
// for the data class we want to store

// we can pass this user class to the type of list. and access it as the  list data 