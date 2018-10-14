<%-- 
    Document   : login
    Created on : Sep 1, 2018, 1:44:02 AM
    Author     : Jesse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital Reservation System</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
       
        <link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/3.1.1/firebaseui.css" />
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        


<script src="https://www.gstatic.com/firebasejs/5.5.4/firebase.js"></script>
<!-- Firebase App is always required and must be first -->
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-app.js"></script>

<!-- Add additional services that you want to use -->
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-firestore.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-messaging.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-functions.js"></script>

<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyB3tgflnOWGhR0EVvjW6ldubM6vSdNqBFE",
    authDomain: "premium-origin-217008.firebaseapp.com",
    databaseURL: "https://premium-origin-217008.firebaseio.com",
    projectId: "premium-origin-217008",
    storageBucket: "premium-origin-217008.appspot.com",
    messagingSenderId: "1538681596"
  };
  firebase.initializeApp(config);
  </script>
</head>

    <body background="../images/login.jpeg">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 <a href="../index.jsp">
       <img src="../images/logo.png" width="10%" height="92px">
       </a>

        <div style="width: 500px;
margin-left: auto; margin-right: auto; margin-top: 10%; margin-bottom: auto; text-align: center;
">
            <div style="height:60px; line-height: 60px; font-family:verdana; font-size:120%; color: white; background-color: #1D6DF1;">Log in</div>
            <form style="background-color: white; height: 400px; padding: 60px;">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="loginEmail" placeholder="Email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password"class="form-control" id="loginPassword" placeholder="Password">
  </div>
          
                <center><input type =“button” value="Log in" class="btn btn-primary" onclick="login()"></center>
                <br />
                <br />
                <div class="help-block">Dont't have an account?</div><a href='signup.jsp'>Sign up</a>
                </form>
</div>

<script>
                   
                    
                    function login(){
                      var useremail = $("#loginEmail").val();
                      var userpassword = $("#loginPassword").val();
                      firebase.auth().signInWithEmailAndPassword(useremail, userpassword).catch(function(error) {
  
  var errorCode = error.code;
  var errorMessage = error.message;
  
  window.alert("Error: " + errorMessage);
 

}); 
firebase.auth().onAuthStateChanged(function(user){
    
        if(user) {
            
             var uid = user.uid;
             if (uid.indexOf("7oRThGdNZ71QVmORJ")>0){
                 window.location.href="Admin.jsp";
             }
            
    firebase.database().ref('/Users/' + uid).once('value').then(function(snapshot) {
       var isStaff = snapshot.val();
        if (isStaff!=null){
           
     window.alert("Log in successfully");
  window.location.href='Homepage.jsp';
  
  console.log(uid);
        
     }else{
     window.location.href="DoctorHomepage.jsp";
 }
    
        
 });
        }});} 
           
          
           
                </script>
        
    </body>
</html>
