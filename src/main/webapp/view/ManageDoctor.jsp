<%-- 
    Document   : ManageDoctor
    Created on : 2018-10-8, 0:38:52
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
              <td><a href="Management.jsp">Management</a></td>
          </tr>
     </table></div>
            <br>
     <div class="h2"><button id="logout" class="LogOutBt">Log out</button></div>

     </div>
     <div class="right" >
         <div class="boxleft">Manage
             <div class="text"><br><br><div class="h3"><a href="ManageDoctor.jsp">Doctor</a></div>
           <br>
                 <div class="h3"><a href="ManageDepartment.jsp">Department</a></div>
           <br>
           <div class="h3"><a href="ManageUser.jsp">User</a></div>
         </div></div>
         <div class="boxright">
             <div> <a href="AdminAddDoctor.jsp">
       <img src="../images/add.png" width="8%" height="30px">
                         </a></div>
             <div id="add">
             <div class="sbox"><div class="txt1">
             <div class="card"><div class="column3"><img src="qp.jpeg" alt="qp" style="width:100%"></div><div class="container" >
             <div class="column4">
                 <div class="h4" ><br><p>Shan Wilson</p></div></div>
                 </div></div><div class="txt2"><div class="h5"><div class="popup" onclick="myFunction()">Show Doctor Information<span class="popuptext" id="1">SADshagd ashjh LS  fhieu dsf sdadasdada
              sadasdada</span></div>

                 </div></div></div></div>
             <br>
             <div  class="sbox"><div class="txt1">
             <div class="card"><div class="column3"><img src="as.jpeg" alt="qp" style="width:100%"></div><div class="container" >
             <div class="column4">
                 <div class="h4" ><br><p>Petter pianapple</p></div></div>
                 </div></div><div class="txt2"><div class="h5"><div class="popup" onclick="myFunctiona()">Show Doctor Information<span class="popuptext" id="2">asas Li Bei Lei 大坏蛋大笨猪 猪猪猪猪 猪猪猪 猪猪猪</span></div>

                 </div></div></div></div>
             <br>
             <div class="sbox"><div class="txt1">
             <div class="card"><div class="column3"><img src="ss.jpeg" alt="qp" style="width:100%"></div><div class="container" >
             <div class="column4">
                 <div class="h4" ><br><p>Ko Lisdwa</p></div></div>
                 </div></div><div class="txt2"><div class="h5"><div class="popup" onclick="myFunctions()">Show Doctor Information<span class="popuptext" id="3">adadada as ada   ada dad   dffffaa a asdadadadada
              sadasdada</span></div>

                 </div></div></div></div>
             </div>
         </div>

     </div>

    </div>
  </h1>
  <script>
        function myFunction(x){
                 var popup = document.getElementById(x);
                 popup.classList.toggle("show");
             }

            
             
             window.onload=onload();
             function onload(){
                 var addDepart =  "";
var ln=new Array();
var fn=new Array();
var dp=new Array();
var leadsRef = firebase.database().ref('/Doctors');


leadsRef.on('value', function(snapshot) {
    snapshot.forEach(function(childSnapshot) {
      var lastname = childSnapshot.val().Lastname;
      var firstname = childSnapshot.val().Firstname;
      var description = childSnapshot.val().Description;
      
     ln.push(lastname);
     fn.push(firstname);
     dp.push(description);
     
     
    });
console.log(ln);
     var len = ln.length;
for(var i=0;i<len; i++){
   addDepart = addDepart + '<div class="sbox"><div class="txt1"><div class="card"><div class="column3"><img src="qp.jpeg" alt="qp" style="width:100%"></div><div class="container" ><div class="column4"><div class="h4" ><br><p onclick="selectDoctor()">'
           +fn[i]+ln[i]+'</p></div></div></div></div><div class="txt2"><div class="h5"><div class="popup" onclick="myFunction()">Show Doctor Information<span class="popuptext" id="'+i'">'
   +dp[i]+'</span></div></div></div></div></div><br>';
   }
   $("#add").html(addDepart);
}); 
             }

</script>
</body>
</html>
