<%-- 
    Document   : DoctorHomepage
    Created on : 2018-10-2, 16:46:01
    Author     : mac
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
             <td><a href="DoctorProfile.jsp">My Profile</a></td>
         </tr>
         
         <tr>
             <td><a href="DoctorHomepage.jsp">My appointment</a></td>
         </tr>
    </table></div>
            <br>
   <div class="h2"><button id="logout" class="LogOutBt">Log out</button></div>

    </div>
   <div class="right" >My appointment
      <div class="text" id="add">
          </div>
    </div>

   </div>
 </h1>
          
       <script>
          
           
            window.onload = onload();
           function onload(){
           firebase.auth().onAuthStateChanged(function(user){
    if(user) {
  var uid = user.uid;

     var addDepart = "";
var pn=new Array();
var da=new Array();
var tm=new Array();
var co=new Array();
var leadsRef = firebase.database().ref('/Doctors/'+uid+'/Appointments');


leadsRef.on('value', function(snapshot) {
    snapshot.forEach(function(childSnapshot) {
      var patientname = childSnapshot.val().Patient;
       var date = childSnapshot.val().Date;
        var time = childSnapshot.val().Time;
        
         var comments=childSnapshot.val().Comments;
     console.log(childSnapshot.val());
     pn.push(patientname);
     da.push(date);
     tm.push(time);
    
     co.push(comments);
     
    });
    console.log(pn);
     var len = pn.length;
for(var i=0;i<len; i++){
   addDepart = addDepart + '<div class="text"><button id="accordion" class="accordion" style="width: 550px;">Appointment '+(i+1)+'<span style="white-space:pre;">'+'         '+da[i]+'         '+tm[i]+'</span></button><div class="panel" style="text-align: left;"><p>Appointment<br>Data:  '
   +da[i]+"<br>Time: "+tm[i]+"<br>Patient: "+pn[i]+"<br>Comments: "+co[i]+"<br></p></div>";
   }
   $("#add").html(addDepart);
   console.log(addDepart);
   var acc = document.getElementsByClassName("accordion");
          var i;
           for(i = 0; i< acc.length;i++){
               acc[i].addEventListener("click",function(){
               this.classList.toggle("active");
               var panel = this.nextElementSibling;
               if(panel.style.display==="block"){
                panel.style.display="none";
               }else{
                   panel.style.display = "block";
               }
               });
           }
});
 }
 });}

          </script>

          
    </body>
</html>

