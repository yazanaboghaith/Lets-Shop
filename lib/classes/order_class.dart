class Order {
  List<dynamic>? products;
  String? totalPrice;
  String? userName;
  String? userEmail;
  String? userAddress;
  String? userNumber;
  String? userId;
  String? orderId;
  String? dateOrder;
  String? statusOrder;
  String? reasonRejection;
  Order(
      {this.products,
      this.reasonRejection,
      this.totalPrice,
      this.statusOrder,
      this.userAddress,
      this.userEmail,
      this.userId,
      this.userName,
      this.userNumber,
      this.dateOrder,
      this.orderId});
}
