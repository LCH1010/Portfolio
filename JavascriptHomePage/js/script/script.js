$(".nav>li").mouseover(function(){
	$(this).children(".submenu").stop().slideDown();
});
$(".nav>li").mouseleave(function(){
	$(this).children(".submenu").stop().slideUp();
});                                       // 위에 상단 메뉴 스크롤 내려오는 기능


start();
var imgs = 2;
var now = 0;
function start(){
	$(".imgs>img").eq(0).siblings().css({"margin-left":"-2000px"});
	setInterval(function(){slide();},2000);
}
function slide(){
	now = now == imgs?0:now+=1;
	$(".imgs>img").eq(now-1).css({"margin-left":"0"});
	$(".imgs>img").eq(now).css({"margin-left":"-2000px"});
}                                         //메인 화면 이미지 옆으로 스크롤 효과


$("a").focusin(function(){
	$(this).css("color","#F00")
})
$("a").focusout(function(){
	$(this).css("color","inherit")
})                                       //글자누르면 빨간색으로 강조되는 효과


function showClock(){
		var currentDate = new Date();
		var divClock = document.getElementById("divClock");

		var msg = "현재 시간  :  "+currentDate.getHours()+"시"
		msg += currentDate.getMinutes()+"분";
		msg += currentDate.getSeconds()+"초";

		divClock.innerText = msg;
		setTimeout(showClock,1000);
}                                //현재 몇시인지 알려주는 기능 currentDate 기능


var all = "";
function add(num) {
	all = all + num;
	document.getElementById("display").value = all;
}
function sum() {
	document.getElementById("display").value = eval(all);
}
function clearDisplay() {
	all = "";
	document.getElementById("display").value = "0";
}
function tan(all) {
	all.value = Math.tan((all.value * 3.141592) / 180);
}
function sin(all) {
	all.value = Math.sin((all.value * 3.141592) / 180);
}
function cos(all) {
	all.value = Math.cos((all.value * 3.141592) / 180);
}
function abs(all) {
	all.value = Math.abs(all.value);
}
function pow(all){
	all.value = Math.pow(all.value,2);
}                                   //계산기 기능


	      $(document).ready(function() {

	      var counter = 0;
	      var c = 0;
	      var i = setInterval(function() {

	      $(".loading-page .counter h1").html(c);
	      $(".loading-page").css("width", c + "%");

	      counter++;
	      c++;
	      if(counter == 101) {
	            clearInterval(i);
	      }

	}, 50);

});                                // 100초기능


function button1_click() {
	alert("축하드립니다♥ 100초안에 눌러주셨군요. 확인을 눌러주시면           이벤트페이지로 이동합니다!");
}                            // 100초안에누르면 당첨되는 버튼기능




var prevScrollpos = window.pageYOffset;
window.onscroll = function() {

var currentScrollpos = window.pageYOffset;
if(prevScrollpos > currentScrollpos) {
			document.getElementById("navbar").style.top = "0";
} else {
			document.getElementById("navbar").style.top = "-150px";
}

prevScrollpos = currentScrollpos;

}                                  // 위에상단바 메뉴


var name = prompt("♥축하드립니다♥ 20만번째 방문자입니다! 당첨되신분에 한해서 선물을 드립니다. 받고싶은 선물을 정확히 입력해주세요! ex)나이키 조던 2018 ");

var msg = "당신이 받고싶은 선물은 "+name+"이시군요!. " +
          name + "제품을 당신의 주소로 보내드리겠습니다 제품은 무료입니다^^.";
alert(msg);                      // 당첨자 선물 박스 기능
