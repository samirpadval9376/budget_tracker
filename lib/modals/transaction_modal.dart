import 'dart:typed_data';

class TransactionModal {
  int id, amount;
  String title, category, type;
  DateTime date;
  Uint8List categoryImage;

  TransactionModal(
    this.id,
    this.amount,
    this.title,
    this.category,
    this.type,
    this.date,
    this.categoryImage,
  );

  factory TransactionModal.fromMap({required Map data}) {
    return TransactionModal(
      data['id'],
      data['amount'],
      data['title'],
      data['category'],
      data['type'],
      DateTime.fromMillisecondsSinceEpoch(data['date']),
      data['categoryImage'],
    );
  }

  Map<String, dynamic> get toMap {
    return {
      'id': id,
      'amount': amount,
      'title': title,
      'category': category,
      'type': type,
      'date': date.millisecondsSinceEpoch,
      'categoryImage': categoryImage,
    };
  }
}
