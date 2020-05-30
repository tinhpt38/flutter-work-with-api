

class Province{
  final String id;
  final String name;
  final String type;


  Province.formJson(Map<String, dynamic> json):
  this.id = json['province_id'],
  this.name = json['province_name'],
  this.type = json['province_type'];


 Map<String, dynamic> toJson() => {
   'province_id':this.id,
   'province_name':this.name,
   'province_type':this.type
 };
}