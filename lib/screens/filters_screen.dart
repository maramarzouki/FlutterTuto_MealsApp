import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegetarian']!;
    _lactoseFree = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("your filters"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selecetedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selecetedFilters);
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                (value) {
              setState(() {
                _glutenFree = value;
              });
            }),
            _buildSwitchListTile(
                'Lactose-free', 'Only include lactose-free meals', _lactoseFree,
                (value) {
              setState(() {
                _lactoseFree = value;
              });
            }),
            _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                (value) {
              setState(() {
                _vegan = value;
              });
            }),
            _buildSwitchListTile(
                'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                (value) {
              setState(() {
                _vegetarian = value;
              });
            }),
          ],
        ))
      ]),
    );
  }
}
