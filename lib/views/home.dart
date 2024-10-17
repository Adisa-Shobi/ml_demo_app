import 'package:flutter/material.dart';

class StyledValueDisplay extends StatelessWidget {
  final bool isAssessment;
  final bool loading;
  final dynamic value;
  final String? unit;
  final String? error;

  const StyledValueDisplay({
    Key? key,
    this.isAssessment = false,
    this.loading = false,
    this.value,
    this.unit,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isAssessment) return const SizedBox.shrink();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _getValue(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        const SizedBox(width: 8),
        if (unit != null)
          Text(
            unit!,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
      ],
    );
  }

  String _getValue() {
    if (loading) return '...';
    if (error != null ||
        value == null ||
        (value is String && value.toLowerCase() == 'nan')) {
      return '-';
    }
    return value.toString();
  }
}
