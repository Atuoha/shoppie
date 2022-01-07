import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String text;
  final String image;
  final Color colors;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  CarouselItem(this.text,  this.image,  this.colors);

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 40,
        width: double.infinity,
        child: Card(
          color: Colors.transparent,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        maxLines: 3,
                        // ignore: deprecated_member_use
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Get Now',
                          style: TextStyle(
                            color: colors,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      image,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
