<%-- 
    Document   : AdminAddUser
    Created on : Oct 8, 2018, 10:06:07 PM
    Author     : Jesse
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital Reservation System</title>
      <link rel="stylesheet" type="text/css" href="web.css"> 
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
       
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        

<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase.js"></script>
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
  var database = firebase.database();
</script>
  





    </head>
    <body>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



        
       <script>  
   firebase.auth().onAuthStateChanged(function(user){
    if(user) {
        $("#logout").click(function(){firebase.auth().signOut().then(function() {
 window.alert("Log out successfully"); 
 window.location.href="../index.jsp";
}).catch(function(error) {
});});
    }else{
        window.location.herf="../index.jsp";
   }});
 
</script>

     <h1><div class="box"><div class="leftbox"><div class="h1"><strong>HRS</strong>
         </div>
        <div class="table">
         <table>
          
         <tr>
             <td><a href="Management.jsp">Management</a></td>
         </tr>
         
         
         </table></div>
                 <br>
        <div class="h2"><button id="logout" class="LogOutBt">Log out</button></div>
         
         </div>
         
         <div class="right" >Add User
            
             <div class="text"><div class="column"></div><div class="column"><div class="h3">First Name</div><input type="text" id="fname" placeholder="Your First name" style="height: 30px;">
                 <div class="h3">Phone</div><input id="number" type="text" placeholder="000-000-0000" style="height: 30px;">
                  <div class="h3">Email</div><input id="loginEmail" type="text" placeholder="email" style="height: 30px;">
                 </div>
                 <div class="column"><div class="h3">Last Name</div><input id="lname" type="text" placeholder="Your Last name" style="height: 30px;">
                 <div class="h3">Dob</div><input id="dob" type="date" value="1990-08-26" style="height: 30px;">
                  <div class="h3">Password</div><input id="loginPassword" type="text" placeholder="password" style="height: 30px;">
                 </div>
                 <div class="column"></div><div class="column3">
                 <div class="h3">Gender</div>
                 <label>
  <input type="radio" name="gender" id="sex1" value="male" checked="checked"> Male


  <input type="radio" name="gender" id="sex2" value="female"> Female
                     </label></div>
                 <br>
                 <br><br><br>
                
               
            </div>
             <input class="SaveBt" type="button" value="Add" onclick="addUser()">
         </div>
        </div>
      </h1>
       
<script>
     


   function addUser(){
       
       if($("#fname").val()===""){
           alert("The First Name cannot be empty");
          
           return false;
           
       }else
           
       if($("#lname").val()===""){
           alert("The Last Name cannot be empty");
          
           return false;
           
       }else
       
       if($("#number").val()===""){
           alert("The Number cannot be empty");
         
           return false;
           
       }else
           
       if($("#loginEmail").val()===""){
           alert("The Email cannot be empty");
          
           return false;
           
       }else
       
       if($("#loginPassword").val()===""){
           alert("The Password cannot be empty");
          
           return false;
           
       }
      
       var useremail = $("#loginEmail").val();
                      var userpassword = $("#loginPassword").val();
                      
   var errorMessage =" ";
     firebase.auth().createUserWithEmailAndPassword(useremail, userpassword).catch(function(error) {
 
  var errorCode = error.code;
  errorMessage = error.message;
  window.alert("Error: " + errorMessage);
  
  
    });
   if (errorMessage==" "){
  firebase.auth().onAuthStateChanged(function(user){
      console.log(user.uid);
    if(user) {
        console.log(user.uid);
        firebase.database().ref('Users/'+user.uid).set({
    Email: useremail,
    Password: userpassword,
    Lastname: $("#lname").val(),
    Firstname: $("#fname").val(),
    PhoneNum: $("#number").val(),
    Gender: $("input:radio[name='gender']:checked").val(),
    DOB: $("#dob").val(),
    IsStaff: "0"
  });   
     window.alert("Sign up successfully");
  window.location.href='ManageUser.jsp';

 }
  
});
   }
   
   }
   
</script>
  </body>
</html>

