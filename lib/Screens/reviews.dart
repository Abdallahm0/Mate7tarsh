// import 'package:flutter/material.dart';

// class ReviewsScreen extends StatelessWidget {
//   const ReviewsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Reviews',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.grey[200],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 icon: const Icon(Icons.edit, color: Colors.black),
//                 label: const Text('Write a Review', style: TextStyle(color: Colors.black)),
//               ),
//               const SizedBox(height: 16),
//               buildReviewCard('Amir Mohamed', '3 Sep 2024', 5,
//                   'I did go last week and the food was amazing and the place very comfortable and nice staff'),
//               buildReviewCard('Youssra Hossam', '14 Nov 2024', 4,
//                   'It was my first time trying this restaurant and definitely not the last time'),
//               buildReviewCard('Tamara Ahmed', '1 Dec 2024', 4,
//                   'The best steak I did eat from a long time but the food did take a while to be prepared'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildReviewCard(String name, String date, int rating, String review) {
//     return Column(
//       children: [
//         ListTile(
//           contentPadding: EdgeInsets.zero,
//           leading: CircleAvatar(
//             backgroundColor: Colors.grey[200],
//             child: Text(name[0], style: const TextStyle(color: Colors.black)),
//           ),
//           title: Text(name),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 4),
//               Row(
//                 children: List.generate(
//                   rating,
//                   (index) => const Icon(Icons.star, color: Colors.amber, size: 16),
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(review),
//             ],
//           ),
//           trailing: Text(date, style: const TextStyle(color: Colors.grey)),
//         ),
//         const Divider(),
//       ],
//     );
//   }
// }
