import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widgets/text_widgets.dart';

class WorkoutListShimmerWidget extends StatelessWidget {
  final int itemCount;

  const WorkoutListShimmerWidget({super.key, this.itemCount = 10});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 10),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ListTile(
              tileColor: Colors.grey.shade100,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://media.istockphoto.com/id/1203043225/photo/woman-working-out-at-home.jpg?s=612x612&w=0&k=20&c=WBJnvosPoiE8cqOL8r8Pm3DNMb8StFN46WLyypj7k9M=',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: TitleText(title: 'Name'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [BodyText(body: 'Duration: ${0} seconds')],
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
            ),
          ),
        );
      },
    );
  }
}
