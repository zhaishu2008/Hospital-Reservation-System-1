
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
         
         <div class="right" >Add Doctor
           
             <div class="text"><div class="column"></div><div class="column"><div class="h3">First Name</div><input type="text" id="fname" placeholder="Your First name" style="height: 30px;">
                 <div class="h3">Phone</div><input id="number" type="text" placeholder="000-000-0000" style="height: 30px;">
                 <div class="h3">Email</div><input id="loginEmail" type="email" placeholder="email" style="height: 30px;"></div>
                 <div class="column"><div class="h3">Last Name</div><input id="lname" type="text" placeholder="Your Last name" style="height: 30px;">
                 <div class="h3">Dob</div><input id="dob" type="date" value="1990-08-26" style="height: 30px;">
                 <div class="h3">Password</div><input id="loginPassword" type="text" placeholder="password" style="height: 30px;">
            </div>
                 <div class="h3">description</div><textarea id="description" rows="4" cols="40"></textarea>
                 <div class="h3">Gender</div>
                 <label class="radio-inline">
  <input type="radio" name="gender" id="sex1" value="male" checked="checked"> Male


  <input type="radio" name="gender" id="sex2" value="female"> Female
</label>
                 <div class="h3">Select Department</div>
                 <select id="select" name="modelId">
                 </select>
                 <br>
                 <br><br><br>
                
               
            </div><div class="column"></div><div class="column">
                <button class="SaveBt" onclick="addDoctor()">Add</button></div>
         </div>
        </div>
      </h1>
       
<script type="text/javascript">
     
    
    
   
    
    
    

   function addDoctor(){
       var useremail = $("#loginEmail").val();
                      var userpassword = $("#loginPassword").val();
                      var lastname = $("#lname").val();
                      var firstname = $("#fname").val();
                      var num = $("#number").val();
                      var gender = $("input:radio[name='gender']:checked").val();
                      var dob = $("#dob").val();
                      var descrip = $("#description").val();
                      var iss = 1;
                      var depart = $("#select").find("option:selected").text();
       if(firstname===""){
           alert("The First Name cannot be empty");
           
           return false;
           
       }else
           
       if(lastname===""){
           alert("The Last Name cannot be empty");
           
           return false;
           
       }else
       
       if(num===""){
           alert("The Number cannot be empty");
           
           return false;
           
       }else
       
       if(useremail===""){
           alert("The Email cannot be empty");
           
           return false;
           
       }else
       
       
       
       if(userpassword===""){
           alert("The Password cannot be empty");
           
           return false;
           
       }else
       
       if(descrip===""){
           alert("The Description cannot be empty");
           
           return false;
           
       }else
   
       if(depart===""){
           alert("The Department cannot be empty");
           
           return false;
           
       }else
       
       if(userpassword.length < 6){
           alert("The Password must be no fewer than six characters in length");
          
           return false;
           
       }

       
       var departID;
       var wholeName = $("#fname").val()+" "+$("#lname").val();
       console.log(depart);
       
       var hey = firebase.database().ref('/Departments').orderByChild('Name').equalTo(
               depart);
      hey.on("child_added", snap => { 
          departID = snap.key;
          console.log(departID);
        
      });
       
      
    var errorMessage =" ";
    firebase.auth().createUserWithEmailAndPassword(useremail, userpassword).catch(function(error) {
 
  var errorCode = error.code;
  errorMessage = error.message;
  window.alert("Error: " + errorMessage);
  
    });
    
  if (errorMessage==" "){
       console.log("do");
       firebase.auth().onAuthStateChanged(function(user){
    if(user) {
        console.log(user.uid);
        firebase.database().ref('Departments/'+departID+'/Doctors/'+user.uid).set({
    DoctorName: wholeName
    
  });
        
        console.log(wholeName);
        firebase.database().ref('Doctors').push().set({
    Email: useremail,
     Password: userpassword,
    Lastname: lastname,
    Firstname: firstname,
    PhoneNum: num,
    WholeName: wholeName,
    Department: depart,
    Gender: gender,
    isstaff: iss,
     DOB: dob,
      Description: descrip
  }).then(function(){
    console.log("success");
  }).catch(function(err){
    console.error("error：",err);
  });   
    
    window.alert("Add Doctor successfully");
    window.location.href="ManageDoctor.jsp";
        
   
  }}); 
      
  }
   
    
  
  
       
       
  
   }
   
   
   
   window.onload = load();
   function load(){
      
var myArray=new Array();
var leadsRef = firebase.database().ref('/Departments');


leadsRef.on('value', function(snapshot) {
    snapshot.forEach(function(childSnapshot) {
      var childData = childSnapshot.val().Name;
      console.log(childSnapshot.val());
     myArray.push(childData);
     
     
    });
     console.log(myArray);
     var len = myArray.length;
for(var i=0;i<len; i++){
    $("#select").append("<option value='Value'>"+myArray[i]+"</option>");
   }
  
});
   }
</script>
  </body>
</html>

