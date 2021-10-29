import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFre = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
     _vegan =  widget.currentFilters['vegan'];
     _vegetarian =  widget.currentFilters['vegetarian'];
     _lactoseFre =  widget.currentFilters['lactose'];
    super.initState();

  }

  Widget buildSwitchListTitle(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(value: currentValue, onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters"), actions: [
        IconButton(icon: Icon(Icons.save), onPressed:(){
          final selectedFilters= {
            'gluten': _glutenFree,
            'lactose': _lactoseFre,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
          };
          widget.saveFilters(selectedFilters);
        },
       ),
      ],),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',
                style: Theme
                    .of(context)
                    .textTheme
                    .title),
          ),
          Expanded(
              child: ListView(
                children: [
                buildSwitchListTitle('Gluten_free',
                'Only include gluten_free meals', _glutenFree, (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              },
                ),
                  buildSwitchListTitle('Lactose_free',
                    'Only include lactose_free meals', _lactoseFre, (newValue) {
                      setState(() {
                        _lactoseFre = newValue;
                      });
                    },
                  ),
                  buildSwitchListTitle('Vegetarian',
                    'Only include Vegetarian meals', _vegetarian, (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  buildSwitchListTitle('Vegan',
                    'Only include Vegan meals', _vegan, (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
    )
    ],
      ),
      drawer: MainDrawer(),

    );
  }
}