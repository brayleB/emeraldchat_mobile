
//dashboardItems
class DashboardItems {
  int? id;
  String? title;
  String? details;
  String? img;
  DashboardItems({this.id, this.title, this.details, this.img});
}
List<DashboardItems> dashboardItems = [
  DashboardItems(    
    id: 1,
    title: '1 on 1 Text Chat',    
    details: 'Emerald will match you to a 1 on 1 text chat',
    img:'assets/icons/textchaticon.png'
  ),
   DashboardItems(    
    id: 2,
    title: 'Video Chat',    
    details: 'Emerald will match you to a video chat',
    img:'assets/icons/videochaticon.png'
  ),
   DashboardItems(    
    id: 3,
    title: 'Group Text Chat',    
    details: 'Match with a random group of people in Emerald',
    img:'assets/icons/groupchaticon.png'
  ),

];