import 'package:flutter/material.dart';
import 'package:web_test/ui/widgets/ad_card.dart';
import 'package:web_test/ui/widgets/app_ad_card.dart';
import 'package:web_test/ui/widgets/order_list_tile.dart';
import 'package:web_test/ui/widgets/promotional_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [leftSide(context), rightSide(context)],
      ),
    );
  }

  Widget rightSideDisplayText(BuildContext context, {required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(value,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.black)),
    );
  }

  Container rightSide(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(color: Color.fromRGBO(238, 238, 238, 1)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            rightSideDisplayText(
              context,
              value: 'Система лояльности',
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  AppAdCard(child: AdCard()),
                  AppAdCard(
                      child: Column(
                    spacing: 30,
                    children: [
                      Text(
                        'Отсканируйте QR код',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.32,
                        width: MediaQuery.of(context).size.width * 0.18,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(231, 231, 231, 1),
                            borderRadius: BorderRadius.circular(15)),
                      )
                    ],
                  )),
                ],
              ),
            ),
            rightSideDisplayText(context, value: 'Акционные товары'),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView(
                  // itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(8, (e) => PromotionalItem()),
                  // itemBuilder: (context, index) {
                  // return PromotionalItem();
                  // }),
                ))
          ],
        ),
      ),
    );
  }

  Widget leftSide(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text('Состав заказа',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            for (int i = 0; i < 7; i++)
              OrderListTile(
                  backgroundColor: i == 2
                      ? Colors.red
                      : i % 2 != 0
                          ? Color.fromRGBO(39, 39, 39, 1)
                          : Colors.black),
            Spacer(),
            Divider(),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Итого',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white)),
                  Text('25 000 ₸',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
