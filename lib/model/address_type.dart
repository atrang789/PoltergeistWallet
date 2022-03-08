class AddressType {
  AddressType({this.address});

  String address;

  AddressType fromJson(Map<String, Object> json) {
    return AddressType(
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
    };
  }
}