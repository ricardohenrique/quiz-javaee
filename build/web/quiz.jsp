<%-- 
    Document   : quiz
    Created on : 15/05/2017, 23:25:41
    Author     : Ricardo Mota
--%>

<%@page import="java.nio.charset.Charset"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="DAO.DAOQuestion"%>
<%@page import="DAO.DAOAlternative"%>
<%@page import="DataBase.Connection"%>

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
        <link rel="stylesheet" type="text/css" href="css/quiz.css">

        <script type="text/javascript" src="plugin/jquery/jquery-3.2.0.min.js"></script>
        <script src="https://use.fontawesome.com/aa2928776d.js"></script>
        <script type="text/javascript" src="plugin/materialize/js/materialize.min.js"></script>
    </head>
    <body>
        <div class="container" id="quiz">
            <div class="row">
                <div class="col-sm-12">
                    <h1>
                        Bem vindo - 
                        <% 
                            String name = (String)request.getSession().getAttribute("name"); 
                            out.print(name);
                        %>
                    </h1>
                </div>
            </div>
            <form action="ServletQuiz" class="row" method="POST">
                <%
                    DAOQuestion question = new DAOQuestion();
                    ResultSet questions = question.select();
                    String arrayQuestions[][] = new String[11][2];
                    int countQuestion = 0;
                    while (questions.next()) {
                        arrayQuestions[countQuestion][0] = questions.getString("description");
                        arrayQuestions[countQuestion][1] = Integer.toString(questions.getInt("questionId"));
                        countQuestion++;
                    }
                    
                    DAOAlternative alternative = new DAOAlternative();
                    ResultSet alternatives = alternative.select();
                    String arrayAlternative[][] = new String[51][3];
                    int countAlternative = 0;
                    while (alternatives.next()) {
                        arrayAlternative[countAlternative][0] = alternatives.getString("description");
                        arrayAlternative[countAlternative][1] = Integer.toString(alternatives.getInt("questionId"));
                        arrayAlternative[countAlternative][2] = Integer.toString(alternatives.getInt("alternativeId"));
                        countAlternative++;
                    }
                    
                    int countMain = 0;
                    int countAlter = 0;
                    for (int q = 0; q < 10; q++) {
                        countMain++;
                        out.print("<div class='col s12 panel-question' id='question-"+countMain+"'>");
                        out.print("<h3 class='question-title'>"+ Integer.toString(countMain) +" - "+ arrayQuestions[q][0]+"</h3>");
                        for (int i = 0; i < 50; i++) {
                            countAlter++;
                            if(Integer.parseInt(arrayQuestions[q][1]) == Integer.parseInt(arrayAlternative[i][1])){
                                out.print("<p>");
                                    //out.print("<span>" + arrayAlternative[i][2] + "</span> - ");
                                    out.print("<input value='"+Integer.parseInt(arrayAlternative[i][2])+"' class='with-gap' name='question-"+countMain+"' type='radio' id='question-"+countMain+"-choose-"+countAlter+"'/>");
                                    out.print("<label for='question-"+countMain+"-choose-"+countAlter+"'>"+arrayAlternative[i][0]+"</label>");
                                out.print("</p>");
                            }

                        }
                        out.print("<div class='waves-effect waves-light btn cyan accent-4' id='back-"+countMain+"'>Voltar</div>");
                        out.print("<div class='waves-effect waves-light btn cyan accent-4' id='next-"+countMain+"' style='float: right;'>Próximo</div>");
                        out.print("</div>");
                       
                    }

                %>
                <button style="display:none;" class="waves-effect waves-light btn cyan accent-4" id="send-quiz">Enviar</button>
            </form>
        </div>
        
        <script type="text/javascript" src="js/quiz.js"></script>
    </body>
</html>
