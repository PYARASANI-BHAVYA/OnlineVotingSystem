<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cast Your Vote</title>
</head>
<body>
    <h2>Vote for Your Candidate</h2>
    <form action="vote_success.jsp" method="post">
        <input type="hidden" name="action" value="vote">
        <label for="candidate">Choose a candidate:</label>
        <select name="candidate" id="candidate">
            <option value="Candidate A">Candidate A</option>
            <option value="Candidate B">Candidate B</option>
            <option value="Candidate C">Candidate C</option>
        </select>
        <br><br>
        <button type="submit">Submit Vote</button>
    </form>
</body>
</html>
