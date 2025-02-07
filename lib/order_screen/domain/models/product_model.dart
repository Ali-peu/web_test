class ProductModel {
  final String name;
  final int id;
  final double oldPrice;
  final double price;
  final String images;
  final String typeOfAmount;

  ProductModel(
      {required this.typeOfAmount,
      required this.name,
      required this.id,
      required this.oldPrice,
      required this.price,
      required this.images});

  static ProductModel fromJson(Map<String, dynamic> data) {
    final productData = data['product'] as Map<String, dynamic>? ?? {};
    final measurementType = productData['measurementType'] as String? ?? '';
    String typeOfAmount = '';
    if (measurementType == 'KG') {
      typeOfAmount = 'кг';
    } else {
      typeOfAmount = 'штук';
    }
    return ProductModel(
      typeOfAmount: typeOfAmount,
      name: productData['name'] as String? ?? '',
      id: data['id'] as int? ?? 0,
      oldPrice: data['oldPrice'] as double? ?? 0,
      price: data['price'] as double? ?? 0,
      images: (productData['images'] as List<dynamic>? ?? []).isNotEmpty
          ? productData['images'].first as String
          : '',
    );
  }
}
