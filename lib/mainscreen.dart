import 'package:flutter/material.dart';
import 'components/reusable.dart';
import 'components/Coaching.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  TextEditingController searchController = TextEditingController();
  List<CoachingInstitute> institutes = [
    CoachingInstitute(name: 'Metro Coaching', rating: 4.6, distance: 2, price: 20),
    CoachingInstitute(name: 'Champ Coaching', rating: 4.7, distance: 3, price: 30),
    CoachingInstitute(name: 'Zooba Coaching', rating: 4.0, distance: 1, price: 10),
    CoachingInstitute(name: 'Fitji Coaching', rating: 5.0, distance: 6, price: 5),
    CoachingInstitute(name: 'Brud Coaching', rating: 4.2, distance: 10, price: 8),
  ];

  List<CoachingInstitute> filteredInstitutes = [];
  bool sortAscending = true;
  String sortType = 'Price';

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all institutes
    filteredInstitutes = List.from(institutes);
  }
// Function to filter institutes based on the search query
  void filterInstitutes(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredInstitutes = List.from(institutes); // Reset to the original list
      } else {
        filteredInstitutes = institutes.where((institute) =>
            institute.name.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }
  double calculateRelevance(CoachingInstitute institute) {
    double weightDistance = 0.7;
    double weightRating = 0.7;

    double maxDistance = 10.0;
    double maxRating = 5.0;

    double normalizedDistance = (institute.distance / maxDistance);
    double normalizedRating = (institute.rating / maxRating);

    // Calculate the relevance score
    return (weightDistance * normalizedDistance + weightRating * normalizedRating);
  }

// Function to sort the institutes based on selected criteria
  void sortData(String type) {
    setState(() {
      sortType = type;
      switch (type) {
        case 'Price':
          filteredInstitutes.sort((a, b) =>
          sortAscending ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
          break;
        case 'Rating':
          filteredInstitutes.sort((a, b) =>
          sortAscending ? a.rating.compareTo(b.rating) : b.rating.compareTo(a.rating));
          break;
        case 'Distance':
          filteredInstitutes.sort((a, b) =>
          sortAscending ? a.distance.compareTo(b.distance) : b.distance.compareTo(a.distance));
          break;
        case 'Relevance': // New sorting option
          filteredInstitutes.sort((a, b) {
            double relevanceA = calculateRelevance(a);
            double relevanceB = calculateRelevance(b);
            return sortAscending ? relevanceA.compareTo(relevanceB) : relevanceB.compareTo(relevanceA);
          });
          break;
      }
      // Toggle the sorting order for the next click
      sortAscending = !sortAscending;
    });
  }

// Function to show a dialog with sorting options
  void showSortOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sort Options',style: TextStyle(
            color:Color(0xFF7D23E0),fontSize: 24
          ),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                // List tiles for each sorting option
                title: const Text('Sort by Price',style: TextStyle(
                  color: Color(0xFF7D23E0),fontSize: 18
                ),),
                onTap: () {
                  sortData('Price');
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              ListTile(
                title: const Text('Sort by Rating',style: TextStyle(
                    color: Color(0xFF7D23E0),fontSize: 18
                ),),
                onTap: () {
                  sortData('Rating');
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              ListTile(
                title: const Text('Sort by Distance',style: TextStyle(
                    color: Color(0xFF7D23E0),fontSize: 18
                ),),
                onTap: () {
                  sortData('Distance');
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              ListTile(
                title: const Text('Sort by Relevance',style: TextStyle(
                    color: Color(0xFF7D23E0),fontSize: 18
                ),), // New option
                onTap: () {
                  sortData('Relevance'); // Use the same key as in the switch case
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),

            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFF7D23E0),
              shape: BoxShape.circle,
            ),
            child: Container(
              width: 7.41,
              height: 11.84,
              alignment: Alignment.center,
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Container(
          margin:
          const EdgeInsets.only(left: 10),
          height: 17,
          width: 107,
          child: const Text(
            'For JEE-Mains',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff000000),
              fontFamily: 'AvenirNextLTPro',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SearchBar(
                controller: searchController,
                onChanged: (text) {
                  filterInstitutes(text);
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 29,
                    width: 79,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: const Color(0xFF7D23E0), width: 1.5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Filters',
                            style: TextStyle(
                                color: Color(0xFF7D23E0),
                                fontFamily: 'fonts/AvenirNextLTPro-Regular',
                                fontSize: 15)),
                        Icon(
                          Icons.sort_outlined,
                          size: 15,
                          color: Color(0xFF7D23E0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 29,
                    width: 79,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: const Color(0xFF7D23E0), width: 1.5),
                    ),
                    child: GestureDetector(
                      onTap: showSortOptionsDialog,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Sort',
                              style: TextStyle(
                                  color: Color(0xFF7D23E0),
                                  fontFamily: 'fonts/AvenirNextLTPro-Regular',
                                  fontSize: 15)),
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 15,
                            color: Color(0xFF7D23E0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 29,
                    width: 79,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7D23E0),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFF7D23E0), width: 1.5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('<2Km',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'fonts/AvenirNextLTPro-Regular',
                                fontSize: 15)),
                      ],
                    ),
                  ),
                  Container(
                    height: 29,
                    width: 79,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFF7D23E0), width: 1.5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('JEE',
                            style: TextStyle(
                                color: Color(0xFF7D23E0),
                                fontFamily: 'fonts/AvenirNextLTPro-Regular',
                                fontSize: 15)),
                      ],
                    ),
                  ),
                  Container(
                    height: 29,
                    width: 79,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFF7D23E0), width: 1.5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('UPSC',
                            style: TextStyle(
                                color: Color(0xFF7D23E0),
                                fontFamily: 'fonts/AvenirNextLTPro-Regular',
                                fontSize: 15)),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Column(
              children: filteredInstitutes.asMap().entries.map((entry) {
                final index = entry.key;
                final institute = entry.value;
                final instituteName = institute.name;
                final rating = institute.rating;
                final dist = institute.distance;
                final pri = institute.price;
                if (index == 2) {
                  return SizedBox(
                    width: 308,
                    height: 82,
                    child: Row(
                      children: [
                        Image.asset('images/women.png'),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text(
                                'Having a Tough time',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontFamily: 'fonts/AvenirNextLTPro-Regular',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Navigating Through your',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontFamily: 'fonts/AvenirNextLTPro-Regular',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Career Roadmap',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontFamily: 'fonts/AvenirNextLTPro-Regular',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 24,
                          width: 72,
                          decoration: BoxDecoration(
                            color: const Color(0xFF7D23E0),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: const Color(0xFF7D23E0), width: 1.5),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Ask Ostello',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'fonts/AvenirNextLTPro-Regular',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ReusableCard(
                      institutename: instituteName,
                      rating: rating,
                      distance: dist,
                      price: pri,
                    ),
                  );
                }
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
// SearchBar widget for the search input field
class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchBar({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                decoration: const InputDecoration(
                  hintText: 'Search for UPSC Coaching',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'AvenirNextLTPro-Regular',
                    color: Color(0xFF787878),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const SizedBox(height: 22.46, width: 22, child: Icon(Icons.search_rounded)),
            const SizedBox(width: 2),
            const Text('|'),
            const SizedBox(width: 4),
            const SizedBox(
              height: 20,
              width: 20,
              child: Icon(
                Icons.mic_none_outlined,
                size: 20,
                color: Color(0xFF7D23E0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
