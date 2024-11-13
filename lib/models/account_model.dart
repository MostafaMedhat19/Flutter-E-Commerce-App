class AccountModel
{
   bool status;

  AccountModel({required this.status});
  factory AccountModel.fromJson(Map<String,dynamic>json)
  {

    return AccountModel(status:json['status']);
  }

}
