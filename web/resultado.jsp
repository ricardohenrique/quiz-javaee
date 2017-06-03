<%-- 
    Document   : resultado
    Created on : 31/05/2017, 00:22:25
    Author     : Ricardo Mota
--%>

<%@page import="DAO.DAOUser"%>
<%@page import="DAO.DAOHistory"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Quiz</title>
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800">
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="plugin/materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="css/resultado.css">

        <script type="text/javascript" src="plugin/jquery/jquery-3.2.0.min.js"></script>
        <script src="https://use.fontawesome.com/aa2928776d.js"></script>
        <script type="text/javascript" src="plugin/materialize/js/materialize.min.js"></script>
    </head>
    <body>
        <div class="container" id="resultado">
            <div class="row">
                <div class="col-sm-12">
                    <h1>
                        <% 
                            String name = (String)request.getSession().getAttribute("name");
                            String aceept = (String)request.getSession().getAttribute("accept"); 
                            out.print(name);
                        %>
                        <br>Sua pontuação foi: <% out.print(aceept); %>
                    </h1>
                    <a href="index.html" style="font-size: 16px;">Tentar de novo</a>
                </div>
                <table class="striped centered">
                    <thead>
                        <tr>
                            <th>Colocação</th>
                            <th>Pontuação</th>
                            <th>Nome</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        DAOHistory dHistory = new DAOHistory();
                        ResultSet history = dHistory.select();

                        DAOUser dUser = new DAOUser();
                        ResultSet users = dUser.select();
                        ResultSet users2 = dUser.select();
                        int countUser = 0;
                        while (users.next()) {
                            countUser++;
                        }
                        String arrayUser[][] = new String[countUser][2];
                        countUser = 0;
                        while (users2.next()) {
                            arrayUser[countUser][0] = Integer.toString(users2.getInt("playerId"));
                            arrayUser[countUser][1] = users2.getString("playerName");
                            countUser++;
                        }
                        int countCol = 0;
                        while (history.next()) {
                            for (int i = 0; i < countUser; i++) {
                                if (history.getInt("playerId") == Integer.parseInt(arrayUser[i][0])) {
                                    countCol++;
                                    out.print("<tr>");
                                        out.print("<td>"+countCol+"</td>");
                                        out.print("<td>"+history.getInt("result")+"</td>");
                                        out.print("<td>"+arrayUser[i][1]+"</td>");
                                    out.print("</tr>");
                                }
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
