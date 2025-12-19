import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepases/blocProviders.dart';
import 'package:notepases/firebase_options.dart';
import 'package:notepases/injection.dart';
import 'package:notepases/src/presentation/routes/app_routes.dart';
import 'package:notepases/src/presentation/routes/route_names.dart';

Future<void> main() async {
  // 1️⃣ SIEMPRE primero
  WidgetsFlutterBinding.ensureInitialized();

  // 2️⃣ Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print('Firebase apps: ${Firebase.apps.length}');
  print('ProjectId: ${Firebase.apps.first.options.projectId}');
  // 3️⃣ Inyección de dependencias
  await configureDependencies();

  // 4️⃣ Run App con BLoC
  runApp(
    MultiBlocProvider(
      providers: [...blocProviders],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // FToastBuilder sirves para mostrar toasts personalizados en la aplicación
      // builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      title: 'notepases',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      initialRoute: RouteNames.onboarding,
      routes: AppRoutes.routes,
    );
  }
}
