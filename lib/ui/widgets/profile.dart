import 'package:budgeit/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({
    super.key,
    required this.constraints,
    required this.title,
    required this.iconName,
    required this.titleValue,
    this.isSensitive = false, // New parameter to indicate sensitive data
  });

  final BoxConstraints constraints;
  final String title;
  final IconData iconName;
  final String titleValue;
  final bool isSensitive;

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool _isTextObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.iconName,
              color: kGrayTextC,
              size: 25,
            ),
            SizedBox(
              width: widget.constraints.maxWidth * 0.06,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(color: kGrayTextC, fontSize: 14),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.isSensitive && _isTextObscured ? '••••••••••' : widget.titleValue,
                          style: const TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (widget.isSensitive)
                        IconButton(
                          icon: Icon(
                            _isTextObscured ? Icons.visibility_off : Icons.visibility,
                            color: kGrayTextC,
                          ),
                          onPressed: () {
                            setState(() {
                              _isTextObscured = !_isTextObscured;
                            });
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: widget.constraints.maxHeight * 0.01,
        ),
        Divider(
          thickness: 1,
          color: kGrayTextC.withOpacity(0.2),
        ),
        SizedBox(
          height: widget.constraints.maxHeight * 0.01,
        ),
      ],
    );
  }
}
