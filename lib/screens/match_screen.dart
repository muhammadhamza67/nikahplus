import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            /// Title
            const Text(
              "Match Screen",   // ✅ Changed here
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            /// Upgrade Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF009688), Color(0xFF00BFA5)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Upgrade to Nika7 Gold\nSee who likes you & unlock premium features",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Upgrade"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// Profile Card (Swipable UI Placeholder)
            Expanded(
              child: Center(
                child: Transform.rotate(
                  angle: -0.1,
                  child: Stack(
                    children: [
                      /// Profile Card
                      Container(
                        width: 280,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage("lib/assets/images/profile.png"), // Replace with your asset
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),

                      /// Distance Badge
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "1 km",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),

                      /// Bottom Info
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mohammad Ali, 33",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Chartered Accountant",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 14),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  "Quick View",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      /// Like Button Overlay
                      Positioned(
                        top: 50,
                        right: 100,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.favorite,
                              color: Colors.red, size: 32),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Bottom Navigation
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 28,
                    child: const Icon(Icons.close, color: Colors.teal, size: 28),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 32,
                    child: const Icon(Icons.favorite,
                        color: Colors.white, size: 32),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 28,
                    child: const Icon(Icons.star, color: Colors.teal, size: 28),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
