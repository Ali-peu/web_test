import 'package:flutter/material.dart';
import 'package:web_test/order_screen/ui/widgets/course_of_action_text.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key});

  @override
  Widget build(BuildContext context) {
    var titleText = [
      RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: 'Скачайте',
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: Colors.red),
          ),
          TextSpan(
            text: ' приложение',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      )),
      Row(
        spacing: 10,
        children: [
          Text(
            'и получите',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Transform.rotate(
            angle: -0.05,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text('1 000 тг бонусов',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
      CourseOfActionText(
        textValue: 'Найдите в AppStore приложение -------',
        queueValue: '01',
      ),
      CourseOfActionText(
        textValue: 'Скачайте и зарегистрируйтесь',
        queueValue: '02',
      ),
      CourseOfActionText(
        textValue: 'Отсканируйте QR код, совершите покупку',
        queueValue: '03',
      ),
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(left: 8, top: 8),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(-.95, 1.5),
              child: Image.asset('assets/app_design/login.png'),
            ),
            Align(
              alignment: const Alignment(0.0, 1.5),
              child: Image.asset('assets/app_design/home.png'),
            ),
            Align(
              alignment: const Alignment(.95, 1.5),
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
                children: titleText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
