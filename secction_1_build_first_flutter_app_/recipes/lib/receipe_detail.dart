import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';

class ReceipeDetail extends StatefulWidget {
  final Recipe recipe;
  const ReceipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<ReceipeDetail> createState() => _ReceipeDetailState();
}

class _ReceipeDetailState extends State<ReceipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ingredient = widget.recipe.ingredients[index];
                    return Text("${ingredient.quantity * _sliderVal} "
                        "${ingredient.measure} "
                        "${ingredient.name}");
                  },
                )),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: "${_sliderVal * widget.recipe.servings} servings",
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
              setState(() {
                _sliderVal = newValue.round();
              });
            })
          ],
        ),
      ),
    );
  }
}
