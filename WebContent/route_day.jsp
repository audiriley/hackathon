<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar" %>

<%
Calendar cal = Calendar.getInstance();

String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");
 
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);
 
if(strYear != null){
	year = Integer.parseInt(strYear);
	month = Integer.parseInt(strMonth); 
} 
//�⵵/�� ����
cal.set(year, month, 1);
 
int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;
 
//���� ��¥ ����.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));

%>    
    
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
                        <a href="datepicker.jsp">�Խ���</a>
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
            <div class="col-md-8">
            <form name="calendarFrm" id="calendarFrm" action="" method="post">
				 			
				<!--��¥ �׺���̼�  -->
				<table width="93%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:3px solid #C7D4FB">
					<tr>
					<td height="60">
	 
	       			<table width="100%" border="0" cellspacing="0" cellpadding="0">
	       			<tr>
	            	<td height="10"></td>
	       			</tr>
	      
	      			<tr>
	             	<td align="center" >
	                    <a href="<c:url value='/CalendarExam2.jsp' />?year=<%=year-1%>&amp;month=<%=month%>" target="_self">
	                           <b>&lt;&lt;</b><!-- ������ -->
	                    </a>
	                    <%if(month > 0 ){ %>
	                    <a href="<c:url value='/CalendarExam2.jsp' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self">
	                           <b>&lt;</b><!-- ������ -->
	                    </a>
	                    <%} else {%>
	                           <b>&lt;</b>
	                    <%} %>
	                    &nbsp;&nbsp;
	                    <%=year%>��
	                   
	                    <%=month+1%>��
	                    &nbsp;&nbsp;
	                    <%if(month < 11 ){ %>
	                    <a href="<c:url value='/CalendarExam2.jsp' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self">
	                           <!-- ������ --><b>&gt;</b>
	                    </a>
	                    <%}else{%>
	                           <b>&gt;</b>
	                    <%} %>
	                    <a href="<c:url value='/CalendarExam2.jsp' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self">
	                           <!-- ������ --><b>&gt;&gt;</b>
	                    </a>
	             	</td>
	       			</tr>
	       			</table>
	 
					</td>
					</tr>
				</table>
				<br>
				<table id ="table" border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
				<THEAD>
				<TR bgcolor="#CECECE">
			       <TD width='100px'>
			       <DIV align="center"><font color="red">��</font></DIV>
			       </TD>
			       <TD width='100px'>
			       <DIV align="center">��</DIV>
			       </TD>
			       <TD width='100px'>
			       <DIV align="center">ȭ</DIV>
			       </TD>
			       <TD width='100px'>
			       <DIV align="center">��</DIV>
			       </TD>
			       <TD width='100px'>
			       <DIV align="center">��</DIV>
			       </TD>
			       <TD width='100px'>
			       <DIV align="center">��</DIV>
			       </TD>
			       <TD width='100px'>
			       <DIV align="center"><font color="#529dbc">��</font></DIV>
			       </TD>
				</TR>
				</THEAD>
			<TBODY>
			<TR>
			
			

			<%
			//1���� �����
			for(int index = 1; index < start ; index++ )
			{
				out.println("<TD ><img src="+""+">"+"</TD>");
				
			 	newLine++;
			}
			
			//1�Ϻ���
			for(int index = 1; index <= endDay; index++)
			{
			       String color = "";
			 
			       if(newLine == 0){          color = "RED";
			       }else if(newLine == 6){    color = "#529dbc";
			       }else{                     color = "BLACK"; };
			 
			       String sUseDate = Integer.toString(year); 
			       sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
			       sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
			 
			       int iUseDate = Integer.parseInt(sUseDate);
			      
			      
			       String backColor = "#EFEFEF";
			       //���糯¥ǥ��
			       if(iUseDate == intToday ) {
			             backColor = "#C7D4FB";
			             
			             out.println("�ܱ� ���� ���� �Ⱓ : "+ intToday+" - " +(intToday+2));
			             out.println("�߱� ���� ���� �Ⱓ : "+ (intToday+3)+" - " +(intToday+9));
			       }
			       //���ð��ɱⰣ Ȱ��ȭ ����(�ܱ⿹��)
			       if( (iUseDate>intToday) && (iUseDate<=intToday+2)){
			    	   backColor= "#BABFCF";
			       }
			       //���ð��ɱⰣ Ȱ��ȭ ����(�߱⿹��)
			       if( (iUseDate>intToday+2) && (iUseDate<intToday+10) ){
			    	   backColor = "#c9c9c9";
			       }
			       out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
			       %>
			       <font color='<%=color%>'>
			           <%=index %>
			       </font>
			 	
			       <%
			      
			       out.println("<BR>");
			       
			       out.println("<BR>");
			      
			      
			       //��� ���� 
			       out.println("<img src="+""+">"+"</TD>");
			       newLine++;
			 
			       if(newLine == 7)
			       {
			         out.println("</TR>");
			         if(index <= endDay)
			         {
			           out.println("<TR>");
			         }
			         newLine=0;
			       }
			}
			//for����
			//������ ���� LOOP
			while(newLine > 0 && newLine < 7)
			{
			  out.println("<TD ><img src="+""+">"+"</TD>");
			  newLine++;
			}
			%>
			</TR>
 
			</TBODY>
			</TABLE>
			</DIV>
		</form>
            
   		<div class="col-md-4">
   			<div class="panel panel-default text-center">
	    		<div class="panel-body">
                        <Br><h4>�����</h4>
                        <input type="textarea" id="departure" onclick="TestTable()"><Br><hr>
                        <h4>������</h4>
                        <input type="textarea" id="arrival"><br><Br><Br>
                      	<a href="map.jsp" class="btn btn-primary">���� Ȯ�� �Ϸ�</a>	
            	</div>
            </div>     
     	</div>          
   </div>
      <hr>
      <!-- Footer -->
      <footer>
          <div class="row">
              <div class="col-lg-12">
                   <p>Copyright &copy; ���ý��ۼ���8�� ������ �ֿ��� �ּ���</p>
              </div>
          </div>
      </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    
    <script>
    	function set() {
    		document.ima = "image/donkey.png";
			
    	}
    	
    	function TestTable(originalRequest)
    	{
    	     // ���� ���� �� ���̺� ID ��
    	     var tableSearch = $('table');
    	    
    	     // rows, cells ( TR / TD ) �� length�� ����
    	     // ���̺��� tr, td ������ �����´�.
    	     var rowLen = tableSearch.rows.length;
    	     var celLen = tableSearch.cells.length;
    	     
    	     var pp = tableSearch.rows[0].cells[1].innerHTML;
    	     alert(pp);
    	    
    	}
    </script>

</body>

</html>
