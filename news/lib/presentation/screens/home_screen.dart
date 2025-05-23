import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/news/news_cubit.dart';
import '../widgets/news_list.dart';
import 'settings_screen.dart';
import '../../data/repositories/news_repository.dart';
import '../../data/datasources/news_remote_data.dart';
import '../../core/api/api_client.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // تعريف الفئات لكل تبويب
  final List<String> _categories = ['sports', 'politics', 'entertainment'];

  // إنشاء NewsCubit لكل تبويب لضمان فصل الحالة
  // أو يمكنك استخدام Cubit واحد وإدارة الحالة داخله بناءً على الفئة
  // هنا سنستخدم Cubit منفصل لكل تبويب كمثال
  final List<NewsCubit> _newsCubits = [];

  @override
  void initState() {
    super.initState();
    // تهيئة Cubits لكل فئة
    final apiClient = ApiClient();
    final remoteDataSource = NewsRemoteDataSourceImpl(apiClient: apiClient);
    final newsRepository = NewsRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );
    for (var _ in _categories) {
      _newsCubits.add(NewsCubit(newsRepository: newsRepository));
    }
  }

  @override
  void dispose() {
    // التخلص من Cubits عند إغلاق الشاشة
    for (var cubit in _newsCubits) {
      cubit.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final List<String> tabTitles = [
      localizations.sports,
      localizations.politics,
      localizations.entertainment,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(tabTitles[_currentIndex]), // عرض عنوان التبويب الحالي
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              log('Search button pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocProvider.value(
        value:
            _newsCubits[_currentIndex], // توفير الـ Cubit المناسب للتبويب الحالي
        child: NewsList(category: _categories[_currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.sports_soccer),
            label: localizations.sports,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_balance),
            label: localizations.politics,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.movie),
            label: localizations.entertainment,
          ),
        ],
      ),
    );
  }
}
