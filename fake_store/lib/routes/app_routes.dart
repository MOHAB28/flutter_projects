import 'package:fake_store/data/repositories/products/products_repository.dart';
import 'package:fake_store/presentation/cubits/products/single_product/single_product_cubit.dart';
import 'package:fake_store/presentation/views/products/product_details.dart';
import 'package:fake_store/presentation/views/products/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutesNames {
  static const String home = '/';
  static const String productDetails = '/product-details';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.home:
        return MaterialPageRoute(
          builder: (_) => const ProductsView(), //
        );
      case AppRoutesNames.productDetails:
        return MaterialPageRoute(
          builder: (context) {
            int? productId = settings.arguments as int?;
            return BlocProvider<SingleProductCubit>(
              create: (context) => SingleProductCubit(
                context.read<ProductsRepository>(), //
              )..fetchSingleProduct(productId!),
              child: const ProductDetails(), //
            );
          }, //
        );
      default:
        return null;
    }
  }
}
