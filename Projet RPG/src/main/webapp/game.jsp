<%@page import="vo.GameData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RPG Game</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>The page of game</title>
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
				<th colspan="2">Player (Choosing your character)
					<button class="wsx" style="background-color: #FFCC33; color: white"
						value="Battle">Pikachu</button>
					<button class="wsx" style="background-color: #BBBBAA; color: white"
						value="Battle">Eevee</button>
					<button class="wsx" style="background-color: #FF4422; color: white"
						value="Battle">Charmander</button>
					<button id="fingt" style="background-color: #1b809e; color: white"
						value="Battle">Enter the battle</button>
				</th>
				<th colspan="2">Computer
					<button id="dsx" style="margin-left: 50%" value="Refreash">Change properties</button>
				</th>
			</tr>
			<tr>
				<th><img style="width: 150px; height: 100%" alt="1"
					src="img/pikachu.jpg"></th>
				<th>
					<table>
						<tr>
							<th>HP：</th>
							<th width="50%"><input class="pxl" type="number" value="120"
								placeholder="100" /></th>
						</tr>
						<tr>
							<th>MP：</th>
							<th><input class="pll" type="number" value="120"
								placeholder="100" /></th>
						</tr>
						<tr>
							<th>Agility：</th>
							<th><input class="pmj" type="number" value="9"
								placeholder="100" /></th>
						</tr>
						<tr>
							<th>Skill：</th>
							<th><input class="pjn" type="text" value="Thunderbolt"
								placeholder="100" /></th>
						</tr>
						<tr>
							<th>MP consumed(By skill)：</th>
							<th><input class="pjnhll" type="number" value="15"
								placeholder="10" /></th>
						</tr>
						<tr>
							<th>Attack：</th>
							<th><input class="pgj" type="number" value="15"
								placeholder="15" /></th>
						</tr>
						<tr>
							<th>Defense：</th>
							<th><input class="pfy" type="number" value="15"
								placeholder="15" /></th>
						</tr>
					</table>
				</th>
				<th>
					<table>
						<tr>
							<th width="50%">HP：</th>
							<th><span class="dxl"> <%
 	if (null != gameData) {
 		out.print(gameData.getXl());
 	} else {
 		out.print("No data");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>MP：</th>
							<th><span class="dll"> <%
 	if (null != gameData) {
 		out.print(gameData.getLl());
 	} else {
 		out.print("No data");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>Agility：</th>
							<th><span class="dmj"> <%
 	if (null != gameData) {
 		out.print(gameData.getMj());
 	} else {
 		out.print("No data");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>Skill：</th>
							<th><span class="djn"> <%
 	if (null != gameData) {
 		out.print(gameData.getJn());
 	} else {
 		out.print("No data");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>MP consumed(By skill)：</th>
							<th><span class="djnhll"> <%
 	if (null != gameData) {
 		out.print(gameData.getJnhll());
 	} else {
 		out.print("No data");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>Attack：</th>
							<th><span class="dgj"> <%
 	if (null != gameData) {
 		out.print(gameData.getGj());
 	} else {
 		out.print("No data");
 	}
 %>
							</span></th>
						</tr>
						<tr>
							<th>Defense：</th>
							<th><span class="dfy"> <%
 	if (null != gameData) {
 		out.print(gameData.getFy());
 	} else {
 		out.print("No data");
 	}
 %>
							</span></th>
						</tr>
					</table>
				</th>
				<th><img style="width: 150px; height: 100%" alt="1"
					src="img/Mew.jpg"></th>
			</tr>
		</table>
		<hr>
		<div id="showFight" style="text-align: left"></div>
	</div>
</body>
<script>
	//C'est possible de changer les propriétés avant le combat commence 
	var fighting = false;

	var over = false;
	var timer;
	let
	sum;

	$(function() {
		$(".wsx").click(function() {
			 var jn = 'Thunderbolt';
	            var hll = '10';
	            if (fighting) {
	                alert("The battle starts, you can't change properties!")
	                return;
	            }
	            var dxl = randomNum(1000, 2000)
	            var dll = randomNum(100, 200)
	            var dmj = randomNum(1, 10)
	            var dgj = randomNum(100, 300)
	            var wfy = randomNum(100, 150)

	            var x = dmj % 2;
	            if (x == 1) {
	                jn = 'Hyper Beam';
	                hll = '20';
	            }
	            $(".pxl").val(dxl);
	            $(".pll").val(dll);
	            $(".pmj").val(dmj);
	            $(".pjn").val(jn);
	            $(".pjnhll").val(hll);
	            $(".pgj").val(dgj);
	            $(".pfy").val(wfy);
		})
		$("#dsx").click(function() {
			$("#showFight").html("");
			var jn = 'Thunderbolt';
			var hll = '10';
			if (fighting) {
				alert("The battle starts, you can't change properties!")
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
				alert("The battle becomes a mess...")
				return;
			}
			//Joueur ne peut pas changer les propriétés si le combat commence
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

		var dnTalk = "<strong style='color: #5A738E'>Computer></strong>";
		var wjTalk = "<strong style='color: green'>Player></strong>";

		if (pxl <= 0) {
			clearInterval(timer);
			fighting = false
			$(".pxl").val(0)
			html += dnTalk
					+ "<span style='color: red'>Computer wins,game over.</span></br>";
			$("#showFight").html(html);
			return;
		}
		if (dxl <= 0) {
			clearInterval(timer);
			fighting = false
			$(".dxl").html(0)
			html += wjTalk
					+ "<span style='color: green'>You win,good game!</span></br>";
			$("#showFight").html(html);
			return;
		}
		if (dmj > pmj) {
			if (sum == 0) {
				html += dnTalk + "Go first<br>";
			}
			if (dll > djnhll) {
				$(".pxl").val(pxl - (2 * dgj) + pfy)
				$(".dll").html(dll - djnhll)
				html += dnTalk + "Using<" + djn + "> consumes MP-" + djnhll + " causing a damage "
						+ wjTalk + " HP-" + (2 * dgj - pfy) + "<br>";
				if (pll > pjnhll) {
					$(".dxl").html(dxl - (2 * pgj) + dfy)
					$(".pll").val(pll - pjnhll)
					html += wjTalk + "Using<" + pjn + "> consumes MP-" + pjnhll + " causing a damage "
							+ dnTalk + " HP-" + (2 * pgj - dfy) + "<br>";
				} else {
					$(".dxl").html(dxl - pgj + dfy)
					html += wjTalk + "Attack causes a damage" + dnTalk + " HP-" + (pgj - dfy)
							+ "<br>";
				}
			} else {
				$(".pxl").val(pxl - dgj + pfy)
				html += dnTalk + "Attack causes a damage" + wjTalk + " HP-" + (dgj - pfy)
						+ "<br>";
				if (pll > pjnhll) {
					$(".dxl").html(dxl - (2 * pgj) + dfy)
					$(".pll").val(pll - pjnhll)
					html += wjTalk + "Using<" + pjn + "> consumes MP-" + pjnhll + " causing a damage "
							+ dnTalk + " HP-" + (2 * pgj - dfy) + "<br>";
				} else {
					$(".dxl").html(dxl - pgj + dfy)
					html += wjTalk + "Attack causes a damage" + dnTalk + " HP-" + (pgj - dfy)
							+ "<br>";
				}
			}
		} else {
			if (sum == 0) {
				html += wjTalk + "Go first<br>";
			}
			if (pll > pjnhll) {
				$(".dxl").html(dxl - (2 * pgj) + dfy)
				$(".pll").val(pll - pjnhll)
				html += wjTalk + "Using<" + pjn + "> consumes MP-" + pjnhll + " causing a damage "
						+ dnTalk + " HP-" + (2 * pgj - dfy) + "<br>";
				if (dll > djnhll) {
					$(".pxl").val(pxl - (2 * dgj) + pfy)
					$(".dll").html(dll - djnhll)
					html += dnTalk + "Using<" + djn + "> consumes MP-" + djnhll + " causing a damage "
							+ wjTalk + " HP-" + (2 * dgj - pfy) + "<br>";
				} else {
					$(".pxl").val(pxl - dgj)
					html += dnTalk + "Attack causes a damage" + wjTalk + " HP-" + dgj + "<br>";
				}
			} else {
				$(".dxl").html(dxl - pgj + dfy)
				html += wjTalk + "Attack causes a damage" + dnTalk + " HP-" + (pgj - dfy)
						+ "<br>";
				if (dll > djnhll) {
					$(".pxl").val(pxl - (2 * dgj) + pfy)
					$(".dll").html(dll - djnhll)
					html += dnTalk + "Using<" + djn + "> consumes MP-" + djnhll + " causing a damage "
							+ wjTalk + " HP-" + (2 * dgj + pfy) + "<br>";
				} else {
					$(".pxl").val(pxl - dgj + pfy)
					html += dnTalk + "Attack causes a damage" + wjTalk + " HP-" + (dgj - pfy)
							+ "<br>";
				}
			}
		}
		sum = 1;
		$("#showFight").html(html);
	}

	//Pour obtenir la médiété
	
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