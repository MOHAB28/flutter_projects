import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetails({
    super.key,
    required this.recipe, //
  });

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  int _sliverValue = 1;

  void _changeSliderValue(double value) {
    setState(() {
      _sliverValue = value.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label), //
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300.0,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl), //
              ), //
            ),
            const SizedBox(height: 10), //
            Text(
              widget.recipe.label,
              style: const TextStyle(
                fontSize: 18.0, //
              ), //
            ),
            const SizedBox(height: 10), //
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: widget.recipe.ingredients.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                itemBuilder: (context, index) {
                  Ingredient ingredient = widget.recipe.ingredients[index];
                  return Text(
                    '${ingredient.quantity * _sliverValue} ${ingredient.measure} ${ingredient.name}', //
                  );
                },
              ), //
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '${_sliverValue * widget.recipe.servings} servings',
              value: _sliverValue.toDouble(),
              onChanged: _changeSliderValue,
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ), //
          ],
        ), //
      ),
    );
  }
}
