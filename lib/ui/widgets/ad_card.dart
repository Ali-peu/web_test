import 'package:flutter/material.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key});

  Widget courseOfActionText(BuildContext context,
      {required String textValue, required String queueValue}) {
    return ListTile(
      leading: Container(
        width: 35,
        height: 35,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.05),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            queueValue,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: const Color.fromRGBO(0, 0, 0, 0.5)),
          ),
        ),
      ),
      title: Text(textValue),
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(left: 8, top: 8),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(-.95, 1.2),
              child: Image.asset('assets/app_design/login.png'),
            ),
            Align(
              alignment: const Alignment(0.0, 1.2),
              child: Image.asset('assets/app_design/home.png'),
            ),
            Align(
              alignment: const Alignment(.95, 1.2),
              child: Image.asset('assets/app_design/order_screen.png'),
            ),
            Align(
              alignment: Alignment(.9, -1.0),
              child: Image.asset('assets/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Скачайте',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: Colors.red),
                      ),
                      Text(
                        ' приложение',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        'и получите',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Transform.rotate(
                        angle: -0.05,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            '1 000 тг бонусов',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  courseOfActionText(
                    context,
                    textValue: 'Найдите в AppStore приложение -------',
                    queueValue: '01',
                  ),
                  courseOfActionText(
                    context,
                    textValue: 'Скачайте и зарегистрируйтесь',
                    queueValue: '02',
                  ),
                  courseOfActionText(
                    context,
                    textValue: 'Отсканируйте QR код, совершите покупку',
                    queueValue: '03',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
