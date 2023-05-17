function generateOAuthToken() {
  var url = 'https://accounts.google.com/o/oauth2/token';
  var client_id = 'your_client_id';
  var client_secret = 'your_client_secret';
  var grant_type = 'client_credentials';
  
  var xhr = new XMLHttpRequest();
  xhr.open('POST', url, false);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xhr.send('client_id=' + client_id + '&client_secret=' + client_secret + '&grant_type=' + grant_type);
  
  var response = JSON.parse(xhr.responseText);
  var access_token = response.access_token;
  
  return 'Bearer ' + access_token;
}
