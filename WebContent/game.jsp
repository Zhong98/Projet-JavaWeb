<%@page import="vo.GameData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>游戏页面</title>
<style>
body {
	width: 100%;
}

div {
	margin: auto;
	width: 80%;
	text-align: center;
	height: auto;
}

table {
	width: 100%;
	padding: 0;
	border-collapse: collapse;
	border: solid black 1px;
}

table tr {
	border-top: 1px solid #cccccc;
	background-color: white;
	margin: 0;
	padding: 0;
}

table tr:nth-child(2n) {
	background-color: #f8f8f8;
}

table tr th {
	font-weight: bold;
	border: 1px solid #cccccc;
	margin: 0;
	padding: 6px 13px;
}

table tr td {
	border: 1px solid #cccccc;
	margin: 0;
	padding: 6px 13px;
}

table tr th :first-child, table tr td :first-child {
	margin-top: 0;
}

table tr th :last-child, table tr td :last-child {
	margin-bottom: 0;
}

td {
	width: 100px;
	border: 1px solid black;
}
</style>
</head>
<body>
	<%
		GameData gameData = (GameData) session.getAttribute("gameData");
	%>
	<div>
		<table>
			<tr>
				<th colspan="2">主人玩家
					<button id="fingt" style="margin-left: 50%; background-color: #1b809e; color: white" value="战斗">进入战斗</button>
				</th>
				<th colspan="2">电脑玩家
					<button id="dsx" style="margin-left: 50%" value="刷新">刷新属性</button>
				</th>
			</tr>
			<tr>
				<th>
					<img style="width: 150px;height: 100%"  alt="1" src="img/pkq.jpg">
				</th>
				<th>
					<table>
						<tr>
							<th>血量：</th>
							<th width="50%"><input class="pxl" type="number" value="120"
								placeholder="100" /></th>
						</tr>
						<tr>
							<th>蓝量：</th>
							<th><input class="pll" type="number" value="120"
								placeholder="100" /></th>
						</tr>
						<tr>
							<th>敏捷：</th>
							<th><input class="pmj" type="number" value="9"
								placeholder="100" /></th>
						</tr>
						<tr>
							<th>技能：</th>
							<th><input class="pjn" type="text" value="千里追凶"
								placeholder="100" /></th>
						</tr>
						<tr>
							<th>技能耗蓝量：</th>
							<th><input class="pjnhll" type="number" value="15"
								placeholder="10" /></th>
						</tr>
						<tr>
							<th>攻击：</th>
							<th><input class="pgj" type="number" value="15"
								placeholder="15" /></th>
						</tr>
						<tr>
							<th>防御：</th>
							<th><input class="pfy" type="number" value="15"
								placeholder="15" /></th>
						</tr>
					</table>
				</th>
				<th>
					<table>
						<tr>
							<th width="50%">血量：</th>
							<th><span class="dxl"> <%
 	if (null != gameData) {
 		out.print(gameData.getXl());
 	} else {
 		out.print("暂无数据");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>蓝量：</th>
							<th><span class="dll"> <%
 	if (null != gameData) {
 		out.print(gameData.getLl());
 	} else {
 		out.print("暂无数据");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>敏捷：</th>
							<th><span class="dmj"> <%
 	if (null != gameData) {
 		out.print(gameData.getMj());
 	} else {
 		out.print("暂无数据");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>技能：</th>
							<th><span class="djn"> <%
 	if (null != gameData) {
 		out.print(gameData.getJn());
 	} else {
 		out.print("暂无数据");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>技能耗蓝量：</th>
							<th><span class="djnhll"> <%
 	if (null != gameData) {
 		out.print(gameData.getJnhll());
 	} else {
 		out.print("暂无数据");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>攻击：</th>
							<th><span class="dgj"> <%
 	if (null != gameData) {
 		out.print(gameData.getGj());
 	} else {
 		out.print("暂无数据");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>防御：</th>
							<th><span class="dfy"> <%
 	if (null != gameData) {
 		out.print(gameData.getFy());
 	} else {
 		out.print("暂无数据");
 	}
 %>
							</span></th>
						</tr>
					</table>
				</th>
				<th>
					<img style="width: 150px;height: 100%"  alt="1" src="img/my.jpg">
				</th>
			</tr>
		</table>
		<hr>
		<div id="showFight" style="text-align: left"></div>
	</div>
</body>
<script>
	//战斗开始前可以变更属性
	var fighting = false;

	var over = false;
	var timer;
	let
	sum;

	$(function() {
		$("#dsx").click(function() {
			$("#showFight").html("");
			var jn = '千里追击';
			var hll = '10';
			if (fighting) {
				alert("战斗已打响无法更改属性")
				return;
			}
			$.ajax({
				type : "get",
				data : {},
				url : "game",
				success : function(result) {
					var resultJson = eval("(" + result + ")")
					$(".dxl").html(resultJson.xl);
					$(".dll").html(resultJson.ll);
					$(".dmj").html(resultJson.mj);
					$(".djn").html(resultJson.jn);
					$(".djnhll").html(resultJson.jnhll);
					$(".dgj").html(resultJson.gj);
					$(".dfy").html(resultJson.fy);
				}
			})
		})

		$("#fingt").click(function() {
			if (fighting) {
				alert("战场已经乱成一锅粥啦")
				return;
			}
			//战斗打响不能变更属性
			sum = 0
			fighting = true;
			timer = setInterval(function() {
				fingting();
			}, 500);
		})
	})

	function fingting() {

		var html = $("#showFight").html();

		var pxl = parseInt($(".pxl").val());
		var pll = parseInt($(".pll").val());
		var pmj = parseInt($(".pmj").val());
		var pjn = $(".pjn").val();
		var pjnhll = parseInt($(".pjnhll").val());
		var pgj = parseInt($(".pgj").val());
		var pfy = parseInt($(".pfy").val());

		var dxl = parseInt($(".dxl").html());
		var dll = parseInt($(".dll").html())
		var dmj = parseInt($(".dmj").html())
		var djn = $(".djn").html()
		var djnhll = parseInt($(".djnhll").html())
		var dgj = parseInt($(".dgj").html());
		var dfy = parseInt($(".dfy").html());

		var dnTalk = "<strong style='color: #5A738E'>电脑玩家></strong>";
		var wjTalk = "<strong style='color: green'>主人玩家></strong>";

		if (pxl <= 0) {
			clearInterval(timer);
			fighting = false
			$(".pxl").val(0)
			html += dnTalk
					+ "<span style='color: red'>获胜,很遗憾未取胜，调整下属性继续战斗吧</span></br>";
			$("#showFight").html(html);
			return;
		}
		if (dxl <= 0) {
			clearInterval(timer);
			fighting = false
			$(".dxl").html(0)
			html += wjTalk
					+ "<span style='color: green'>获胜,very good</span></br>";
			$("#showFight").html(html);
			return;
		}
		if (dmj > pmj) {
			if (sum == 0) {
				html += dnTalk + "先行出手<br>";
			}
			if (dll > djnhll) {
				$(".pxl").val(pxl - (2 * dgj) + pfy)
				$(".dll").html(dll - djnhll)
				html += dnTalk + "使用《" + djn + "》消耗了蓝量-" + djnhll + "减少了"
						+ wjTalk + "血量-" + (2 * dgj - pfy) + "<br>";
				if (pll > pjnhll) {
					$(".dxl").html(dxl - (2 * pgj) + dfy)
					$(".pll").val(pll - pjnhll)
					html += wjTalk + "使用《" + pjn + "》消耗了蓝量-" + pjnhll + "减少了"
							+ dnTalk + "血量-" + (2 * pgj - dfy) + "<br>";
				} else {
					$(".dxl").html(dxl - pgj + dfy)
					html += wjTalk + "普通攻击减少了" + dnTalk + "血量-" + (pgj - dfy)
							+ "<br>";
				}
			} else {
				$(".pxl").val(pxl - dgj + pfy)
				html += dnTalk + "普通攻击减少了" + wjTalk + "血量-" + (dgj - pfy)
						+ "<br>";
				if (pll > pjnhll) {
					$(".dxl").html(dxl - (2 * pgj) + dfy)
					$(".pll").val(pll - pjnhll)
					html += wjTalk + "使用《" + pjn + "》消耗了蓝量-" + pjnhll + "减少了"
							+ dnTalk + "血量-" + (2 * pgj - dfy) + "<br>";
				} else {
					$(".dxl").html(dxl - pgj + dfy)
					html += wjTalk + "普通攻击减少了" + dnTalk + "血量-" + (pgj - dfy)
							+ "<br>";
				}
			}
		} else {
			if (sum == 0) {
				html += wjTalk + "先行出手<br>";
			}
			if (pll > pjnhll) {
				$(".dxl").html(dxl - (2 * pgj) + dfy)
				$(".pll").val(pll - pjnhll)
				html += wjTalk + "使用《" + pjn + "》消耗了蓝量-" + pjnhll + "减少了"
						+ dnTalk + "血量-" + (2 * pgj - dfy) + "<br>";
				if (dll > djnhll) {
					$(".pxl").val(pxl - (2 * dgj) + pfy)
					$(".dll").html(dll - djnhll)
					html += dnTalk + "使用《" + djn + "》消耗了蓝量-" + djnhll + "减少了"
							+ wjTalk + "血量-" + (2 * dgj - pfy) + "<br>";
				} else {
					$(".pxl").val(pxl - dgj)
					html += dnTalk + "普通攻击减少了" + wjTalk + "血量-" + dgj + "<br>";
				}
			} else {
				$(".dxl").html(dxl - pgj + dfy)
				html += wjTalk + "普通攻击减少了" + dnTalk + "血量-" + (pgj - dfy)
						+ "<br>";
				if (dll > djnhll) {
					$(".pxl").val(pxl - (2 * dgj) + pfy)
					$(".dll").html(dll - djnhll)
					html += dnTalk + "使用《" + djn + "》消耗了蓝量-" + djnhll + "减少了"
							+ wjTalk + "血量-" + (2 * dgj + pfy) + "<br>";
				} else {
					$(".pxl").val(pxl - dgj + pfy)
					html += dnTalk + "普通攻击减少了" + wjTalk + "血量-" + (dgj - pfy)
							+ "<br>";
				}
			}
		}
		sum = 1;
		$("#showFight").html(html);
	}

	/*
	 * 生成中间数
	 * */
	function randomNum(minNum, maxNum) {
		switch (arguments.length) {
		case 1:
			return parseInt(Math.random() * minNum + 1, 10);
			break;
		case 2:
			return parseInt(Math.random() * (maxNum - minNum + 1) + minNum, 10);
			break;
		default:
			return 0;
			break;
		}
	}
</script>
</html>