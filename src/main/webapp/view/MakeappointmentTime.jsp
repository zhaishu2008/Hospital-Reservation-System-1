<%--
    Document   : MakeappointmentDepart
    Created on : Oct 1, 2018, 11:21:25 PM
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="dateCss/default.css" id="theme_base">

<link rel="stylesheet" href="dateCss/default.date.css" id="theme_date">

<link rel="stylesheet" href="dateCss/default.time.css" id="theme_time">

<script src="../lib/picker.js"></script>

    <script src="../lib/picker.date.js"></script>

    <script src="../lib/picker.time.js"></script>


    </head>
    <body>
        


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
    <div class="right" >
        <div class="boxleft">Booking Now
            <div class="text"><br><br><div class="h3"><a id="depart" href="javascript:history.go(-2);">Back to Select Department</a></div>
          <br>
          <div class="h3"><a id="doctor" href="javascript:history.go(-1);">Back to Select Doctor</a></div>
          <br>
          
        </div></div>
        <div class="boxright">
           
           <div> 
           <p class="h6" >Date</p >
  <input id="Date" class="input2" placeholder="DD/MM/yyyy">
  
</div>
            <br>

            
            <div>
   <p class="h6">Time</p >
  <input id="Time" class="input2" placeholder="00:00 AM/PM">
           <br>
           <textarea id="comments" rows="4" cols="50">please give any comments</textarea>
            <div class="h2"><button id="comfirm" class="LogOutBt">Comfirm</button></div>
           <br>
          

</div>
           
            
            
        </div>
    </div>

   </div>
 </h1>

<script>
    var $input = $("#Date").pickadate({min: new Date(2018,10,2)});
     var $input = $("#Time").pickatime({
   min: [9,0],
  max: [17,0]
});


 firebase.auth().onAuthStateChanged(function(user){
    if(user) {
        var previous = document.referrer;
        
        
    if(previous.indexOf("Selct")>0)
   {
       window.alert("please select department and doctor");
   }
   else
   {
        
$("#comfirm").click(function(){
    var doctorId;
    var hasTime;
    var hasDate;
    var time = $("#Time").val();
    var date = $("#Date").val();
  var doctorName =  $("#doctor").text();
  
 var go = firebase.database().ref("/Appointments").orderByChild("WholeName").equalTo(
               doctorName);
      go.on("child_added", snap => { 
          hasTime = snap.child("Time").val();
          hasDate = snap.child("Date").val();
          doctorId = snap.key;
          console.log(hasTime);
            console.log(hasDate);
        
      });
    if (hasTime==time&&hasDate==date){
       alert("This doctor is bussy in this time");
       return false;
    }
    
    firebase.database().ref('/Users/' + user.uid).once('value').then(function(snapshot) {
    var firstname = snapshot.val().Firstname;
    var lastname = snapshot.val().Lastname;
    var patientname = firstname+" "+lastname;
    
   console.log($("#depart").text());
    
        var appointmentRef = firebase.database().ref('/Appointments');
    appointmentRef.push().set({
    uid: user.uid,
    Patient: patientname,
    Time: $("#Time").val(),
    Date: $("#Date").val(),
    Comments: $("#comments").val(),
    DoctorName: $("#doctor").text(),
    Department: $("#depart").text()
  }).then(function(){
    console.log("success");
  }).catch(function(err){
    console.error("error：",err);
  });
  var userappointmentRef = firebase.database().ref('/Users/'+user.uid+"/Appointments");
    userappointmentRef.push().set({
    Time: $("#Time").val(),
    Date: $("#Date").val(),
    Comments: $("#comments").val(),
    DoctorName: $("#doctor").text(),
    Department: $("#depart").text()
  }).then(function(){
    console.log("success");
    
  }).catch(function(err){
    console.error("error：",err);
  });
  
  var doctorId;
  var doctorName =  $("#doctor").val;
  
 var hey = firebase.database().ref("/Doctors").orderByChild("WholeName").equalTo(
               doctorName);
      hey.on("child_added", snap => { 
          doctorId = snap.key;
          console.log(doctorId);
        
      });
    
  
   var doctorappointmentRef = firebase.database().ref('/Doctors/'+doctorId+'/Appointments');
    doctorappointmentRef.push().set({
    uid: user.uid,
    Patient: patientname,
    Time: $("#Time").val(),
    Date: $("#Date").val(),
    Comments: $("#comments").val()
    
  }).then(function(){
    console.log("success");
     window.alert("Making appointment successfully");
  window.location.href="MakeappointmentHome.jsp";
  }).catch(function(err){
    console.error("error：",err);
  });

});});
}}});


window.onload = load();
function load(){
   
    firebase.auth().onAuthStateChanged(function(user){
    if(user) {
        var url=decodeURI(location.href); 

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
