import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:kusuma_arts/view/aboutus_view.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  static final List<String> bannerimages = [
    "assets/bannerimages/banner1.webp",
    "assets/bannerimages/banner2.webp",
    "assets/bannerimages/banner3.webp"
  ];

  final List<Map<String, String>> items = [
    {
      "image": "assets/images/img1.webp",
      "name": "Old Age Painting",
      "description":
          "Scenary Old Age Painting with Art And Design from 19th Century",
      "year": "1950"
    },
    
    {
      "image": "assets/images/img3.webp",
      "name": "Castle Painting ",
      "description":
          "Old Age Castle Painting Image Which Was Sketched By Renowed Sketch Artist.",
      "year": "1680"
    },
    {
      "image": "assets/images/img4.webp",
      "name": "Ancient Queen Painting",
      "description": "Painting of Ancient Queen from 1700 BC.",
      "year": "1722"
    },
    {
      "image": "assets/images/img5.webp",
      "name": "Abstract Art Image",
      "description":
          "Abstract Art Image from Ancient Times with its Rich Cultural Heritage.",
      "year": "1890"
    },
    {
      "image": "assets/images/img6.webp",
      "name": "Ancient Time Compass",
      "description": "19th Century Compass with its multDirectional Pins.",
      "year": "1970"
    },
    {
      "image": "assets/images/img7.webp",
      "name": "Vintage Camera",
      "description":
          "Vintage Camera Used by Many Kings and Queens During their Time and used by Many Royal Families.",
      "year": "1890"
    },
    {
      "image": "assets/images/img8.webp",
      "name": "Copper Pot",
      "description": "Ancient Greek Copper Pot Used by Greeks in their Era.",
      "year": "1760"
    },
    {
      "image": "assets/images/img9.webp",
      "name": "Horse Oil Painting",
      "description": "Oil Painting Of Horse Used In Galleries.",
      "year": "1980"
    },
    {
      "image": "assets/images/img10.webp",
      "name": "Water Mug",
      "description":
          "Water Mug Used By Ancient Greeks and Soviet Union Peoples in Their ERA.",
      "year": "1600"
    },
    {
      "image": "assets/images/img11.webp",
      "name": "RoadSide oil Painting",
      "description": "Roadside Oil Painting of Roman Empire By MUYC.",
      "year": "1890"
    },
    {
      "image": "assets/images/img12.webp",
      "name": "Gold Kartani",
      "description":
          "Gold Kartani Used In Ancient times which was considered as a Goodwill For Palaces.",
      "year": "1760"
    },
    {
      "image": "assets/images/img13.webp",
      "name": "King With Horse",
      "description": "Classical Image of Kin Riding a Horse in MoonLight.",
      "year": "not available"
    },
    {
      "image": "assets/images/img14.webp",
      "name": "Ancient Utensil",
      "description":
          "Mideival ERA Utensil which was used in Ancient Times to Store Multiple Items.",
      "year": "1635"
    },
    {
      "image": "assets/images/img15.webp",
      "name": "Water Pot",
      "description": "Pot Discovered by Ancient Egyptians In Medieval ERA",
      "year": "Medieval Era"
    },
    {
      "image": "assets/images/img2.webp",
      "name": "TypeWriter",
      "description": "War Time TypeWriter with Paper Pad and Typing Console.",
      "year": "1700"
    },
  ];

  HomeScreen({super.key});

  final Uri _url = Uri.parse(
      'https://www.freeprivacypolicy.com/live/fef3fea1-1528-434f-9a7e-ebab027da647');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<Uint8List> loadImage(String assetPath) async {
  final ByteData data = await rootBundle.load(assetPath);
  return data.buffer.asUint8List();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Kusuma Arts',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          FutureBuilder<List<Uint8List>>(
            future: Future.wait(bannerimages.map(loadImage)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return const Text("Failed to load images.");
              }
              return CarouselSlider(
                options: CarouselOptions(autoPlay: true, height: 200.0),
                items: snapshot.data!.map((imageData) {
                  return Image.memory(imageData, fit: BoxFit.cover);
                }).toList(),
              );
            },
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return FutureBuilder<Uint8List>(
                  future: loadImage(item['image']!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (!snapshot.hasData) {
                      return const Text("Failed to load image.");
                    }
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/details',
                            arguments: item);
                      },
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.memory(
                                  snapshot.data!,
                                  fit: BoxFit.cover,
                                  height: 150,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              flex: 2,
                              child: Text(
                                item["name"]!,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: const DrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Kusuma Arts',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.black),
              title: const Text('About Us'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutUsViewScreen())),
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip, color: Colors.black),
              title: const Text('Privacy Policy'),
              onTap: () {
                _launchUrl();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Exit App"),
            content: const Text("Are you sure you want to exit the app?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false), // Cancel
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true), // Exit
                child: const Text("Yes"),
              ),
            ],
          ),
        ) ??
        false; // Default to false if dialog is dismissed
  }
}
