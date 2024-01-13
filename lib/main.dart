import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_flutter_bloc/gen/colors.gen.dart';
import 'package:to_do_flutter_bloc/src/features/home/bloc/home_bloc.dart';
import 'package:to_do_flutter_bloc/src/features/home/presentation/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColor.darkcyan),
              useMaterial3: true,
            ),
            home: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => HomeBloc(),
                ),
              ],
              child: HomePage(),
            ),
          );
        });
  }
}
