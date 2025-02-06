import 'package:flutter/material.dart';

class OrderListTile extends StatelessWidget {
  final Color backgroundColor;
  const OrderListTile({super.key, required this.backgroundColor});

  Widget subText(BuildContext context,
      {required String name, required String value}) {
    return Row(
      children: [
        Text(name,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Color.fromRGBO(255, 255, 255, 0.47))),
        Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: backgroundColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          // mainAxisAlignment:
          children: [
            SizedBox(width: 10),
            Text('Абрикос', style: Theme.of(context).textTheme.bodySmall),
            Spacer(),
            Row(
              spacing: 40,
              children: [
                subText(context, name: 'Вес ', value: '780 гр'),
                subText(context, name: 'Сумма ', value: '1 800 ₸'),
              ],
            ),
            SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}
