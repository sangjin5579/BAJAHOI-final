<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="css/styledh.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<style>
#tekbeCompnayList, #invoiceNumberText {
    border: 1px solid #E6E6E6;
    background: white;
    font-weight: bold;
    font-size: 13px;
    height: 2rem;
    width: 17rem;
}

#tekbeCompnayName, #invoiceNumber{
  color:black; 
  font-weight: bold; 
  margin-right: 20px;
  font-size: 18px;
}

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}

</style>
<script  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  
<script>

window.addEventListener("load", function () {
	

});

$(document).ready(function(){
	var myKey = "djuNVfIulkkmHGIbIjxpnQ"; // sweet tracker���� �߱޹��� �ڽ��� Ű �ִ´�.
	
		// �ù�� ��� ��ȸ company-api
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
            success:function(data){
            		
            		// ��� 1. JSON.parse �̿��ϱ�
            		var parseData = JSON.parse(JSON.stringify(data));
             		console.log(parseData.Company); // ���� Json Array�� �����ϱ� ���� Array�� Company �Է�
            		
            		// ��� 2. Json���� ������ �����Ϳ� Array�� �ٷ� �����ϱ�
            		var CompanyArray = data.Company; // Json Array�� �����ϱ� ���� Array�� Company �Է�
            		console.log(CompanyArray); 
            		
            		var myData="";
            		$.each(CompanyArray,function(key,value) {
	            			myData += ('<option value='+value.Code+'>' +''+value.Name + '</option>');        				
            		});
            		$("#tekbeCompnayList").html(myData);
            }
        });

		// ��������� ������� tracking-api
        $("#myButton1").click(function() {
        	var t_code = $('#tekbeCompnayList option:selected').attr('value');
        	var t_invoice = $('#invoiceNumberText').val();
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                	console.log(data);
                	var myInvoiceData = "";
                	if(data.status == false){
                		myInvoiceData += ('<p>'+data.msg+'<p>');
                	}else{
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"�����»��"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.senderName+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"��ǰ����"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.itemName+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"�����ȣ"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.invoiceNo+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"�����ȣ"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.receiverAddr+'</td>');     				
	            		myInvoiceData += ('</tr>');           	                		
                	}
        			
                	
                	$("#myPtag").html(myInvoiceData)
                	
                	var trackingDetails = data.trackingDetails;
                	
                	
            		var myTracking="";
            		var header ="";
            		header += ('<tr>');            	
            		header += ('<th>'+"�ð�"+'</th>');
            		header += ('<th>'+"���"+'</th>');
            		header += ('<th>'+"����"+'</th>');
            		header += ('<th>'+"��ȭ��ȣ"+'</th>');     				
        			header += ('</tr>');     
            		
            		$.each(trackingDetails,function(key,value) {
	            		myTracking += ('<tr>');            	
            			myTracking += ('<td>'+value.timeString+'</td>');
            			myTracking += ('<td>'+value.where+'</td>');
            			myTracking += ('<td>'+value.kind+'</td>');
            			myTracking += ('<td>'+value.telno+'</td>');     				
	            		myTracking += ('</tr>');        			            	
            		});
            		
            		$("#myPtag2").html(header+myTracking);
                	
                }
            });
        });
		
});


</script>
<body>
<div style="text-align:center;">
<span id="tekbeCompnayName">�ù�ȸ���: </span>
<select id="tekbeCompnayList" name="tekbeCompnayList"></select><br/><br/>

<span id="invoiceNumber">������ȣ: </span>
<input type="text" id="invoiceNumberText" name="invoiceNumberText"><br/><br/>
<button id="myButton1" class="btn margin-top-space font-m-size" style="width:8rem !important;">�ù� ��ȸ�ϱ� </button>
<button id="myButton2" class="btn margin-top-space font-m-size" style="width:3rem !important;">�ݱ� </button>
</div>
<br/>
<br/>
<div>
	<table id="myPtag"></table>
</div>
<br/>
<div>
	<table id="myPtag2"></table>
</div>
</body>
</html>