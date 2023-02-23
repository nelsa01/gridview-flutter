class User{
  String firstName;
  String lastName;

  User( { required this.firstName,  required this.lastName});
  
  static List<User>getUser() {
  return <User>[
    User(firstName:"Nelsa", lastName:"ISHIMWE"),
    User(firstName:"Maryse", lastName:"UMUTONI"),
    User(firstName:"Aline", lastName:"UMUHIRE"),
    
  ];
}
}