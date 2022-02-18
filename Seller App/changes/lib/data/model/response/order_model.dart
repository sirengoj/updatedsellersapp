
class OrderModel {
  int _id;
  int _customerId;
  String _customerType;
  String _paymentStatus;
  String _orderStatus;
  String _paymentMethod;
  String _transactionRef;
  double _orderAmount;
  int _shippingAddress;
  String _shippingAddressData;
  int _billingAddress;
  BillingAddressData _billingAddressData;
  String _createdAt;
  String _updatedAt;
  double _discountAmount;
  double _shippingCost;
  String _discountType;
  Customer _customer;
  int _deliveryManId;
  String _orderNote;

  OrderModel(
      {int id,
        int customerId,
        String customerType,
        String paymentStatus,
        String orderStatus,
        String paymentMethod,
        String transactionRef,
        double orderAmount,
        int shippingAddress,
        String shippingAddressData,
        int billingAddress,
        BillingAddressData billingAddressData,
        double shippingCost,
        String createdAt,
        String updatedAt,
        double discountAmount,
        String discountType,
        Customer customer,
        int deliveryManId,
        String orderNote,
      }) {
    this._id = id;
    this._customerId = customerId;
    this._customerType = customerType;
    this._paymentStatus = paymentStatus;
    this._orderStatus = orderStatus;
    this._paymentMethod = paymentMethod;
    this._transactionRef = transactionRef;
    this._orderAmount = orderAmount;
    this._shippingAddress = shippingAddress;
    this._shippingAddressData = shippingAddressData;
    this._billingAddress = billingAddress;
    this._billingAddressData = billingAddressData;
    this._shippingCost = shippingCost;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._discountAmount = discountAmount;
    this._discountType = discountType;
    this._customer = customer;
    this._deliveryManId = deliveryManId;
    this._orderNote = orderNote;
  }

  // ignore: unnecessary_getters_setters
  int get id => _id;
  // ignore: unnecessary_getters_setters
  set id(int id) => _id = id;
  int get customerId => _customerId;
  String get customerType => _customerType;
  String get paymentStatus => _paymentStatus;
  // ignore: unnecessary_getters_setters
  String get orderStatus => _orderStatus;
  // ignore: unnecessary_getters_setters
  set orderStatus(String orderStatus) => _orderStatus = orderStatus;
  String get paymentMethod => _paymentMethod;
  String get transactionRef => _transactionRef;
  double get orderAmount => _orderAmount;
  double get shippingCost => _shippingCost;
  int get shippingAddress => _shippingAddress;
  String get shippingAddressData => _shippingAddressData;
  int get billingAddress => _billingAddress;
  BillingAddressData get billingAddressData => _billingAddressData;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  double get discountAmount => _discountAmount;
  String get discountType => _discountType;
  Customer get customer => _customer;
  int get deliveryManId =>_deliveryManId;
  String get orderNote => _orderNote;

  OrderModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _customerType = json['customer_type'];
    _paymentStatus = json['payment_status'];
    _orderStatus = json['order_status'];
    _paymentMethod = json['payment_method'];
    _transactionRef = json['transaction_ref'];
    _orderAmount = json['order_amount'].toDouble();
    _shippingCost = json['shipping_cost'].toDouble();
    _shippingAddress = json['shipping_address'];
    _shippingAddressData = json['shipping_address_data'];
    _billingAddress = json['billing_address'];
    _billingAddressData = json['billing_address_data'] != null
        ? new BillingAddressData.fromJson(json['billing_address_data'])
        : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if(json['delivery_man_id'] != null){
      _deliveryManId = json['delivery_man_id'];
    }

    if(json['discount_amount']!=null){
      _discountAmount = json['discount_amount'].toDouble();
    }

    _discountType = json['discount_type'];
    _customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    _orderNote = json['order_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['customer_id'] = this._customerId;
    data['customer_type'] = this._customerType;
    data['payment_status'] = this._paymentStatus;
    data['order_status'] = this._orderStatus;
    data['payment_method'] = this._paymentMethod;
    data['transaction_ref'] = this._transactionRef;
    data['order_amount'] = this._orderAmount;
    data['shipping_address'] = this._shippingAddress;
    data['shipping_address_data'] = this.shippingAddressData;
    data['billing_address'] = this._billingAddress;
    if (this.billingAddressData != null) {
      data['billing_address_data'] = this.billingAddressData.toJson();
    }
    data['shipping_cost'] = this._shippingCost;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['delivery_man_id'] = this._deliveryManId;
    data['discount_amount'] = this._discountAmount;
    data['discount_type'] = this._discountType;
    if (this._customer != null) {
      data['customer'] = this._customer.toJson();
    }
    data['order_note'] = this._orderNote;
    return data;
  }
}

class Customer {
  int _id;
  String _name;
  String _fName;
  String _lName;
  String _phone;
  String _image;
  String _email;
  String _emailVerifiedAt;
  String _createdAt;
  String _updatedAt;
  String _streetAddress;
  String _country;
  String _city;
  String _zip;
  String _houseNo;
  String _apartmentNo;
  String _cmFirebaseToken;

  Customer(
      {int id,
        String name,
        String fName,
        String lName,
        String phone,
        String image,
        String email,
        String emailVerifiedAt,
        String createdAt,
        String updatedAt,
        String streetAddress,
        String country,
        String city,
        String zip,
        String houseNo,
        String apartmentNo,
        String cmFirebaseToken}) {
    this._id = id;
    this._name = name;
    this._fName = fName;
    this._lName = lName;
    this._phone = phone;
    this._image = image;
    this._email = email;
    this._emailVerifiedAt = emailVerifiedAt;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._streetAddress = streetAddress;
    this._country = country;
    this._city = city;
    this._zip = zip;
    this._houseNo = houseNo;
    this._apartmentNo = apartmentNo;
    this._cmFirebaseToken = cmFirebaseToken;
  }

  int get id => _id;
  String get name => _name;
  String get fName => _fName;
  String get lName => _lName;
  String get phone => _phone;
  String get image => _image;
  String get email => _email;
  String get emailVerifiedAt => _emailVerifiedAt;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get streetAddress => _streetAddress;
  String get country => _country;
  String get city => _city;
  String get zip => _zip;
  String get houseNo => _houseNo;
  String get apartmentNo => _apartmentNo;
  String get cmFirebaseToken => _cmFirebaseToken;

  Customer.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    if(json['f_name']!=null){
      _fName = json['f_name'];
    }

    if(json['l_name']!=null){
      _lName = json['l_name'];
    }

    _phone = json['phone'];
    _image = json['image'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _streetAddress = json['street_address'];
    _country = json['country'];
    _city = json['city'];
    _zip = json['zip'];
    _houseNo = json['house_no'];
    _apartmentNo = json['apartment_no'];
    _cmFirebaseToken = json['cm_firebase_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['f_name'] = this._fName;
    data['l_name'] = this._lName;
    data['phone'] = this._phone;
    data['image'] = this._image;
    data['email'] = this._email;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['street_address'] = this._streetAddress;
    data['country'] = this._country;
    data['city'] = this._city;
    data['zip'] = this._zip;
    data['house_no'] = this._houseNo;
    data['apartment_no'] = this._apartmentNo;
    data['cm_firebase_token'] = this._cmFirebaseToken;
    return data;
  }
}


class BillingAddressData {
  int id;
  int customerId;
  String contactPersonName;
  String addressType;
  String address;
  String city;
  String zip;
  String phone;
  String createdAt;
  String updatedAt;
  String country;
  String latitude;
  String longitude;
  int isBilling;

  BillingAddressData(
      {this.id,
        this.customerId,
        this.contactPersonName,
        this.addressType,
        this.address,
        this.city,
        this.zip,
        this.phone,
        this.createdAt,
        this.updatedAt,
        this.country,
        this.latitude,
        this.longitude,
        this.isBilling});

  BillingAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    contactPersonName = json['contact_person_name'];
    addressType = json['address_type'];
    address = json['address'];
    city = json['city'];
    zip = json['zip'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isBilling = json['is_billing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['contact_person_name'] = this.contactPersonName;
    data['address_type'] = this.addressType;
    data['address'] = this.address;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_billing'] = this.isBilling;
    return data;
  }
}