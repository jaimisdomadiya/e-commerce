import 'package:MyApp/constants.dart';
import 'package:MyApp/screen/homepage/components/body.dart';
import 'package:flutter/material.dart';

class HomePageDisplay extends StatelessWidget {
  
  static String routeName = "/homepage_display";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shop App",style: TextStyle(color: kPrimaryColor,fontSize: 23,),),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.green,), onPressed: (){},),
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.green,), onPressed: (){},),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Jaimis'), 
              accountEmail: Text("jemishdomadiya@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person, color: Colors.green,),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("My Order"),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Categories"),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Favourites"),
                leading: Icon(Icons.favorite),
              ),
            ),
            
            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("About"),
                leading: Icon(Icons.help),
              ),
            ),


          ],
        ),
      ),
      body: Body(),
    );
  }
}