<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false"%>
<%--<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--<c:set var="ctx" value="http://localhost:8080/chess"/>--%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="resources/Css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="resources/Css/bootstrap-responsive.css"/>
    <link rel="stylesheet" type="text/css" href="resources/Css/style.css"/>
    <script type="text/javascript" src="resources/Js/jquery.js"></script>
    <script type="text/javascript" src="resources/Js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="resources/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="resources/Js/bootstrap.js"></script>
    <script type="text/javascript" src="resources/Js/ckform.js"></script>
    <script type="text/javascript" src="resources/Js/common.js"></script>


    <style type="text/css">
        body {
            padding-bottom: 40px;
        }

        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }

        .w10 {
            width: 600px;
        }

        .ccell {
            width: 55px;
            height: 55px;
        }

        .boardDivCls {
            border: solid red 1px;
        }

        .cmdDiv {
            width: 600px;
            padding-left: 5px;
            /*border: solid red 1px;*/
        }

        .alignCenter {
            margin: 0 auto;
        }


    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            makeDroppable();
            $('#startBtn').on("click.startBtn", startWait);
            $('#restartBtn').on("click.restartBtn", restartCompetition);
            $("#chessBoardDiv").on("mouseover", readyDrag);
            $("#chessBoardDiv").on("click", readyDrag);
        });

        function restartCompetition(){
            var ll = Math.floor((Math.random() * 1000) + 1);
            var boardHtml = $.ajax({
                url: "restartGame?t=" + ll,
                async: false
            }).responseText;
            $("#chessBoardDiv").html(boardHtml);
            makeDroppable();
        }

        function readyDrag(e){
            var id = e.target.id;
            var curChess = $("#"+id);
            var blankFlag = curChess.attr("src").indexOf("CHESS_BLANK")>-1;

            if (id.indexOf("chess_") > -1) {
                if(blankFlag) {
//                    var tt = id.split("_");
                }else{
//                    curChess.draggable();
                    curChess.draggable({
                        revert:"invalid",
                        snap:".ccell",
                        snapMode:"inner",
                        drag:dragHandler
                    });
                }
            }
        }

        function dragHandler(e,ui){
            var id = e.target.id;
            var parent=$(e.target).parent();

//            alert(ui.helper.hasClass("ccell"));
           // var curChess = $("#"+id);
            if (parent.hasClass("ccell")) {
//                 parent.droppable();
                //parent.html("ddfd");
                //alert("dfdffd");
             }
        }

        function bindClick(e) {
            var id = e.target.id;
            var curChess = $("#"+id);
            var blandFlag = curChess.attr("src").indexOf("CHESS_BLANK")>-1;

            if (id.indexOf("chess_") > -1) {
                if(blandFlag) {
                    var tt = id.split("_");
                    turnOver(tt[2], tt[3]);
                }else{
//                    curChess.draggable();
                    curChess.draggable({
                        revert:"invalid",
                        snap:".ccell",
                        snapMode:"inner",
                        drag:dragHandler
                    });
                }
            }
        }



        var i = 0;
        var timmer;
        function startWait() {
            timmer = setInterval(checkPlayer, 1000);
        }

        function checkPlayer() {

            var ll = Math.floor((Math.random() * 1000) + 1);
            var playerCnt = $.ajax({
                url: "checkPlayer.do?t=" + ll,
                async: false
            }).responseText;

            var btnStart = $('#startBtn');
            if (playerCnt < 2) {
                btnStart.attr("disabled", true);
                btnStart.text("开始" + "(" + i + ")");
                btnStart.css("cursor", "not-allowed");
            } else{
                clearInterval(timmer);
                $("#chessBoardDiv").on("click", bindClick);
                timmer = setInterval(refreshBoard, 1000);
            }
            i++;
        }

        function refreshBoard(){
            var ll = Math.floor((Math.random() * 1000) + 1);
            var boardHtml = $.ajax({
                url: "refresh.do?t=" + ll,
                async: false
            }).responseText;
            $("#chessBoardDiv").html(boardHtml);
            makeDroppable();
        }

        function turnOver(x, y) {
            var ll = Math.floor((Math.random() * 1000) + 1);
            var boardHtml = $.ajax({
                url: "turnOver/" + x + "/" + y + "?t=" + ll,
                async: false
            }).responseText;
            $("#chessBoardDiv").html(boardHtml);
            makeDroppable();
        }

        function onDropDrop(e,ui){
            var curObj = $(this);
            var dragObjId = ui.helper.attr("id")
            var dropObjId = curObj.attr("id");
            moveChess(dragObjId,dropObjId);
            curObj.html(dropObjId);
        }

        function moveChess(from,to){
            var ll = Math.floor((Math.random() * 1000) + 1);
            var boardHtml = $.ajax({
                url: "moveChess/" + from + "/" + to + "?t=" + ll,
                async: false
            }).responseText;
            $("#chessBoardDiv").html(boardHtml);
            makeDroppable();
        }

        function makeDroppable(){
            $(".ccell").droppable({
                tolerance:"fit",
                drop:onDropDrop
            });
        }

    </script>
</head>
<body>
<form class="form-inline definewidth m20" action="index.html" method="get">

</form>
<div id="chessBoardDiv" align="center" class="w10 alignCenter">
    <!--<table class="table table-bordered table-hover definewidth m10">-->

        <!--tr*4>td*8>div.ccell>img-->
    <table class="table table-bordered definewidth w10">
        <tr>
            <td><div class="ccell" id="div_up_3_0">${chess_up_3_0}</div></td>
            <td><div class="ccell" id="div_up_3_1">${chess_up_3_1}</div></td>
            <td><div class="ccell" id="div_up_3_2">${chess_up_3_2}</div></td>
            <td><div class="ccell" id="div_up_3_3">${chess_up_3_3}</div></td>
            <td><div class="ccell" id="div_up_3_4">${chess_up_3_4}</div></td>
            <td><div class="ccell" id="div_up_3_5">${chess_up_3_5}</div></td>
            <td><div class="ccell" id="div_up_3_6">${chess_up_3_6}</div></td>
            <td><div class="ccell" id="div_up_3_7">${chess_up_3_7}</div></td>
        </tr>
        <tr>
            <td><div class="ccell" id="div_up_2_0">${chess_up_2_0}</div></td>
            <td><div class="ccell" id="div_up_2_1">${chess_up_2_1}</div></td>
            <td><div class="ccell" id="div_up_2_2">${chess_up_2_2}</div></td>
            <td><div class="ccell" id="div_up_2_3">${chess_up_2_3}</div></td>
            <td><div class="ccell" id="div_up_2_4">${chess_up_2_4}</div></td>
            <td><div class="ccell" id="div_up_2_5">${chess_up_2_5}</div></td>
            <td><div class="ccell" id="div_up_2_6">${chess_up_2_6}</div></td>
            <td><div class="ccell" id="div_up_2_7">${chess_up_2_7}</div></td>
        </tr>
        <tr>
            <td><div class="ccell" id="div_up_1_0">${chess_up_1_0}</div></td>
            <td><div class="ccell" id="div_up_1_1">${chess_up_1_1}</div></td>
            <td><div class="ccell" id="div_up_1_2">${chess_up_1_2}</div></td>
            <td><div class="ccell" id="div_up_1_3">${chess_up_1_3}</div></td>
            <td><div class="ccell" id="div_up_1_4">${chess_up_1_4}</div></td>
            <td><div class="ccell" id="div_up_1_5">${chess_up_1_5}</div></td>
            <td><div class="ccell" id="div_up_1_6">${chess_up_1_6}</div></td>
            <td><div class="ccell" id="div_up_1_7">${chess_up_1_7}</div></td>
        </tr>
        <tr>
            <td><div class="ccell" id="div_up_0_0">${chess_up_0_0}</div></td>
            <td><div class="ccell" id="div_up_0_1">${chess_up_0_1}</div></td>
            <td><div class="ccell" id="div_up_0_2">${chess_up_0_2}</div></td>
            <td><div class="ccell" id="div_up_0_3">${chess_up_0_3}</div></td>
            <td><div class="ccell" id="div_up_0_4">${chess_up_0_4}</div></td>
            <td><div class="ccell" id="div_up_0_5">${chess_up_0_5}</div></td>
            <td><div class="ccell" id="div_up_0_6">${chess_up_0_6}</div></td>
            <td><div class="ccell" id="div_up_0_7">${chess_up_0_7}</div></td>
        </tr>
        <tr>
            <td colspan="8" height="50"></td>
        </tr>
        <tr>
            <td><div class="ccell" id="div_down_3_0">${chess_down_3_0}</div></td>
            <td><div class="ccell" id="div_down_3_1">${chess_down_3_1}</div></td>
            <td><div class="ccell" id="div_down_3_2">${chess_down_3_2}</div></td>
            <td><div class="ccell" id="div_down_3_3">${chess_down_3_3}</div></td>
            <td><div class="ccell" id="div_down_3_4">${chess_down_3_4}</div></td>
            <td><div class="ccell" id="div_down_3_5">${chess_down_3_5}</div></td>
            <td><div class="ccell" id="div_down_3_6">${chess_down_3_6}</div></td>
            <td><div class="ccell" id="div_down_3_7">${chess_down_3_7}</div></td>
        </tr>
        <tr>
            <td><div class="ccell" id="div_down_2_0">${chess_down_2_0}</div></td>
            <td><div class="ccell" id="div_down_2_1">${chess_down_2_1}</div></td>
            <td><div class="ccell" id="div_down_2_2">${chess_down_2_2}</div></td>
            <td><div class="ccell" id="div_down_2_3">${chess_down_2_3}</div></td>
            <td><div class="ccell" id="div_down_2_4">${chess_down_2_4}</div></td>
            <td><div class="ccell" id="div_down_2_5">${chess_down_2_5}</div></td>
            <td><div class="ccell" id="div_down_2_6">${chess_down_2_6}</div></td>
            <td><div class="ccell" id="div_down_2_7">${chess_down_2_7}</div></td>
        </tr>
        <tr>
            <td><div class="ccell" id="div_down_1_0">${chess_down_1_0}</div></td>
            <td><div class="ccell" id="div_down_1_1">${chess_down_1_1}</div></td>
            <td><div class="ccell" id="div_down_1_2">${chess_down_1_2}</div></td>
            <td><div class="ccell" id="div_down_1_3">${chess_down_1_3}</div></td>
            <td><div class="ccell" id="div_down_1_4">${chess_down_1_4}</div></td>
            <td><div class="ccell" id="div_down_1_5">${chess_down_1_5}</div></td>
            <td><div class="ccell" id="div_down_1_6">${chess_down_1_6}</div></td>
            <td><div class="ccell" id="div_down_1_7">${chess_down_1_7}</div></td>
        </tr>
        <tr>
            <td><div class="ccell" id="div_down_0_0">${chess_down_0_0}</div></td>
            <td><div class="ccell" id="div_down_0_1">${chess_down_0_1}</div></td>
            <td><div class="ccell" id="div_down_0_2">${chess_down_0_2}</div></td>
            <td><div class="ccell" id="div_down_0_3">${chess_down_0_3}</div></td>
            <td><div class="ccell" id="div_down_0_4">${chess_down_0_4}</div></td>
            <td><div class="ccell" id="div_down_0_5">${chess_down_0_5}</div></td>
            <td><div class="ccell" id="div_down_0_6">${chess_down_0_6}</div></td>
            <td><div class="ccell" id="div_down_0_7">${chess_down_0_7}</div></td>
        </tr>

    </table>
</div>
<br>

<div class="cmdDiv alignCenter" align="left">
    <button id="startBtn" type="submit" class="btn btn-primary">开始</button>
    <button id="restartBtn" type="submit" class="btn btn-primary">重来</button>
</div>
</body>
</html>