import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superbuyy/consts/theme_data.dart';
import 'package:superbuyy/inner_screens/feeds_screen.dart';
import 'package:superbuyy/inner_screens/on_sale_sreen.dart';
import 'package:superbuyy/inner_screens/product_details.dart';
import 'package:superbuyy/provider/dark_theme_provider.dart';
import 'package:superbuyy/screens/btm_bar.dart';
import 'package:superbuyy/screens/home_screen.dart';
import 'package:superbuyy/screens/wishlist/wishlist_screen.dart';
import 'package:superbuyy/services/dark_theme_prefs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const BottomBarScreen(),
          routes: {
            OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
            FeedsScreen.routeName: (ctx) => const FeedsScreen(),
            ProductDetails.routName: (ctx) => const ProductDetails(),
            WishlistScreen.routeName: (ctx) => const WishlistScreen(),
          },
        );
      }),
    );
  }
}
