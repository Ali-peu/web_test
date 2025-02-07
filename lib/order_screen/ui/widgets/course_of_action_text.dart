import 'package:flutter/material.dart';

class CourseOfActionText extends StatelessWidget {
  final String queueValue;
  final String textValue;
  const CourseOfActionText(
      {super.key, required this.queueValue, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            queueValue,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: const Color.fromRGBO(0, 0, 0, 0.5)),
          ),
        ),
      ),
      title: Text(textValue),
      titleTextStyle: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
