import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:platterpath2/utils/location_service.dart';
import 'package:provider/provider.dart';
import 'package:platterpath2/models/restaurant.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  // Method to fetch and update the user's location
  Future<void> updateLocation(BuildContext context) async {
    try {
      // Show a loading indicator
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fetching current location...')),
      );

      // Get the current position
      Position position = await getCurrentLocation();

      // Get the address from the position
      String address = await getAddressFromLatLng(position);

      // Update the restaurant's delivery address
      context.read<Restaurant>().updateDeliveryAdress(address);

      // Notify the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location updated: $address')),
      );
    } catch (e) {
      // Handle errors gracefully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => updateLocation(context),
            child: Row(
              children: [
                // Display the current delivery address
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Expanded(
                    child: Text(
                      restaurant.deliveryAdress.isNotEmpty
                          ? restaurant.deliveryAdress
                          : "Tap to detect location",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),

                // Dropdown icon
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
