import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  // Set to keep track of selected items
  final Set<int> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: 8, // Number of items
              itemBuilder: (context, index) {
                final isSelected = _selectedItems.contains(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedItems.remove(index);
                      } else {
                        _selectedItems.add(index);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey,
                      border: Border.all(
                        color: isSelected ? Colors.blueAccent : Colors.grey,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to Main Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedItems.forEach((index) {
                      // Logic to delete selected items
                      // In this case, we just remove the index from the set
                    });
                    _selectedItems.clear();
                  });
                },
                child: Text('Delete Selected Items'),
              ),
            ],
          ),
          SizedBox(height: 16.0), // Spacing at the bottom
        ],
      ),
    );
  }
}
