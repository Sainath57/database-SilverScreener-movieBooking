<%--<%--
  Created by IntelliJ IDEA.
  User: sai
  Date: 11/25/23
  Time: 8:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Booking</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.12/css/intlTelInput.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.12/js/intlTelInput.min.js"></script>
    <style>

        form {
            background-color: #ffffff; /* White background color */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 600px; /* Increased form width for two columns */
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            box-sizing: border-box;
        }



        label {
            display: block;
            margin-bottom: 8px;
            width: calc(48% - 8px); /* Set label width for two columns with a small gap */
            box-sizing: border-box;
        }

        input, select, button {
            width: calc(48% - 8px); /* Set input/select/button width for two columns with a small gap */
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        input[type="date"] {
            width: 46%; /* Full width for date and phone number inputs */
        }

        input[type="tel"] {
            width: calc(100% - 8px);
        }

        input[type="Password"] {
            width: 40%;
        }

        input[type="Phone Number"] {
            width: 100%;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Asterisk for required fields */
        .required::before {
            content: "* ";
            color: red;
        }
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f8f8f8f2; /* Light background color */
        }

        header {
            background-color: #4caf50; /* BookMyShow Pink */
            color: #fff;
            padding: 10px;
            text-align: left;
            width: 100%;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        h1,h2,h3,h4,h5 {
            margin: 0;
            font-size: 24px;
            margin-right: 10px;
            display: flex;
            align-items: center;
        }

        #searchContainer {
            display: flex;
            align-items: center;
            flex-grow: 1; /* Take remaining space in the header */
        }

        #searchIcon {
            font-size: 20px;
            color: #fff;
            margin-right: 5px;
        }

        #searchBox {
            padding: 8px;
            border: none;
            border-radius: 4px;
            width: 80%; /* Reduced width of the search box */
        }

        #UserButton,
        #Signout {
            background-color: #fff; /* White background color */
            color: #4caf50; /* BookMyShow Pink */
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #registerButton {
            margin-left: 5px;
        }

        #menuButton {
            background-color: transparent;
            border: none;
            cursor: pointer;
            font-size: 20px;
            color: #fff;
        }

        #menuDropdown {
            display: none;
            position: absolute;
            top: 40px;
            right: 0;
            background-color: #fff; /* White background color */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            z-index: 1;
        }

        .menuOption {
            padding: 10px;
            color: #4caf50; /* BookMyShow Pink */
            text-decoration: none;
            display: block;
        }

        .menuOption:hover {
            background-color: #f0f0f0; /* Light gray background on hover */
        }

        main {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
            width: 100%;
            box-sizing: border-box;
        }

        .movie {
            background-color: #fff; /* White background color */
            border-radius: 8px;
            margin: 20px;
            overflow: hidden;
            width: 300px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .movie:hover {
            transform: scale(1.05);
        }

        .movie img {
            width: 100%;
            border-radius: 8px 8px 0 0;
        }

        .movie-content {
            padding: 16px;
        }

        .movie h1,h2,h3,h4,h5 {
            color: #4caf50; /* BookMyShow Pink */
            margin-bottom: 8px;
            font-size: 18px;
        }

        .movie p {
            color: #333; /* Dark text color */
            margin-bottom: 16px;
            font-size: 14px;
        }

        .book-button {
            background-color: #4caf50; /* BookMyShow Pink */
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            width: 100%;
            text-align: center;
            text-decoration: none;
        }

        .book-button:hover {
            background-color: #4caf50; /* Slightly darker pink on hover */
        }

        .icons {
            text-align: right;
            margin-top: 20px;
        }

        .icons i {
            font-size: 36px;
            margin: 10px;
            color: #4caf50; /* BookMyShow Pink */
            cursor: pointer;
        }

        /* Additional styles for Hollywood movies section */
        #hollywoodSection{
            display: none;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
            width: 100%;
            box-sizing: border-box;
        }

        .hollywoodMovie{
            background-color: #fff; /* White background color */
            border-radius: 8px;
            margin: 20px;
            overflow: hidden;
            width: 300px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .hollywoodMovie:hover{
            transform: scale(1.05);
        }

        .hollywoodMovie img{
            width: 100%;
            border-radius: 8px 8px 0 0;
        }

        .hollywoodMovie-content{
            padding: 16px;
        }

        .hollywoodMovie h2{
            color: #4caf50; /* BookMyShow Pink */
            margin-bottom: 8px;
            font-size: 18px;
        }

        .hollywoodMovie h2{
            color: #4caf50; /* BookMyShow Pink */
            margin-bottom: 8px;
            font-size: 18px;
        }

        .hollywoodMovie p{
            color: #333; /* Dark text color */
            margin-bottom: 16px;
            font-size: 14px;
        }

        .hollywoodMovieRating{
            color: #4caf50; /* BookMyShow Pink */
            font-size: 16px;
        }

        /* Additional styles for categories */
        #categories {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .category {
            cursor: pointer;
            padding: 10px;
            background-color: #4caf50; /* BookMyShow Pink */
            color: #fff;
            border-radius: 4px;
        }

        .category:hover {
            background-color: #4caf50; /* Slightly darker pink on hover */
        }
        .dropdown {
            display: inline-block;
            position: relative;
        }
        .dropdown-options {
            display: none;
            position: absolute;
            overflow: auto;
        }
        .dropdown:hover .dropdown-options {
            display: block;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/booking" method="post" onsubmit="">
<header>
    <h1>
        🎬 SilverScreener
    </h1>
    <div id="searchContainer">
        <i id="searchIcon" class="fas fa-search"></i>
        <label for="searchBox"></label><input type="text" id="searchBox" placeholder="Search for movies...">
    </div>
    <div class="dropdown">
        <button id="UserButton">
            <%
                String firstName = (String) session.getAttribute("firstName");
                out.println("Welcome "+firstName);
            %>
        </button>
        <div class="dropdown-options">
            <a href="#">My Profile</a>
            <a href="booking_display">My Bookings</a>
        </div>
    </div>
    <a href="index.jsp" id="Signout" onsubmit="signOut()">Sign Out</a>
</header>
 <%--@declare id="movie"--%><h1>Hurry Up!! Tickets are Almost Done</h1>

        <label for="movies" class="required">Select Movie:</label>
        <select id="movies" name="movies" required>
            <option value="movie">--select--</option>
            <option value="THE HOLDOVERS">THE HOLDOVERS</option>
            <option value="THE MARVELS">THE MARVELS</option>
            <option value="NAPOLEON">NAPOLEON</option>
            <option value="THANKSGIVING">THANKSGIVING</option>
            <option value="WISH">WISH</option>
            <!-- Add more movie options as needed -->
        </select>
            <br>

            <label for="theaters" class="required">Select Theatre:</label>
            <select id="theaters" name="theaters" required>
                <option value="theater">--select--</option>
                <option value="University 16, 1793 Oconee Connector, Athens, GA 30606">University 16, 1793 Oconee Connector, Athens, GA 30606</option>
                <option value="Cine, 234 W. Hancock Ave., Athens, GA 30601">Cine, 234 W. Hancock Ave., Athens, GA 30601</option>
                <option value="B&B Theatres Athens 12, 1570 Lexington Rd., Athens, GA 30605">B&B Theatres Athens 12, 1570 Lexington Rd., Athens, GA 30605</option>
                <option value="Beechwood Stadium Cinemas 11,196 Alps Road, Athens, GA 30606">Beechwood Stadium Cinemas 11,196 Alps Road, Athens, GA 30606</option><!-- Add more theater options as needed -->
            </select>
                <br>
            <label for="dates" class="required">Select Date:</label>
            <input type="date" id="dates" name="dates" required>
            <br>
            <label for="time" class="required">Select Time:</label>
            <select id="time" name="time" required>
                <option value="time0">--select--</option>
                <option value="10:00 AM">10:00 AM</option>
                <option value="2:00 PM">2:00 PM</option>
                <option value="6:00 PM">6:00 PM</option>
                <option value="9:00 PM">9:00 PM</option>
                <!-- Add more time options as needed -->
            </select>
            <br>
            <label for="seats" class="required">Select Seat:</label>
            <select id="seats" name="seats" required>
                <option value="0">--select--</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <!-- Add more seat options as needed -->
            </select>
            <br>

    <button type="submit"><b>Proceed</b></button>
</form>
</body>
</html>