import 'package:flutter/material.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_response_model.dart';
import 'package:ranking_app/core/gpt/domain/models/gpt_role.dart';

class GPTResponseTile extends StatelessWidget {
  final GPTResponseModel response;

  const GPTResponseTile({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: response.role == GPTRole.user
            ? [
                _buildAvatar(),
                const SizedBox(
                  width: 20,
                ),
                _buildContent(),
              ]
            : [
                _buildContent(),
                const SizedBox(
                  width: 20,
                ),
                _buildAvatar(),
              ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 20,
      child: Text(
        response.role == GPTRole.user ? 'U' : 'A',
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              response.message,
              textAlign: response.role == GPTRole.user
                  ? TextAlign.start
                  : TextAlign.end,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: response.role == GPTRole.user
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
            ),
          );
        },
      ),
    );
  }
}
