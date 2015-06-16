<%@page import="javax.management.DescriptorKey"%>
<%@page import="dao.Description"%>
<%@page import="dao.UserType"%>
<%@page import="dao.KnowledgeArea"%>
<%@page import="dao.User"%>
<%@page import="dao.Book"%>
<%@page import="dao.Image"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DaisyKLR</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/3-col-portfolio.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="books.jsp">DaisyKLR</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="Sobre.jsp">Sobre</a>
                    </li>
                    <li>
                        <a href="historico.jsp">Historico</a>
                    </li>
                    <li>
                        <a href="DadosPessoais.jsp">Dados Pessoais</a>
                    </li>
                    <li>
                        <a href="Logout">Logout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Header -->
        <div class="row">
            <div class="col-lg-12">
            <% Image im = new dao.Image(Long.parseLong(request.getParameter("id")));
            		Book book = new dao.Book(im.getISBN()); 
            		Description Desc = im.getDescriptions();%>
                <h1 class="page-header">Avaliar Imagem
                    <small><% out.print(book.getTitle()); %>, <% out.print(book.getAuthor()); %></small>
                    <span class="pull-right">
                    <h3>
                    	<% User us = new dao.User((long) request.getSession().getAttribute("nusp"));
            				out.print(us.getName());
            				%>
					</h3>
            		</span>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-4 portfolio-item">
                <img class="img-responsive" src="ViewImage?id=<%=im.getId()%>" alt="">
            </div>
            <div class="col-md-4 portfolio-item">
                <aside>
                <h3>
                    Descrição:
                </h3>
                <p> &nbsp&nbsp&nbsp <%=Desc.getText() %>
                </aside>
            </div>
            
            <div class="col-md-6" style="margin-left:10%">
                <form method="post" action="EvDescription" class="form-inline">
                	<br>
                	<h1>
                	<input type="radio" name="Evaluate" value="Accept"> Aceitar
                	<input type="radio" name="Evaluate" value="Decline"> Descartar
                	</h1>
                	<p style="margin-left:20%"> 
                	<input type="submit" value="Avaliar" />
                </form>
            </div>
            
        </div>
        <!-- /.row -->

        <hr>

        <!-- Pagination>
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; DaisyKLR 2015</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
