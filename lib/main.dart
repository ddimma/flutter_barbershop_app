import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BarbershopAppHome(),
    );
  }
}


class BarbershopAppHome extends StatelessWidget {
  const BarbershopAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start of the column
              children: [
                TopBar(),
                SizedBox(height: 20),
                PromoCard(),
                SizedBox(height: 20),
                SearchInput(),
                SizedBox(height: 10),
                Text(
                'Nearest Babershop',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              NearestBarbershopsList(),
              Text(
                'Most recommended',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              MostRecommendedBarbershop(),
              SizedBox(height: 10),
              NearestBarbershopsList()
              ],
            ),
          ),
        ));
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side (location and name)
        const Row(
          children: [
            // Location icon and text
            Icon(
              Icons.location_on,
              color: Color(0xFF433A93), // Dark purple color for the icon
              size: 20,
            ),
            SizedBox(width: 5), // Small spacing between icon and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yogyakarta", // Location text
                  style: TextStyle(
                    color: Color(0xFF433A93), // Dark purple color
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2), // Spacing between location and name
                Text(
                  "Joe Samanta", // Name text
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Right side (profile picture)
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.3), // Slight shadow for profile picture
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            radius: 25, // Size of the profile picture
            backgroundImage: AssetImage("lib/assets/profile_pic.png"), // Replace with the correct asset path
          ),
        ),
      ],
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F6F9), // Light background color
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
        child: Row(
          children: [
            // Search icon
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.search,
                color: Colors.grey.shade500, // Icon color matching design
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  // Handle search input
                },
                decoration: const InputDecoration(
                  hintText: "Search barber’s, haircut ser...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none, // Remove borders
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                ),
              ),
            ),
            // Filter icon button
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF433A93), // Darker background for button
                  borderRadius: BorderRadius.circular(15.0), // Slightly rounded corners for filter button
                ),
                child: IconButton(
                  icon: const Icon(Icons.tune),
                  color: Colors.white, // Filter icon color
                  onPressed: () {
                    // Handle filter button press
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200, // Adjusted height based on design
        decoration: BoxDecoration(
          color: const Color(0xFFFFA726), // Orange background color
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            // Top left logo
            Positioned(
              top: 10,
              left: 10,
              child: Image.asset(
                'lib/assets/logo.png', // Replace with your logo asset path
                width: 60, // Set width based on your logo's size
              ),
            ),
            // 'Booking Now' button
            Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF433A93), // Dark purple button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Booking Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Barber image on the right
            Positioned(
              right: -100,
              bottom: 0,
              child: Image.asset(
                'lib/assets/barber_image.png', // Replace with your barber image asset path
                width: 300, // Adjust size of the barber image
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nearest Restaurants",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              "The best food close to you",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Text(
          "View More",
          style: TextStyle(
              color: Color(0xff15BE77), fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

class SHeadline extends StatelessWidget {
  const SHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular Menu",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              "The best food for you",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Text(
          "View More",
          style: TextStyle(
              color: Color(0xff15BE77), fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            // BarbershopCard(
            //   imageAsset: 'lib/assets/1.png', // Your local image path
            //   title: 'Alana Barbershop - Haircut massage & Spa',
            //   location: 'Banguntapan',
            //   distance: 5.0,
            //   rating: 4.5),
            // BarbershopCard(
            //   imageAsset: 'lib/assets/1.png', // Your local image path
            //   title: 'Alana Barbershop - Haircut massage & Spa',
            //   location: 'Banguntapan',
            //   distance: 5.0,
            //   rating: 4.5),
            // BarbershopCard(
            //   imageAsset: 'lib/assets/1.png', // Your local image path
            //   title: 'Alana Barbershop - Haircut massage & Spa',
            //   location: 'Banguntapan',
            //   distance: 5.0,
            //   rating: 4.5),
            // Card(
            //     "Italian ",
            //     "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Restaurant%20Image.png?alt=media&token=43509b4c-269e-4279-8c88-36dc9ed27a66",
            //     "12 min away"),
            Card(
                "Vegan",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
                "15 min away"),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;

  const Card(this.text, this.imageUrl, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15,right: 15),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Image.network(imageUrl, height: 70, fit: BoxFit.cover),
            const Spacer(),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class NearestBarbershopsList extends StatelessWidget {
  const NearestBarbershopsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BarbershopItem(
          image: 'lib/assets/1.png',
          name: 'Alana Barbershop - Haircut massage & Spa',
          location: 'Banguntapan (5 km)',
          rating: 4.5,
        ),
        SizedBox(height: 10),
        BarbershopItem(
          image: 'lib/assets/2.png',
          name: 'Hercha Barbershop - Haircut & Styling',
          location: 'Jalan Kaliurang (8 km)',
          rating: 5.0,
        ),
        SizedBox(height: 10),
        BarbershopItem(
          image: 'lib/assets/3.png',
          name: 'Barberking - Haircut styling & massage',
          location: 'Jogja Expo Centre (12 km)',
          rating: 4.5,
        ),
        SizedBox(height: 20),
        SeeAllButton(),
      ],
    );
  }
}

class BarbershopItem extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final double rating;

  const BarbershopItem({
    Key? key,
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    location,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.amber),
                  SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add functionality to see all barbershops
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('See All'),
          SizedBox(width: 4),
          Icon(Icons.arrow_forward, size: 16),
        ],
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}

class MostRecommendedBarbershop extends StatelessWidget {
  const MostRecommendedBarbershop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Stack(
              children: [
                Image.asset(
                  'lib/assets/most_recommended_barber.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add booking functionality
                    },
                    icon: Icon(Icons.calendar_today, size: 18),
                    label: Text('Booking'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Master piece Barbershop - Haircut styling',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      'Joga Expo Centre (2 km)',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Spacer(),
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(
                      '5.0',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}