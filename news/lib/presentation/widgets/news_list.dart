import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/news/news_cubit.dart';
import '../cubit/news/news_state.dart';
import 'loading_indicator.dart';
import 'news_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsList extends StatelessWidget {
  final String category;

  const NewsList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // تحديد الدولة بناءً على لغة التطبيق الحالية
    final currentLocale = Localizations.localeOf(context);
    final countryCode =
        currentLocale.languageCode == 'ar'
            ? 'eg'
            : 'us'; // مثال: مصر للعربية، أمريكا للإنجليزية

    // جلب الأخبار عند بناء الويدجت لأول مرة
    context.read<NewsCubit>().fetchNews(category, countryCode);

    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const LoadingIndicator();
        } else if (state is NewsLoaded) {
          if (state.articles.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context)!.noNewsFound),
            );
          }
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              return NewsCard(article: state.articles[index]);
            },
          );
        } else if (state is NewsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.errorLoadingNews),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<NewsCubit>().fetchNews(category, countryCode);
                  },
                  child: Text(AppLocalizations.of(context)!.retry),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink(); // حالة NewsInitial
        }
      },
    );
  }
}
