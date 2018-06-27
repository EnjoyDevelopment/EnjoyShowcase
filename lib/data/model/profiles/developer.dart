import 'package:EnjoyShowcase/ui/profile_screen/developer_details_page.dart';
import 'package:meta/meta.dart';

class Developer {
  Developer({
    @required this.firstName,
    @required this.lastName,
    @required this.avatar,
    @required this.backdropPhoto,
    @required this.location,
    @required this.biography, 
    @required this.developerEnumIndex,
   // @required this.videos,
  });

   String firstName;
  final String lastName;
  final String avatar;
  final String backdropPhoto;
  final String location;
  final String biography;
  int  developerEnumIndex;
  //final List<Video> videos;
}

