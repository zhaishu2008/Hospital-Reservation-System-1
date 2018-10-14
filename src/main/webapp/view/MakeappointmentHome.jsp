<%--
    Document   : MakeappointmentHome
    Created on : Oct 1, 2018, 11:11:24 PM
    Author     : Jesse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="HospitalReservationSystem.Makeappointment"%>

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
    <jsp:useBean id="makeappointment" scope="session" class="HospitalReservationSystem.Makeappointment"/> 
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
          <td><a href="Homepage.jsp">Homepage</a></td>
      </tr>
         <tr>
             <td><a href="Profile.jsp">My Profile</a></td>
         </tr>
         <tr>
             <td><a href="MakeappointmentHome.jsp">Make appointment</a>
         </tr>
         <tr>
             <td><a href="Myappointment.jsp">My appointment</a></td>
         </tr>
    </table></div>
            <br>
   <div class="h2"><button id="logout" class="LogOutBt">Log out</button></div>

    </div>
    <div class="right" >Booking Now
        <div class="text"><br><br><div class="h3"><a id="depart" onclick="makeAppointment()" href="MakeappointmentDepart.jsp">Make an appointment</a></div>
          <br>
         
          </div>
    </div>

   </div>
 </h1>
<script>
   function makeAppointment(){
 var department = $("#depart").text();
 var Doctor = $("#doctor").text();
 
 console.log(department);
 console.log(Doctor);

var url="MakeappointDepart.jsp"+"?"+department+"&"+Doctor;
    window.location.assign(encodeURI(url)); 
}
    
    
window.onload = load();
function load(){
   
    firebase.auth().onAuthStateChanged(function(user){
    if(user) {
        var url=location.href; 

 console.log(url);
  var previous = document.referrer;
 
  if(previous.indexOf("&")>0){
      console.log(url);
var txt=url.split("?")[1];
var depart=txt.split("&")[0];
var doctor=txt.split("&")[1];
console.log(txt);
       console.log(depart);
       console.log(doctor);
       $("#depart").text(depart);
         $("#doctor").text(doctor);
     }
    }
});
}
</script>


    </body>
</html>
