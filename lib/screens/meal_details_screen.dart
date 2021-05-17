import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = 'MealDetail';
  Widget setTitle(BuildContext context,String T)
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        T,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget setList(List<String> list)
  {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(233, 30, 99, 0.2),
        border: Border.all(color: Colors.pink,width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: ListView.builder(
        itemBuilder: (context, indx) {
          return Card(
            elevation: 4,
            color: Color.fromRGBO(255, 128, 128, 0.5),
            child:Column(
                children: [
                  ListTile(
                    leading:CircleAvatar(
                      child: Text("${indx+1}"),
                      backgroundColor: Colors.pinkAccent,
                      radius: 15,
                    ) ,
                    title: Text(
                      list[indx],
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),

                ],
              )
          );
        },
        itemCount: list.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MealsID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == MealsID);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            setTitle(context, "ingredients"),
            setList(selectedMeal.ingredients),
            setTitle(context, "steps"),
            setList(selectedMeal.steps),

          ],
        ),
      ),
    );
  }
}
