import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  final String? urlImage;
  final String title;
  final String description;
  final Function? onTap;
  bool isCheck;

  NewsCard({
    super.key,
    required this.urlImage,
    required this.title,
    required this.description,
    this.onTap,
    this.isCheck = false,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            widget.urlImage == null
                ? Container()
                : Image.network(
                    widget.urlImage!,
                    width: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Упс\n 404\n ^_^',
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    widget.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    softWrap: false,
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                setState(() {
                  widget.onTap!();
                  widget.isCheck = !widget.isCheck;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.isCheck
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
