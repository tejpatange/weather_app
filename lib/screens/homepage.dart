import 'package:flutter/material.dart';
import 'package:weather_app/screens/credits.dart';
import 'weatherpage.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _textController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF2C67F2), 
            title: const Text('Home', 
            style: TextStyle(color: Colors.white70),),
            centerTitle: true,
            iconTheme: const IconThemeData(
    color: Colors.white70
  ),
            actions: [IconButton(onPressed:(){Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Credits(),
                    ),
                  );} , icon: const Icon(Icons.info),)]),
       backgroundColor: const Color(0xFF2C67F2),
      body: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF2C67F2), Color(0xFF62CFF4)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment:MainAxisAlignment.center, children:[Form( key: _formKey,
          child: TextFormField( validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter city';
                                        }
                                        return null;
                                      },controller: _textController, style: const TextStyle(color: Colors.white70), decoration: InputDecoration(hintStyle: const TextStyle(color: Colors.white70), hintText: 'City Name',  border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 0, 
                  style: BorderStyle.none,
              ),
          ), suffixIcon: IconButton(onPressed: () {
            _textController.clear();
          },
          icon: const Icon(Icons.clear, color: Colors.white70,),),
          ),),
        ),
        
        ElevatedButton(
                onPressed: () {if (_formKey.currentState!.validate()) {
                                        //loginAndAuthenticateUser(context);
                                      
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherPage(cityName: _textController.text),
                    ),
                  );
                }},
                child:const Text('Search'),
              ),
        
        ],),),
      ),
    );
  }
}
