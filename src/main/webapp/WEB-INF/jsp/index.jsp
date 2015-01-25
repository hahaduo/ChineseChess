<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
            width: 50px;
            height: 50px;
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
        function bindClick(e) {
            var id = e.target.id;

            if (id.indexOf("chess_") > -1) {
                var tt = id.split("_");
                turnOver(tt[2], tt[3]);
            }
        }

        $(document).ready(function () {
            $("#DOWN_3_0").draggable();
            $("#UP_0_0").droppable({
                drop: function () {
                    alert("test");
                }
            });
            $("#chessBoardDiv").on("click", bindClick);
            $('#startBtn').on("click.startBtn", startWait);
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
        }


    </script>
</head>
<body>
<form class="form-inline definewidth m20" action="index.html" method="get">

</form>
<div id="chessBoardDiv" align="center" class="w10 alignCenter">
    <!--<table class="table table-bordered table-hover definewidth m10">-->
    <table class="table table-bordered definewidth w10">


        <!--tr*4>td*8>div.ccell>img-->
        <tr>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="ccell" id="UP_0_0"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell"></div>
            </td>
            <td>
                <div class="ccell">

                </div>
            </td>
        </tr>
        <tr>
            <td colspan="8" height="50"></td>
        </tr>
        <tr>
            <td>
                <div class="ccell" id="DOWN_3_0"><img id="chess_down_3_0" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_3_1"><img id="chess_down_3_1" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_3_2"><img id="chess_down_3_2" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_3_3"><img id="chess_down_3_3" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_3_4"><img id="chess_down_3_4" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_3_5"><img id="chess_down_3_5" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_3_6"><img id="chess_down_3_6" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_3_7"><img id="chess_down_3_7" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="ccell" id="DOWN_2_0"><img id="chess_down_2_0" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_2_1"><img id="chess_down_2_1" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_2_2"><img id="chess_down_2_2" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_2_3"><img id="chess_down_2_3" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_2_4"><img id="chess_down_2_4" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_2_5"><img id="chess_down_2_5" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_2_6"><img id="chess_down_2_6" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_2_7"><img id="chess_down_2_7" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="ccell" id="DOWN_1_0"><img id="chess_down_1_0" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_1_1"><img id="chess_down_1_1" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_1_2"><img id="chess_down_1_2" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_1_3"><img id="chess_down_1_3" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_1_4"><img id="chess_down_1_4" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_1_5"><img id="chess_down_1_5" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_1_6"><img id="chess_down_1_6" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_1_7"><img id="chess_down_1_7" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="ccell" id="DOWN_0_0"><img id="chess_down_0_0" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_0_1"><img id="chess_down_0_1" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_0_2"><img id="chess_down_0_2" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_0_3"><img id="chess_down_0_3" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_0_4"><img id="chess_down_0_4" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_0_5"><img id="chess_down_0_5" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_0_6"><img id="chess_down_0_6" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
            <td>
                <div class="ccell" id="DOWN_0_7"><img id="chess_down_0_7" src="resources/Images/chess/CHESS_BLANK.gif"
                                                      alt=""/></div>
            </td>
        </tr>


    </table>
</div>
<br>

<div class="cmdDiv alignCenter" align="left">
    <button id="startBtn" type="submit" class="btn btn-primary">开始</button>
</div>
</body>
</html>