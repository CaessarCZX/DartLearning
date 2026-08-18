import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorsTheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hello, darling.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5.0),

        _ImageBubble(),

        const SizedBox(height: 10.0),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double imageBubbleWidth = size.width * 0.7;
    final double imageBubbleHeight = 150;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/no/25-55dc62642f92cf4110659b3c80e0d7ec.gif',
        width: imageBubbleWidth,
        height: imageBubbleHeight,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: imageBubbleWidth,
            height: imageBubbleHeight,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Mi amor is sending a image'),
          );
        },
      ),
    );
  }
}
