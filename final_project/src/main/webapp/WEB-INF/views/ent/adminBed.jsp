<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

	<style>
	.modal-dialog {
	  max-width: 60%;
	  max-height: 85%;
	}
	.modal-dialog-slideout {
	  min-height: 85%;
	  margin: 80 0 0 auto;
	  z-index:1;
	  background: #fff;
	}
	.modal.fade .modal-dialog.modal-dialog-slideout {
	  -webkit-transform: translate(100%, 0)scale(1);
	  transform: translate(100%, 0)scale(1);
	}
	.modal.fade.show .modal-dialog.modal-dialog-slideout {
	  -webkit-transform: translate(0, 0);
	  transform: translate(0, 0);
	  display: flex;
	  align-items: stretch;
	  -webkit-box-align: stretch;
	  height: 100%;
	}
	.modal.fade.show .modal-dialog.modal-dialog-slideout .modal-body {
	  overflow-y: auto;
	  overflow-x: hidden;
	}
	.modal-dialog-slideout .modal-content {
	  border: 0;
	}
	.modal-dialog-slideout .modal-header,
	.modal-dialog-slideout .modal-footer {
	  height: 4rem;
	  display: block;
	}
	.sidebar_menu{
 		display: none;
        width: 40%;
        height: 100%;
        background: #e98282;
        position: absolute;
        top:0;
        left: -50%;
        z-index: 2;
    }
	   	.pntnm{
		font-weight: bolder; 
		font-size: 20px; 
		color: black;
		}
		.gender .age{
			color: black;
		}
		.title{
			margin-right: 50px;
			color: gray;
			width: 200px;
		}
		.titlea{
			margin-right: 50px;
			color: gray;
			width: 320px;
		}
		.nti{
			width: 60px;
		}
	
		.btnset{
			position: absolute;
			left: 41%;
		}
	    .tree{
	      color:#393939;
	      font-size: 1.4em;
	      font-weight: bold;
	    }
	    .tree, .tree ul{
	      list-style: none;
	      padding-left:20px;
	    }
 	    .tree *:before{ 
	      width:17px; 
	      height:17px; 
 	      display:inline-block; 
 	    } 
	    .tree label, li{
	      cursor: pointer;
	    }
/* 	    .tree label:before{ */
/* 	      content:'\f256'; */
/* 	      font-family: fontello; */
/* 	    } */
	    .tree a{
	      text-decoration: none;
	      color:#393939;
	    }
	    .tree a:before{
	      content:'\e800';
	      font-family: fontello;
	    }
	    .tree input[type="checkbox"] {
	      display: none;
	    }
	    .tree input[type="checkbox"]:checked~ul {
	      display: none;
	    }
	    .tree input[type="checkbox"]:checked+label:before{
	      font-family: fontello;
	    }
	    .single_quick_activity{
	    	cursor: pointer;
			z-index: 1;
			border: none;
	    }
		.single_quick_activity:after {
		  position: absolute;
		  content: "";
		  width: 0;
		  height: 100%;
		  top: 0;
		  right: 0;
		  z-index: -1;
		  background-color: #e6e6fa;
		  border-radius: 4.3%;
		  transition: all 0.3s ease;
		}
		.single_quick_activity:hover {
		  color: #fff;
		}
		.single_quick_activity:hover:after {
		  left: 0;
		  width: 100%;
		}
 		.single_quick_activity:active {
 		  top: 2px;
 		}
		#bHeader{
		  width: 100%;
		  height: 8%;
		  margin-bottom:0.7%;
		  border: 1px solid #f6f6f6;
		}
      	#BAside{
			float: left;
			width: 12.8%;
			height: 93%;
			border: 1px solid #f6f6f6;
      	}
      	#BNav{
      		float: right;
			width: 86.2%;
			height: 93%;
			background-color: #f6f6f6;
			padding: 8%;
      	}
      	.bed {
        	width: 20%;   
			margin : 0% 2% 2% 2%;
			padding:2%;
       		height : 53%;  
       		display: block; 
      	}
      	.mouseOverMenu{
      		position : relative;
      		display : inline-block;
      		margin: auto;
       		margin-top: 65px; 
       	} 
		.mouseOverMenu .tooltip{
			position: absolute;
			width: 200px;
			padding: 0;
			background-color: #D6D6D6;
			z-index: 1;
			bottom: 50%;
			left: 50%;
			margin-left: -100px;
		}
		.mouseOverMenu .tooltip::after{
			position: absolute;
			top: 100%;
			left: 50%;
			margin-left: -10px;
			border-width: 10px;
			border-color: #D6D6D6 transparent transparent transparent;
		}
		#slideMenu{
			display:none;
			position: absolute;
			z-index: 2;
			margin-left: 7%;
			margin-top: 5.4%;
			width: 30%;
			height:80%;
			background:white;
			border-radius:5%;
		}
		#mdlheader{
			margin: 0.7%;
			height: 13%;
			border-radius:10%;
			padding: 5%;
		}
		#mdlbody{
			margin: 1%;
			border : 1px solid black;
			height: 80%;
			border-radius:5%;
			padding: 5%;
		}
		#mdlbody table tr td{
			padding-left: 3%;
		}
		#mdlbody table tr td:nth-child(odd){
			font-weight:bold;
		}
	</style>
	
	<script>
	
		// ?????? ?????? ???????????? AJAX===================================================================================
		function modalBtn(p){
			var data = {"pntCd" : p.value};
			//?????? ????????????
			$.ajax({
				url:"/patients/detail",
				method: "post",
				data: data,
				success: function(res) {
					console.log(res);
					$(".pntcd").text(res.pntCd);	$(".pntnm").text(res.pntNm)	;	$(".gender").text(res.pntSex);
					$(".age").text(res.age);		$(".pno").text(res.pntPrno);	$(".tel").text(res.pntHp);
					$(".prtnm").text(res.prtcrNm);	$(".tel2").text(res.prtcrTel);	$(".addr").text(res.pntAddr);
					$(".smk").text(res.smoking);	$(".drk").text(res.drinking);	$(".preg").text(res.pregnancy);
					$(".tem").text(res.vsTmp);		$(".wei").text(res.weight);	$(".hei").text(res.height);
					$(".bp").text(res.vsBpMax+"/" + res.vsBpMin);	$(".bs").text(res.vsBs);	$(".date").text(res.vsDt);
				}
			});
			//????????????
			$.ajax({
				url:"/reservation/reservlist",
				method: "post",
				data: data,
				success: function(rres) {
					var listHtml='';
					if(rres!=''){
						for(var i in rres){
							
							listHtml +="<tr role='row'>";
							listHtml +="<td>"+rres[i].rsvtNo+"</td>;"
							listHtml +="<td>"+rres[i].pntNm+"</td>;"
							listHtml +="<td>"+rres[i].rsvtDt+"</td>;"
							listHtml +="<td>"+rres[i].treatStartTime+"</td>;"
							listHtml +="<td>"+rres[i].symptoms+"</td>;"
							listHtml +="<td>"+rres[i].mdlNm+"</td>;"
							listHtml +="</tr>";
						}
					}
					else{
						listHtml +="<tr role='row'>";
						listHtml +="<td colspan='6' style='text-align: center;'>????????? ??????????????? ????????????.</td>;"
						listHtml +="</tr>";
					}
					$(".rescon").html(listHtml);
				}
			});
			//????????? ?????????
			$.ajax({
				url:"/patients/vslist",
				method: "post",
				data: data,
				success: function(vres) {
					var listHtml='';
					if(vres!=''){
						for(var i in vres){
							listHtml +="<tr role='row'>";
							listHtml +="<td>"+vres[i].vsTmp+"</td>;"
							listHtml +="<td>"+vres[i].height+"</td>;"
							listHtml +="<td>"+vres[i].weight+"</td>;"
							listHtml +="<td>"+vres[i].vsBpMax+'/'+vres[i].vsBpMin+"</td>;"
							listHtml +="<td>"+vres[i].vsBs+"</td>;"
							listHtml +="<td>"+vres[i].vsDt+"</td>;"
							listHtml +="</tr>";
						}
					}
					else{
						listHtml +="<tr role='row'>";
						listHtml +="<td colspan='6' style='text-align: center;'>????????? ?????? ????????? ????????????.</td>;"
						listHtml +="</tr>";
					}
					//console.log(listHtml)
					$("#vtable").html(listHtml);
				}
			});
		}
		
		// ?????? ??? ????????? ????????? ???????????? AJAX===================================================================================================
		function enting(t){
			
			parentTR = $(t).parent().parent();
			
			var data = {"pntCd":t.value};
			$.ajax({
				url : "/ent/pntModal",
				method : "post", 
				data : data,
				async : false,
				success : function(rst){
					$("#exampleModalLabel2").text(rst.pntNm + " ?????? ????????????");
					$("#regist").attr('value', rst.pntCd);
					$("#oneTD").text(rst.pntCd);
					$("#twoTD").text(rst.pntHp);
					$("#thrTD").text(rst.pntPrno);
					$("#foTD").text(rst.prtcrNm);
					$("#fiTD").text(rst.chrDr);
				}
			})
		}
		
		// ???????????? ????????? ????????? ??? ?????? ????????? ????????? ???????????? Ajax===================================================================================
		function getRoom(t){
			if($("#positionSave").css("display") == "none"){
				var data = {"roomCls": t.id};
				$.ajax({
					url : "/ent/getRoom",
					method : "GET",
					data : data,
					success : function(rst){
						var b = 1;
						$("#BNav").empty();
						$.each(rst, function(i, v){
							var div = document.createElement("div");   div.setAttribute("class","bed"); div.setAttribute("id", v.bed);
							var h3 = document.createElement("h3");     h3.innerHTML = v.bed;div.appendChild(h3); h3.value = v.pntCd;
							div.style.order = v.bedOrder;
							div.value = v.bedNo;
							div.addEventListener("click", drawBorder.bind(null, div));
							div.addEventListener("click", reddrawBorder.bind(null, div));
// 							var img = document.createElement("img");
// 							img.setAttribute("src", "/resources/img/ent/entBed.png");
// 							img.style.overflow = "auto";							
// 							div.appendChild(img);
							
							if(!v.pntCd){
								div.style.backgroundColor = "#c0c0c0";
							}else{
								div.style.backgroundColor = "#ff9e81";
								var h4 = document.createElement("h4"); h4.innerHTML = v.pntNm; 
								div.appendChild(h4);
							}
							
							$("#BNav").append(div);
						})
					}
				})
			}else{
				swal('??????!', '????????? ?????????????????????./n??????????????????.','warning');
				return false;
			}
		}
		// ?????? ?????? ?????? ????????? ????????? ?????? ?????? ????????? ???????????? ??????????????? ?????? ?????? ========================================================================================================
		function positionBed(){
			var child = $("#BNav").children();
			var flag = true;
			
			for(var i = 0; i < child.length; i++){
				if($(child[i]).css("border") == "3px solid rgb(0, 0, 0)"){
					flag = false;
				}
			}
			if(flag){ // ?????? ???????????? ?????????~
				swal('??????!', '????????? ????????? ????????? ?????? ????????? ?????????.','warning');
				return false;
			}
			
			if(child.length <= 0){
				swal('??????!', '????????? ????????? ????????? ?????? ????????? ?????????.','warning');
				return false;
			}else{
				$("#positioning").css("display", "none");
				$("#positionSave").css("display", "block");
				$("#cancleBtn").css("display", "block");
			}
		}	
			
			// ?????? 1 : ?????? ????????? ?????? ?????? ???????????? ????????? ?????????.
			
		// ????????? ?????? ?????? ?????? ?????? ?????? ???????????? =====================================================================================================
		function drawBorder(t){
			if($("#positionSave").css("display") == "none"){
				var child = $("#BNav").children();
				for(var i = 0; i < child.length; i++){
					if($(child[i]).css("border") == "3px solid rgb(0, 0, 0)"){
						child[i].style.border = 0;
					}
				}
				t.style.border = "3px solid black";
			}
		}
		// ?????? ??? ?????? ??? ?????? =====================================================================================================
		function reddrawBorder(t){
			if($("#positionSave").css("display") == "block"){
				var child = $("#BNav").children();
				for(var i = 0; i < child.length; i++){
					if($(child[i]).css("border") == "3px solid rgb(255, 0, 0)"){
						child[i].style.border = 0;
					}
				}
				t.style.border = "3px solid red";
			}
		}
		function positionCancle(){
			$("#positioning").css("display", "block");
			$("#positionSave").css("display", "none");
			$("#cancleBtn").css("display", "none");
			
			var child = $("#BNav").children();
			
			for(var i = 0; i < child.length; i++){
				child[i].style.border = 0;
			}
		}
		// ?????? ?????? ?????? ?????? Ajax =================================================================================================================
		function positionSave(){
			$("#positioning").css("display", "block");
			$("#positionSave").css("display", "none");
			$("#cancleBtn").css("display", "none");
			var child = $("#BNav").children();
			var newBedOrder = "";	var newBedNo = "";
			var oldBedOrder = "";	var oldBedNo = "";
			var result = "";
			for(var i = 0; i < child.length; i++){
				var st = $(child[i]).attr("id").substr(0,2);
				if($(child[i]).css("border") == "3px solid rgb(255, 0, 0)"){
					newBedNo = $(child[i]).val();					
					newBedOrder = $(child[i]).css("order");
				}
				if($(child[i]).css("border") == "3px solid rgb(0, 0, 0)"){
					oldBedNo = $(child[i]).val();					
					oldBedOrder = $(child[i]).css("order");
				}
			}
			var data = {"bedNo":newBedNo, "bedOrder":oldBedOrder};
			var data2 = {"bedNo":oldBedNo, "bedOrder":newBedOrder};
			$.ajax({
				url : "/ent/saveRoom",
				data : data,
				async : false,
				method : "get",
				success : function(rst){
					result = rst;
				}
			})
			$.ajax({
				url : "/ent/saveRoom",
				data : data2,
				async : false,
				method : "get",
				success : function(rst){
					result += rst;
				}
			})
			
			if(result == 2){
				var clk = document.getElementById(st);
				clk.click();
			}
			
			for(var i = 0; i < child.length; i++){
				child[i].style.border = 0;
			}
			if($("#positionSave").css("display") == "block"){
				$("#positioning").css("display", "block");
				$("#positionSave").css("display", "none");
				$("#cancleBtn").css("display", "none");
			}
		}
		$(function(){
			// ????????? ????????? ???????????? ????????? ?????? ????????? ??? ??? ?????? ==================================================================================================
			$(document).on("click", ".bed",function(){
				if(!($(this).css("backgroundColor") == "rgb(192, 192, 192)")){   // ????????????? ????????? ????????? ????????? true
					if($("#positionSave").css("display") == "none"){   // ?????? ????????? ?????????????
						
						var pntCd = $(this).children("h3").val();
						var data  = {"pntCd":pntCd};
						
						$.ajax({
							url : "/ent/getEntDetail",
							data : data,
							method : "post",
							success : function(res){
								console.log(res);
								$("#entWARD").text(res.wardCls + "???");
								$("#entROOM").text(res.roomCls + "???");
								$("#entBEDNO").text(res.bed + "???");
								$("#entCD").text(res.pntCd);
								$("#entNM").text(res.pntNm);
								$("#entCHRDR").text(res.chrDr);
								$("#entPRNO").text(res.pntPrno);
								$("#entSEX").text(res.pntSex);
								$("#entHP").text(res.pntHp);
								$("#entPRTCRHP").text(res.prtcrTel);
								$("#entPRTCRNM").text(res.prtcrNm);
								$("#entSMKYN").text(res.smkYn);
								$("#entDRKYN").text(res.drkYn);
							}
						})
							
						$("#slideMenu").slideDown(400);
					}
				}
			})
			// ????????? ?????? ?????? ???????????? ???????????? ?????? ?????? ==================================================================================================
			$(document).on("mouseleave", ".bed", function(){
				if($("#positionSave").css("display") == "none"){
					$("#slideMenu").slideUp(500);
				}
			})
		})
		// ?????? ????????? ????????? ????????? ?????? ?????? ???????????? ?????? ????????? ???????????? ??? ent???????????? ???????????? ??????	==================================================================================================
		function regist(){
			var flag = false;
			var child = $("#BNav").children();
			var pntCd = $("#regist").val();
			var data = {"pntCd":pntCd};
			
			if(child.length <= 0){
				swal('??????!', '????????? ????????? ??????????????????.','warning');
				return false;
			}
			for(var i = 0; i < child.length; i++){
				if($(child[i]).css("border") == "3px solid rgb(0, 0, 0)" && $(child[i]).css("backgroundColor") == "rgb(192, 192, 192)"){
					data.bedNo = $(child[i]).val();
					console.log(data);
					var st = $(child[i]).attr("id").substr(0,2);
					flag = true;
					$.ajax({
						url : '/ent/updateEnt',
						method : 'post',
						data : data,
						success : function(rst){
							console.log(rst);
							if(rst > 0){
								swal('??????', '????????? ?????? ???????????????.','success');
							}
							var clk = document.getElementById(st);
							clk.click();
							
							console.log("??????????????? tr" + parentTR);
							$(parentTR).hide();
						}
					})
				}
			}
			if(!flag){
				swal('??????!', '?????? ?????? ??? ?????????.','warning');
				return false;
			}
		}
	</script>

<!-- ?????? ???????????? -->
<div class="col-lg-12">
<div class="single_element">
	<div class="quick_activity">
		<div class="row">
			<div class="col-12">
				<div class="quick_activity_wrap">
					<div id="entWd" class="single_quick_activity d-flex">
						<div class="icon">
							<img src="/resources/img/icon/wheel.svg" alt="">
						</div>
						<div class="count_content">
							<h3>
								<span class="counter">${entVO.size()}</span>
							</h3>
							<p>?????? ???</p>
						</div>
					</div>
					<div id="notEntWd" class="single_quick_activity d-flex">
						<div class="icon">
							<img src="/resources/img/icon/wheel.svg" alt="">
						</div>
						<div class="count_content">
							<h3>
								<span class="counter">${waitPnt.size()}</span>
							</h3>
							<p>?????? ??????</p>
						</div>
					</div>
					<div id="Wdteam" class="single_quick_activity d-flex">
						<div class="icon">
							<img src="/resources/img/icon/pharma.svg" alt="">
						</div>
						<div class="count_content">
							<h3>
								<span class="counter">10</span>
							</h3>
							<p>??????????????????</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<div class="main_content_iner ">
	<div class="container-fluid p-0">
	<div class="row justify-content-center">
		<div class="col-12">
		<div class="QA_section">
			<div class="white_box_tittle list_header">
				<h4 id="txtTitle">?????? ?????? ?????? ??????</h4>
					<div class="box_right d-flex lms_block">
					<div class="serach_field_2">
					<div class="search_inner">
				<form action="#">
				<div class="search_field">
				<input type="text" placeholder="Search content here...">
				</div>
				<button type="submit"> <i class="ti-search"></i> </button>
				</form>
				</div>
				</div>
				<div class="add_button ml-10">
				<a href="#" data-toggle="modal" data-target="#addcategory" class="btn_1">??????</a>
				</div>
				</div>
				</div>
				<div class="QA_table mb_30">
				
				<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
				<table class="table lms_table_active dataTable no-footer dtr-inline" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 1586px; text-align: center;">
				<thead>
				<tr role="row">
					<th id="th1" scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 143px;" aria-sort="ascending" aria-label="title: activate to sort column descending">
						??????</th>
					<th id="th2" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 219px;" aria-label="Category: activate to sort column ascending">
						????????????</th>
					<th id="th3" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 110px;" aria-label="Teacher: activate to sort column ascending">
						??????</th>
					<th id="th4" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 120px;" aria-label="Lesson: activate to sort column ascending">
						?????????</th>
					<th id="th5" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 120px;" aria-label="Enrolled: activate to sort column ascending">
						?????????</th>
					<th id="th6" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 140px;" aria-label="Price: activate to sort column ascending">
						????????? ?????????</th>
					<th id="th7" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 200px;" aria-label="Status: activate to sort column ascending">
						</th>
				</tr>
				</thead>
				<tbody id="tbdy">
					<c:forEach var="waitPnt" items="${waitPnt}" varStatus="status">
						<tr role="row" id="${status.count}">
							<th scope="row" class="sorting_1" style="color:black; font-size:1.1em; font-weight:bold;">${waitPnt.pntNm}</th>
							<td>${waitPnt.pntHp}</td>
							<td <c:if test="${waitPnt.pntSex eq 'M'}">style="color:blue;"</c:if><c:if test="${waitPnt.pntSex eq 'F'}">style="color:red;"</c:if>>${waitPnt.pntSex}</td>
							<td>${waitPnt.chrDr}</td>
							<td>${waitPnt.prtcrNm}</td>
							<td>${waitPnt.prtcrTel}</td>
							<td> 
								<button type="button" id="modalBtn" class="btn btn-outline-secondary" value="${waitPnt.pntCd}" data-toggle="modal" data-target="#myModal" onclick="modalBtn(this)">????????????</button>
					   			<button type="button" id="modalBtn2" class="btn btn-outline-success" value="${waitPnt.pntCd}" data-toggle="modal" data-target="#myModal2" onclick="enting(this)">????????????</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			  </div>
			</div>
		</div>
		</div>
	</div>
	</div>
</div>

<!-- ???????????? ?????? modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-slideout" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div style="float: left;"><h5 class="modal-title align-right" id="exampleModalLabel" style="font-weight: bolder; font-size: 20px;">?????? ?????? ??????</h5></div>
		<a class="btn btn-outline-danger" style="float: right;" href="#">??????</a>
      </div>
      <div class="modal-body">
        <div class="alert alert-warning" role="alert">
	        <table >
	        	<tr>
	        		<td class="title">no.&nbsp;<span class="pntcd title"></span></td>
	        	</tr>
	        </table>	
        	<span class="pntnm"></span>&nbsp;
        	(<span class="gender"></span>) &nbsp;&nbsp;??? <span class="age"></span>???
        	<br><br>
        	<table class="tab">
        		<tr>
        			<td class="title">??????????????????</td>
        			<td class="title">???????????????</td>
        			<td class="title">???????????????</td>
        			<td class="title">??????????????????</td>
        			<td class="titlea">??????</td>
        		</tr>
        		<tr>
        			<td class="pno" valign="top"></td>
        			<td class="tel"  valign="top"></td>
        			<td class="prtnm"  valign="top"></td>
        			<td class="tel2"  valign="top"></td>
        			<td class="addr" valign="top"></td>
        		</tr>
        	</table>
        </div>
        <div class="alert alert-primary" role="alert">
			<h6 style="font-weight: bold;">?????? ??????</h6>
			<br>
			<table>
				<tr>
					<td class="title">????????????</td>
					<td class="title">????????????</td>
					<td class="title">????????????</td>
				</tr>
				<tr>
					<td class="smk"></td>
					<td class="drk"></td>
					<td class="preg"></td>
				</tr>
				</table>
				<br>
				<table>
				<tr>
					<td class="title">??????</td>
					<td class="title">??????</td>
					<td class="title">??????</td>
					<td class="title">??????</td>
					<td class="title">??????</td>
					<td class="title">????????????</td>
				</tr>
				<tbody id="vtable">
					
				</tbody>
				<!-- <tr>
					<td class="tem"></td>
					<td class="wei"></td>
					<td class="hei"></td>
					<td class="bp"></td>
					<td class="bs"></td>
					<td class="date"></td>
				</tr> -->
			</table>
			<!-- ????????? -->
			
			<!-- ????????? -->
		</div>
		<div class="alert alert-success" role="alert">
			<h6 style="font-weight: bold;">?????? ??????</h6>
			<br>
			<!-- ???????????? ?????? -->
				<table  class="table dataTable no-footer dtr-inline table-hover" id="DataTables_Table_0" role="grid" style="width: 600px; text-align: center;">
					<thead style="background: #ffffe3;">
						<tr role="row">
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">????????????</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">?????????</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">????????????</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">????????????</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 110px;">??????</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">????????????</th>
						</tr>
					</thead>
					<tbody class="rescon">

					</tbody>
				</table>
			<!-- ???????????? ??? -->
		</div>
		<div class="btnset">
			<a class="btn btn-outline-secondary" href="#">?????? ??????</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="btn btn-outline-primary" href="#">?????? ??????</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="btn btn-outline-success" href="/ent/main" >?????? ??????</a>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right;">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal ???????????? -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
<div id="slideMenu">
	<div id="mdlheader">
		??????<h4 id="entWARD"></h4>
		<span id="entROOM" style="font-size:1.2em; font-weight:bold;"></span>
		<span id="entBEDNO" style="font-size:1.2em; font-weight:bold;"></span>
	</div>
	<hr>
	<div id="mdlbody">
		<table style="width: 100%; height:80%;" border="1">
		  <tr>
		    <td>?????????</td>
		    <td id="entNM"></td>
		  </tr>
		  <tr>
		    <td>????????????</td>
		    <td id="entCD"></td>
		  </tr>
		  <tr>
		    <td>?????????</td>
		    <td id="entCHRDR"></td>
		  </tr>
		  <tr>
		    <td>??????????????????</td>
		    <td id="entPRNO"></td>
		  </tr>
		  <tr>
		    <td>??????</td>
		    <td id="entSEX"></td>
		  </tr>
		  <tr>
		    <td>?????????</td>
		    <td id="entHP"></td>
		  </tr>
		  <tr>
		    <td>????????????</td>
		    <td id="entPRTCRNM"></td>
		  </tr>
		  <tr>
		    <td>????????? ?????????</td>
		    <td id="entPRTCRHP"></td>
		  </tr>
		  <tr>
		    <td>????????????</td>
		    <td id="entSMKYN"></td>
		  </tr>
		  <tr>
		    <td>????????????</td>
		    <td id="entDRKYN"></td>
		  </tr>
		</table>
	</div>
</div>
  <div class="modal-dialog modal-dialog-slideout" role="document">
  
  <!-- ?????? ?????? ???????????? ?????? ~~!~!~!~!~!~!~!~!~!~!~!~!~! -->
    <div class="modal-content">
      <div class="modal-header">
        <div style="float: left;"><h5 class="modal-title align-right" id="exampleModalLabel2" style="font-weight: bolder; font-size: 20px;">?????? ??????</h5></div>
            <button type="button" id="regist" class="btn btn-success" style="float: right; margin-left:1.3%" onclick="regist()">??????</button>
      		<button type="button" class="btn btn-outline-success" style="float: right;">???????????????</button>
        </div>
      <div class="modal-body" style="background-color:#d9d9d9;">
      	<div id="BHeader">
      		<table style="width:100%; height:100%; text-align:center;">
      			<tr style="font-size:0.75em;">
      				<td style="height:30%;">????????????</td>
      				<td>?????????</td>
      				<td>??????????????????</td>
      				<td>????????????</td>
      				<td>?????????</td>
      			</tr>
      			<tr>
      				<td style="width:20%;" id="oneTD"></td>
      				<td style="width:20%;" id="twoTD"></td>
      				<td style="width:20%;" id="thrTD"></td>
      				<td style="width:20%;" id="foTD"></td>
      				<td style="width:20%;" id="fiTD"></td>
      			</tr>
      		</table>
      	</div>
      	<div id="BAside">
					  <ul class="tree">
					    <li>
					      <input type="checkbox" id="root">
					      <label for="root">????????????</label>
					      <ul>
					      <c:forEach var="wardVO" items="${wardVOList}">
					        <li>
					          <input type="checkbox" id="node${wardVO.wardCls}">
					          <label for="node${wardVO.wardCls}">${wardVO.wardCls}&nbsp;???</label>
					          <ul>
					          	<c:forEach var="roomVO" items="${wardVO.roomVO}">
					          		<li id="${roomVO.roomCls}" onclick="getRoom(this)">${roomVO.roomCls}&nbsp;???</li>
					          	</c:forEach>
					          </ul>
					        </li>
					        </c:forEach>
					      </ul>
					    </li>
					  </ul>
      	</div>
      	<div id="BNav" style="display: flex; flex-wrap: wrap;">
      	</div>
	  </div>
      <div class="modal-footer">
        <button type="button" id="positioning" class="btn btn-success" style="float: left;" onclick="positionBed()">?????? ??????</button>
	    <button type="button" id="positionSave" class="btn btn-success" style="float: left; display:none;" onclick="positionSave()">?????? ??????</button>
	    <button type="button" id="cancleBtn" class="btn btn-danger" style="float: left; display:none;" onclick="positionCancle()">??????</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" style="float: right;">??????</button>
      </div>
    </div>
  </div>
</div>
