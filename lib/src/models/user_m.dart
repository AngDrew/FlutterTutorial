class UserModel {
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.address,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        website: json['website'] as String?,
        address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      );

  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  AddressModel? address;
}

class AddressModel {
  AddressModel({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        city: json['city'] as String?,
        street: json['street'] as String?,
        suite: json['suite'] as String?,
        zipcode: json['zipcode'] as String?,
        geo: GeoModel.fromJson(json['geo'] as Map<String, dynamic>),
      );

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoModel? geo;
}

class GeoModel {
  GeoModel({
    this.lat,
    this.lng,
  });
  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
      );
  String? lat;
  String? lng;
}

// {
//   "id": 1,
//   "name": "Leanne Graham",
//   "username": "Bret",
//   "email": "Sincere@april.biz",
//   "address": {
//     "street": "Kulas Light",
//     "suite": "Apt. 556",
//     "city": "Gwenborough",
//     "zipcode": "92998-3874",
//     "geo": {
//       "lat": "-37.3159",
//       "lng": "81.1496"
//     }
//   },
//   "phone": "1-770-736-8031 x56442",
//   "website": "hildegard.org",
//   "company": {
//     "name": "Romaguera-Crona",
//     "catchPhrase": "Multi-layered client-server neural-net",
//     "bs": "harness real-time e-markets"
//   }
// },