import 'package:flutter/material.dart';

class AboutUsViewScreen extends StatelessWidget {
  const AboutUsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: const Text("About Us",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),backgroundColor: Colors.black,iconTheme: const IconThemeData(color: Colors.white),),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Kusuma Arts',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to Kusuma Arts, the official app of KUSUMA ARTS PRIVATE LIMITED. '
                'Based in the vibrant city of Pune, we specialize in the world of antique pieces, ornaments, and paintings. '
                'With over 20 years of experience in dealing with ancient and antique treasures, we have established ourselves '
                'as a trusted name in the industry.\n\n'
                'Our app is not designed for selling items but serves as an exclusive platform to showcase the diverse range of unique '
                'and timeless products that we buy and sell. From vintage ornaments to rare paintings and historical artifacts, our gallery '
                'offers a glimpse into the rich heritage and artistry of past eras.\n\n'
                'At Kusuma Arts, our passion lies in preserving history and connecting with those who appreciate the charm and value of antique collectibles. '
                'We invite you to explore our app and immerse yourself in the exquisite world of timeless artistry.\n\n'
                'Thank you for being a part of our journey in celebrating the beauty of ancient and antique products!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5, // Adjust line spacing
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
