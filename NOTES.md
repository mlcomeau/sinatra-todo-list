      <style>
  /* Will be applied to all elements  */
  * {
  box-sizing: border-box;
  font-family: Arial, Helvetica, sans-serif;
  }
    
  html {
    height: 100%;
  }

  /* Style the nav bar */
  .topnav {
    background-color: #9BD770;
    overflow: hidden;
  }
  
  /* Style the links inside the navigation bar */
  .topnav a {
    float: left;
    color: #1B3409;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
    font-weight: bold;
  }
  
  /* Change the color of links on hover */
  .topnav a:hover {
    background-color: #ddd;
    color: white;
  }

  /* applies to the yield statement */
  .main {
    height: 450px;
    background-color: #EBF7E3; 
    top: 0;  
  } 
   
  .center {
    text-align: center;
  }

  /* style the flash messages */
  p.flash {
    color: #1B3409; 
    font-weight: 700;
    margin-bottom: 10px;
    bottom: 1px;
    text-decoration-line: underline;
    text-decoration-style: wavy;
    font-weight: bold;
  }

  /* style buttons */
  a#def {
    text-decoration: none;
    background: white;
    color: black;
    border-radius: 5px;
    padding: 3px; 
    margin-bottom: 10px;
  }

  a#def:hover {
    cursor: pointer;
  }
  
  /* style forms  */
  .greenform {
    background-color: #9BD770;
    color: #375F1B;
    -moz-box-shadow: 0 0 10px rgba(0,0,0,.3);
    -webkit-box-shadow: 0 0 10px rgba(0,0,0,.3);
    box-shadow: 0 0 10px rgba(0,0,0,.3);
    margin: 9vh auto 16px auto;
    max-width: 500px;
    padding: 2.25%;
    width: 85%;
    text-align: center;
    border-radius: 5px;
  }

  /* style inputs of forms */
  input {
    font-size: 16px;
    background: #fff;
    border: 1px solid #FFF;
    padding: 2px;
    border-radius: 3px;
    margin:10px 0;
  }

  input[type="submit"]:hover {
  	background: #00ccff;
    cursor: pointer;
  }

  /* users/show.erb */

  #greeting {
    padding-left: 16px;
    padding-bottom: 20px;
    padding-top: 20px;
  }

  .container {
    width: 100%;
    height: 300px;
  }

  .first-box {
    width:300px; 
    float:left; 
    background: #9BD770; 
    color: #1B3409;
    height: 200px;
    margin-left: 300px;
    text-align: center;
    padding: 10px;
    overflow: auto;
  }

  .second-box {
    width:300px; 
    height: 200px; 
    float:right; 
    background: #9BD770;
    color: #1B3409;
    margin-right: 270px;
    text-align: center;
    padding: 10px;
    overflow: auto;
  }

  .third-box {
    width: 700px; 
    position: absolute;
    bottom: 90px;
    margin-left: 300px;
    background: #1B3409; 
    height: 50px;
    color: #66B032;
    text-align: center;
    padding: 10px;
  }

  a.links {
    text-decoration: none;
  }

  a.links:hover {
    text-decoration: underline;
  }

  /* tasks/show.erb */
  .task-container {
    text-align: center;
    height: auto;
  }

  .task {
    background-color: #375F1B;
    width: 200px;
    height: auto;
    display: inline-block;
    margin-top: 40px;
    border-radius: 10px;
  }

   h3#name {
    color: #EBF7E3;
    text-transform: uppercase;
  }

  /* tasks/new.erb */
  .new {
    height: 400px;
  }
    </style>