<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>��Ʈ(1.����)</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    
    <!-- �������� -->
    <link  href="resources/jqueryui/css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet">
	<script src="resources/jqueryui/js/jquery-ui-1.8.16.custom.min.js"></script>

	    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    
    <script>
    $(function() {
        
    	$("#today").text(new Date().toLocaleDateString());

 
        
        // ������(fromDate)�� ������(toDate) ���� ��¥ ���� �Ұ�
        // ������(toDate)�� ������(fromDate) ���� ��¥ ���� �Ұ�

        //������.
        $('#fromDate').datepicker({
            
            dateFormat: "yy-mm-dd",             // ��¥�� ����
            onClose: function( selectedDate ) {    
                // ������(fromDate) datepicker�� ������
                // ������(toDate)�� �����Ҽ��ִ� �ּ� ��¥(minDate)�� ������ �����Ϸ� ����
                $("#toDate").datepicker( "option", "minDate", selectedDate );
            }                
        });

        //������
        $('#toDate').datepicker({
            dateFormat: "yy-mm-dd",
            onClose: function( selectedDate ) {
                // ������(toDate) datepicker�� ������
                // ������(fromDate)�� �����Ҽ��ִ� �ִ� ��¥(maxDate)�� ������ �����Ϸ� ���� 
                $("#fromDate").datepicker( "option", "maxDate", selectedDate );
            }                
        });
    });


  
 
	 
  </script>

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
                <a class="navbar-brand" href="main.jsp">���ָ� ã�� ����</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="route_day.jsp">��Ʈ</a>
                    </li>
                    <li>
                        <a href="services.html">�Խ���</a>
                    </li>
                    <li>
                        <a href="contact.html">���� ��Ʈ</a>
                    </li>
					<li>
                        <a href="contact.html">�α���</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">��Ʈ
                    <!-- <small>���� ����</small> -->
                </h1>
                <ol class="breadcrumb">
                    <li><a href="about.html">step1) ���� ����</a>
                    </li>
                    <li class="active"> step2) ��� ����</li>
					 <li class="active"> step3) ���� Ȯ��</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        
         <!-- Intro Content -->
        <div class="row">
            <div class="col-md-10">
            
 				���� ��¥ : <span id="today"></span>

 				
				<p>�����: <input type="text" id="fromDate"></p>
				<p>������: <input type="text" id="toDate"></p>
 
 
			</div>
		<div>
	</body>
</html>