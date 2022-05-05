class ApiConstants {
  static const gitHubApi = "https://api.github.com/users/";

static String getUserApi(String username){
   return "$gitHubApi$username";
 } 

 static String getRepoApi(String username){
   return "https://api.github.com/users/dilshad0202/repos";
 } 



}

