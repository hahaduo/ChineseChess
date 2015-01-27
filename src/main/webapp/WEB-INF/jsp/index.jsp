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

            alert(ui.helper.html());
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

        $(document).ready(function () {
//            $("#DOWN_3_0").draggable();
//            $("#chess_down_3_0").draggable({revert:"invalid"});
            $(".ccell").droppable();
            $('#startBtn').on("click.startBtn", startWait);
            $("#chessBoardDiv").on("click", bindClick);
            $("#chessBoardDiv").on("mouseover", readyDrag);
        });

        var i = 0;
        var ttt;
        function startWait() {
            ttt = setInterval(checkPlayer, 1000);
        }

        function checkPlayer() {

            var ll = Math.floor((Math.random() * 1000) + 1);
            var playerCnt = $.ajax({
                url: "checkPlayer.do?t=" + ll,
                async: false
            }).responseText;

            var btnStart = $('#startBtn');
//            alert(playerCnt);
            if (playerCnt < 2) {
                btnStart.attr("disabled", true);
                btnStart.text("开始" + "(" + i + ")");
                btnStart.css("cursor", "not-allowed");
            } else{
                clearInterval(ttt);
                $("#chessBoardDiv").on("mouseup", bindClick);
            }
            i++;
        }

        function turnOver(x, y) {
            var ll = Math.floor((Math.random() * 1000) + 1);
            var boardHtml = $.ajax({
                url: "turnOver/" + x + "/" + y + "?t=" + ll,
                async: false
            }).responseText;
            $("#chessBoardDiv").html(boardHtml);
            $(".ccell").droppable();
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
                <td><div class="ccell" id="UP_3_0">${chess_up_30}</div></td>
                <td><div class="ccell" id="UP_3_1">${chess_up_31}</div></td>
                <td><div class="ccell" id="UP_3_2">${chess_up_32}</div></td>
                <td><div class="ccell" id="UP_3_3">${chess_up_33}</div></td>
                <td><div class="ccell" id="UP_3_4">${chess_up_34}</div></td>
                <td><div class="ccell" id="UP_3_5">${chess_up_35}</div></td>
                <td><div class="ccell" id="UP_3_6">${chess_up_36}</div></td>
                <td><div class="ccell" id="UP_3_7">${chess_up_37}</div></td>
            </tr>
            <tr>
                <td><div class="ccell" id="UP_2_0">${chess_up_20}</div></td>
                <td><div class="ccell" id="UP_2_1">${chess_up_21}</div></td>
                <td><div class="ccell" id="UP_2_2">${chess_up_22}</div></td>
                <td><div class="ccell" id="UP_2_3">${chess_up_23}</div></td>
                <td><div class="ccell" id="UP_2_4">${chess_up_24}</div></td>
                <td><div class="ccell" id="UP_2_5">${chess_up_25}</div></td>
                <td><div class="ccell" id="UP_2_6">${chess_up_26}</div></td>
                <td><div class="ccell" id="UP_2_7">${chess_up_27}</div></td>
            </tr>
            <tr>
                <td><div class="ccell" id="UP_1_0">${chess_up_10}</div></td>
                <td><div class="ccell" id="UP_1_1">${chess_up_11}</div></td>
                <td><div class="ccell" id="UP_1_2">${chess_up_12}</div></td>
                <td><div class="ccell" id="UP_1_3">${chess_up_13}</div></td>
                <td><div class="ccell" id="UP_1_4">${chess_up_14}</div></td>
                <td><div class="ccell" id="UP_1_5">${chess_up_15}</div></td>
                <td><div class="ccell" id="UP_1_6">${chess_up_16}</div></td>
                <td><div class="ccell" id="UP_1_7">${chess_up_17}</div></td>
            </tr>
            <tr>
                <td><div class="ccell" id="UP_0_0">${chess_up_00}</div></td>
                <td><div class="ccell" id="UP_0_1">${chess_up_01}</div></td>
                <td><div class="ccell" id="UP_0_2">${chess_up_02}</div></td>
                <td><div class="ccell" id="UP_0_3">${chess_up_03}</div></td>
                <td><div class="ccell" id="UP_0_4">${chess_up_04}</div></td>
                <td><div class="ccell" id="UP_0_5">${chess_up_05}</div></td>
                <td><div class="ccell" id="UP_0_6">${chess_up_06}</div></td>
                <td><div class="ccell" id="UP_0_7">${chess_up_07}</div></td>
            </tr>
            <tr>
                <td colspan="8" height="50"></td>
            </tr>
            <tr>
                <td><div class="ccell" id="DOWN_3_0">${chess_down_30}</div></td>
                <td><div class="ccell" id="DOWN_3_1">${chess_down_31}</div></td>
                <td><div class="ccell" id="DOWN_3_2">${chess_down_32}</div></td>
                <td><div class="ccell" id="DOWN_3_3">${chess_down_33}</div></td>
                <td><div class="ccell" id="DOWN_3_4">${chess_down_34}</div></td>
                <td><div class="ccell" id="DOWN_3_5">${chess_down_35}</div></td>
                <td><div class="ccell" id="DOWN_3_6">${chess_down_36}</div></td>
                <td><div class="ccell" id="DOWN_3_7">${chess_down_37}</div></td>
            </tr>
            <tr>
                <td><div class="ccell" id="DOWN_2_0">${chess_down_20}</div></td>
                <td><div class="ccell" id="DOWN_2_1">${chess_down_21}</div></td>
                <td><div class="ccell" id="DOWN_2_2">${chess_down_22}</div></td>
                <td><div class="ccell" id="DOWN_2_3">${chess_down_23}</div></td>
                <td><div class="ccell" id="DOWN_2_4">${chess_down_24}</div></td>
                <td><div class="ccell" id="DOWN_2_5">${chess_down_25}</div></td>
                <td><div class="ccell" id="DOWN_2_6">${chess_down_26}</div></td>
                <td><div class="ccell" id="DOWN_2_7">${chess_down_27}</div></td>
            </tr>
            <tr>
                <td><div class="ccell" id="DOWN_1_0">${chess_down_10}</div></td>
                <td><div class="ccell" id="DOWN_1_1">${chess_down_11}</div></td>
                <td><div class="ccell" id="DOWN_1_2">${chess_down_12}</div></td>
                <td><div class="ccell" id="DOWN_1_3">${chess_down_13}</div></td>
                <td><div class="ccell" id="DOWN_1_4">${chess_down_14}</div></td>
                <td><div class="ccell" id="DOWN_1_5">${chess_down_15}</div></td>
                <td><div class="ccell" id="DOWN_1_6">${chess_down_16}</div></td>
                <td><div class="ccell" id="DOWN_1_7">${chess_down_17}</div></td>
            </tr>
            <tr>
                <td><div class="ccell" id="DOWN_0_0">${chess_down_00}</div></td>
                <td><div class="ccell" id="DOWN_0_1">${chess_down_01}</div></td>
                <td><div class="ccell" id="DOWN_0_2">${chess_down_02}</div></td>
                <td><div class="ccell" id="DOWN_0_3">${chess_down_03}</div></td>
                <td><div class="ccell" id="DOWN_0_4">${chess_down_04}</div></td>
                <td><div class="ccell" id="DOWN_0_5">${chess_down_05}</div></td>
                <td><div class="ccell" id="DOWN_0_6">${chess_down_06}</div></td>
                <td><div class="ccell" id="DOWN_0_7">${chess_down_07}</div></td>
            </tr>

        </table>
</div>
<br>

<div class="cmdDiv alignCenter" align="left">
    <button id="startBtn" type="submit" class="btn btn-primary">开始</button>
</div>
</body>
</html>