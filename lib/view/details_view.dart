import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> item =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text(item['name']!,style: const TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),backgroundColor: Colors.black,iconTheme: const IconThemeData(color: Colors.white),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          margin:const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(item["image"]!,height: 500,width: double.infinity,)),
              const SizedBox(height: 4),
              Text(item["name"]!, style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold, color: Colors.black)),
              Text(item["description"]!, style: const TextStyle(color: Colors.black,fontSize: 20)),
              Text('Year Discovered: ${item["year"]}',
                  style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
