import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';
import 'package:recipes/recipe_details.dart';

void main() {
  runApp(const MyRecipes());
}

class MyRecipes extends StatelessWidget {
  const MyRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData();
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: themeData.copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent, //
          surface: Colors.greenAccent, //
        ),
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), //
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: Recipe.samples.length, //
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            Recipe recipe = Recipe.samples[index];
            return RecipeItemBuilder(recipe: recipe);
          },
        ), //
      ),
    );
  }
}

class RecipeItemBuilder extends StatelessWidget {
  RecipeItemBuilder({required this.recipe}) : super(key: ObjectKey(recipe));

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetails(recipe: recipe), //
          ), //
        );
      },
      child: Card(
        elevation: 2.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)), //
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image(image: AssetImage(recipe.imageUrl)),
              const SizedBox(height: 10),
              Text(
                recipe.label,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700, //
                ), //
              ), //
            ],
          ),
        ),
      ),
    );
  }
}
