import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:web_test/order_screen/ui/order_screen_view_model.dart';
import 'package:web_test/order_screen/ui/widgets/ad_card.dart';
import 'package:web_test/order_screen/ui/widgets/app_ad_card.dart';
import 'package:web_test/order_screen/ui/widgets/order_list_tile.dart';
import 'package:web_test/order_screen/ui/widgets/promotional_item.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(238, 238, 238, 1),
        body: Consumer<OrderScreenViewModel>(builder: (context, value, child) {
          if (value.showError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Что-то пошло не так')));
              value.showError = false;
            });
          }
          return Row(
            children: [
              leftSide(context),
              rightSide(context),
            ],
          );
        }));
  }

  Widget headlineText(BuildContext context, {required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(value, style: Theme.of(context).textTheme.displayMedium),
    );
  }

  Widget rightSide(BuildContext context) {
    return Consumer<OrderScreenViewModel>(builder: (context, value, child) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(color: Color.fromRGBO(238, 238, 238, 1)),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headlineText(
                context,
                value: 'Система лояльности',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    AppAdCard(child: AdCard()),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: AppAdCard(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Отсканируйте QR код',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.32,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(231, 231, 231, 1),
                                  borderRadius: BorderRadius.circular(15)),
                            )
                          ],
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              headlineText(context, value: 'Акционные товары'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.33,
                child: value.promotionalProducts.isNotEmpty
                    ? ListView.builder(
                        itemCount: value.promotionalProducts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return PromotionalItem(
                              productModel: value.promotionalProducts[index]);
                        })
                    : SizedBox(),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget leftSide(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(color: Color.fromRGBO(29, 29, 31, 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16),
              child: Text('Состав заказа',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: Colors.white)),
            ),
            for (int i = 0; i < 7; i++)
              OrderListTile(
                  backgroundColor: i == 2
                      ? Colors.red
                      : i % 2 != 0
                          ? Color.fromRGBO(39, 39, 39, 1)
                          : Color.fromRGBO(0, 0, 0, 0.1)),
            Spacer(),
            Divider(
              color: Color.fromRGBO(255, 255, 255, 0.08),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Итого',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white)),
                  Text(
                    '25 000 ₸',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
