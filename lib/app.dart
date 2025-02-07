import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_test/order_screen/data/backend_api.dart';
import 'package:web_test/order_screen/ui/domain/get_order_screen_repo.dart';
import 'package:web_test/order_screen/ui/order_screen.dart';
import 'package:web_test/order_screen/ui/order_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1512, 982),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
                textTheme: TextTheme(
              displayLarge: TextStyle(
                // карточка текст тайтл 2
                color: Colors.black,
                fontSize: 24.sp, // уменьшено на 2
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
              displayMedium: TextStyle(
                // обяъвление
                color: Colors.black,
                fontSize: 20.sp, // уменьшено на 2
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              displaySmall: TextStyle(
                // карточка текст тайтл 2
                color: Colors.black,
                fontSize: 18.54.sp, // уменьшено на 2
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              headlineLarge: TextStyle(
                color: Colors.black,
                fontSize: 15.25.sp, // уменьшено на 2
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              headlineMedium: TextStyle(
                color: Colors.black,
                fontSize: 14.sp, // уменьшено на 2
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              bodySmall: TextStyle(
                color: Colors.white,
                fontSize: 11.sp, // уменьшено на 1
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              bodyMedium: TextStyle(
                color: Colors.white,
                fontSize: 12.sp, // уменьшено на 2
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
              headlineSmall: TextStyle(
                color: Colors.white,
                fontSize: 12.sp, // уменьшено на 2
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
              bodyLarge: TextStyle(
                color: Colors.black,
                fontSize: 18.sp, // уменьшено на 2
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              titleMedium: TextStyle(
                color: Colors.white,
                fontSize: 12.sp, // уменьшено на 2
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            )),
            home: ChangeNotifierProvider(
                create: (context) => OrderScreenViewModel(
                    getOrderScreenRepo:
                        GetOrderScreenRepo(backendApi: BackendApi()))
                  ..getPromotionalProducts(),
                child: OrderScreen()),
          );
        });
  }
}


/*
  // право объявление text: 22 600  
  // влево объявление text: 22 600 

  карточка первая 
    // красная 26,2 700
    // остальный 26 500 
    // порядок действие 16 500 
      его номер 14 500
  // карточка вторая 20,54 600
  // акция текст главный 16 500
     суб текст 14 500
     акция значение 17,25 500

  список
    название 14 400
    доп текст 12 400 
    цена 14 600
    итог 20 600
    цена итога 18 400 


    
    
  
*/