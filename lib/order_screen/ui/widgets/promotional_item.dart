import 'package:flutter/material.dart';
import 'package:web_test/order_screen/domain/models/product_model.dart';

class PromotionalItem extends StatelessWidget {
  final ProductModel productModel;
  const PromotionalItem({
    super.key,
    required this.productModel,
  });

  Widget priceText(BuildContext context,
      {required String priceText, bool isOldPrice = false}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: priceText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Color.fromRGBO(0, 0, 0, 0.4)),
          ),
          TextSpan(
            text: ' ${productModel.price.toInt()}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isOldPrice ? Colors.red : Colors.black,
                decoration: isOldPrice
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          )
        ],
      )),
    );
  }

  Widget promotialProductMainInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (productModel.images.isNotEmpty)
          Image.network(
            "https://api.allorigins.win/get?url=${productModel.images}",
            loadingBuilder: (context, child, loadingProgress) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child:
                    Center(child: CircularProgressIndicator(color: Colors.red)),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/product_placeholder.png');
            },
          )
        else
          Image.asset('assets/product_placeholder.png'),
        Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: productTextName(context),
          ),
        ),
        // if (oldPrice != price)
        Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 10),
          child:
              priceText(context, priceText: 'Старая цена:', isOldPrice: true),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: priceText(context, priceText: 'Новая цена:'),
        ),
      ],
    );
  }

  Widget promotionalPrice(BuildContext context) {
    if (productModel.oldPrice != productModel.price) {
      return Align(
        alignment: Alignment(0, -0.95), // Центрирование Align
        child: Transform.rotate(
          angle: -0.02,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              '${(productModel.price / productModel.oldPrice).toInt()} %',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  RichText productTextName(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${productModel.name} / ',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          TextSpan(
            text: '1 ${productModel.typeOfAmount}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          boxShadow: [],
        ),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.1,
        child: ClipRRect(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(11, 11, 10, 24),
                    child: promotialProductMainInfo(context),
                  ),
                ),
              ),
              promotionalPrice(context),
            ],
          ),
        ),
      ),
    );
  }
}
