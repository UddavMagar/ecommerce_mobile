class Inventory {
  int? quantity;
  String? modifiedAt;

  Inventory({this.quantity, this.modifiedAt});

  Inventory.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['modified_at'] = this.modifiedAt;
    return data;
  }
}