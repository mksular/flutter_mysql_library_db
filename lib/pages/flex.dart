import 'package:flutter/material.dart';
import 'package:myapp/utils/drawer.dart';

class FlexPage extends StatefulWidget {
  const FlexPage({super.key, required this.title});

  final String title;

  @override
  State<FlexPage> createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,        
        title: Text(widget.title),
      ),
      drawer: const MyDrawer(title: "Drawer"),
      body: Center(
        
        child: Column(

         
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: <Widget>[
            Container(
              
              color: Colors.teal[100],
              width: MediaQuery.of(context).size.width, 
              height: (MediaQuery.of(context).size.height-110)/5,  
              alignment:Alignment.center,            
              child: const Text("N", style: TextStyle(fontSize: 32),),
            ),
            Container(
            
              color: Colors.teal[200],
              width: MediaQuery.of(context).size.width, 
               height: (MediaQuery.of(context).size.height-110)/5,   
              alignment:Alignment.center,            
              child: const Text("A", style: TextStyle(fontSize: 32)),
            ),
            Container(
              
              color: Colors.teal[300],
              width: MediaQuery.of(context).size.width,  
               height: (MediaQuery.of(context).size.height-110)/5,  
              alignment:Alignment.center,            
              child: const Text("L", style: TextStyle(fontSize: 32)),
            ),
            Container(
              
              color: Colors.teal[400],
              width: MediaQuery.of(context).size.width, 
               height: (MediaQuery.of(context).size.height-110)/5,   
              alignment:Alignment.center,            
              child: const Text("A", style: TextStyle(fontSize: 32)),
            ),
            Container(
             
              color: Colors.teal[500],
              width: MediaQuery.of(context).size.width,  
               height: (MediaQuery.of(context).size.height-110)/5,  
              alignment:Alignment.center,            
              child: const Text("N", style: TextStyle(fontSize: 32)),
            ),
            
          ],
        ),
      ),
     
    );
  }
}
