import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmail_clone/data/classes/email.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

class EmailView extends StatefulWidget {
  const EmailView({Key key,
    @required this.item,
    this.favoriteChanged,
  }) : super(key: key);

  final EmailItem item;
  final VoidCallback favoriteChanged;

  @override
  // ignore: library_private_types_in_public_api
  _EmailViewState createState() => _EmailViewState();
}

class _EmailViewState extends State<EmailView> {
  String _preview;

  @override
  void initState() {
    rootBundle.loadString("assets/email_preview.md").then((data) {
      setState(() {
        _preview = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_preview == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.item?.title ?? "",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              IconButton(
                icon: (widget.item?.favorite ?? false)
                    ? const Icon(Icons.star, color: Colors.amber)
                    : const Icon(Icons.star_border),
                onPressed: widget.favoriteChanged,
              ),
            ],
          ),
        ),
        Expanded(
          child: Markdown(data: _preview),
        ),
      ],
    );
  }
}
