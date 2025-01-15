class OrdercustomerModel {
  final int orderId;
  final int customerId;
  final DateTime orderDate;
  final double totalAmount;
  final String status;

  OrdercustomerModel({
    required this.orderId,
    required this.customerId,
    required this.orderDate,
    required this.totalAmount,
    required this.status,
  });

  factory OrdercustomerModel.fromMap(Map<String, dynamic> map) {
    return OrdercustomerModel(
      orderId: map['orderId'],
      customerId: map['customerId'],
      orderDate: map['orderDate'],
      totalAmount: map['totalAmount'],
      status: map['status'],
    );
  }
}
