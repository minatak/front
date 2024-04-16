// 날짜함수 연습

'use strict';

let str = '';

// 오늘 날짜 - Date()
const today = new Date();
const year = today.getFullYear(); // 연도 4자리 
str += "오늘 연도 : " + year + "<br/>";
const month = today.getMonth() + 1;
str += "오늘 월 : " + month + "<br/>";
const date = today.getDate(); // 날짜(일)
str += "오늘 일 : " + date + "<br/>";
const hour = today.getHours();
str += "현재 시간 : " + hour + "<br/>";
const minute = today.getMinutes();
str += "현재 분 : " + minute + "<br/>";
const second = today.getSeconds();
str += "현재 초 : " + second + "<br/>";
const yymmdd = year + "-" + month + "-" + date + " " +
      hour + ":" + minute + ":" + second;
str += "오늘 날짜 / 시간 : " + yymmdd + "<br/>";

// let weekStr = new Array();
let weekStr = ['일','월','화','수','목','금','토'];
let weekDay = today.getDay(); // 요일 꺼내는 함수
str += "오늘 요일 : " + weekStr[weekDay] + "요일<br/>";

let lastDate = new Date(2024,4,0);
str += "이번 달 마지막 일자는 : " + lastDate.getDate();

function dateCheck() {
  let yy = document.getElementById("yy").value;
  let mm = document.getElementById("mm").value;
  let strDate = new Date(yy, mm, 0);
  demo.innerHTML = `${yy}년 ${mm}월의 마지막 일자 : <font size='4' color='red'><b>${strDate.getDate()}</b></font>`;
}

demo.innerHTML = "<font size='5' color='red'><b>" + str + "</b></font>";
