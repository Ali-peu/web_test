import 'package:flutter/material.dart';

class OrderListTile extends StatelessWidget {
  final Color backgroundColor;
  const OrderListTile({super.key, required this.backgroundColor});

  Widget subText(BuildContext context,
      {required String name, required String value}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: name,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Color.fromRGBO(255, 255, 255, 0.47))),
          TextSpan(text: value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: backgroundColor),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(27, 8, 34, 9.83),
        child: Row(
          // mainAxisAlignment:
          children: [
            Text('Абрикос', style: Theme.of(context).textTheme.headlineSmall),
            Spacer(),
            Row(
              spacing: 40,
              children: [
                subText(context, name: 'Вес ', value: '780 гр'),
                subText(context, name: 'Сумма ', value: '1 800 ₸'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
