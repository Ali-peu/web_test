import 'package:flutter/material.dart';

class PromotionalItem extends StatelessWidget {
  const PromotionalItem({super.key});

  Widget priceText(BuildContext context,
      {required String priceText,
      required String price,
      bool isOldPrice = false}) {
    return Row(
      children: [
        Text(
          priceText,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Color.fromRGBO(0, 0, 0, 0.4)),
        ),
        Text(
          price,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isOldPrice ? Colors.red : Colors.black,
              decoration: isOldPrice
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.12,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width * 0.12,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/promotional_item.png'),
                    Row(
                      children: const [
                        Text('Клубника / '),
                        Text('1 кг'),
                      ],
                    ),
                    priceText(context,
                        priceText: 'Старая цена:',
                        price: ' 1850',
                        isOldPrice: true),
                    priceText(context,
                        priceText: 'Новая цена:', price: ' 1 250 ₸'),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -1.1), // Центрирование Align
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  '-25%',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
