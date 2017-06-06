//declear variable
    var myDate = new Date();
    var myYear = myDate.getFullYear();
    var myMonth = myDate.getMonth() + 1;
    var myToday = myDate.getDate();
    var myWeek = myDate.getDay();
    var myHour = myDate.getHours();
    var myMinutes = myDate.getMinutes();
    var mySeconds = myDate.getSeconds();
    var myWeekTbl = new Array("sun", "mon", "tue", "wed", "thu", "fri", "sat");
    var myMonthTbl = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
    
    var upSideDown=0;
    var remMin_=0;
    var remSec_=0;
    var mode_=0;
    
    var test;
    
    //Get ScreenSize
    var w_ = screen.width;
    var h_ = screen.height;
    
//setup
    //Deviceready Function
    document.addEventListener("deviceready",function(){
        setInterval(changeMode2,200);    
        window.StatusBar.hide(true);
    });
    
        
    // 00表示
    var dateZellFill = function ( number ) {
        return ( "0" + number ).substr( -2 ) ;
        }
        
    //カレンダー
    if (((myYear%4)==0 && (myYear%100)!=0) || (myYear%400)==0){
        myMonthTbl[1] = 29;
    } 
    myDate.setDate(1); 
    var myWeek = myDate.getDay();//12月は０＝日曜日
    var myTblLine = Math.ceil((myWeek+myMonthTbl[myMonth])/7);//行数
    var myTable = new Array(7*myTblLine);
    for(i=0; i<7*myTblLine; i++){
        myTable[i]=".";    //空欄の処理
    }
    for(i=0; i<myMonthTbl[myMonth-1]; i++){
        myTable[myWeek+i] =i+1;//日にちを入れる
    }
    
    var calendar;    
    function cal(){
        calendar = "<tr>";
        for(i=0; i<myWeekTbl.length; i++){
        calendar = calendar + "<th> " + myWeekTbl[i] + "</th>";
        }  
        calendar = calendar + "</tr>";
        
        for(i=0; i<myTblLine; i++){
        calendar = calendar + "<tr>";
        for(j=0; j<7; j++){
        myDat = myTable[j+(i*7)];//ポイント→日にちの計算方法
        if(myDat==myToday){//今日
            calendar = calendar + "<td class=\"mo_t\">";
        }else{
        calendar = calendar + "<td>" ;
        }
        calendar = calendar + myDat + "</td>";
        }
        calendar = calendar + "</tr>";
        }
    }
    
//リンク
    function ref() {
    window.open("http://www.replug.jp/", '_blank', 'location=yes');
    return false;
    }
    
//loop
    function loop(){
        myDate = new Date();
        myYear = myDate.getFullYear();
        myMonth = myDate.getMonth() + 1;
        myToday = myDate.getDate();
        myWeek = myDate.getDay();
        myHour = myDate.getHours();
        myMinutes = myDate.getMinutes();
        mySeconds = myDate.getSeconds();
        document.getElementById('year').innerHTML = myYear;
        document.getElementById('date').innerHTML = myMonth +"/"+myToday;
        document.getElementById('weekday').innerHTML = myWeekTbl[myWeek];
        document.getElementById('c_month').innerHTML = dateZellFill(myMonth);
        cal();
        document.getElementById('c_cal').innerHTML = calendar;
    }        
    setInterval('loop()',5000);
    
//Mode change
    //to Mode01
    $(function(){
    $('#nav01').bind('click touchend',function() {   
        mode_=0;
        $(".today").fadeIn("slow");
        $(".month").fadeOut("slow");
        $("#timer").fadeOut("slow");
        $("nav").fadeIn("slow");
        $("footer").fadeIn("slow");
        $("#nav01").fadeOut("slow");
        $("#nav02").fadeIn("slow");
        $("#close").fadeOut("slow");
    });
    
    //to Mode02
    $('#nav02').bind('click touchend',function() {
        mode_=1;
        $(".today").fadeOut("slow");
        $("#timer").fadeOut("slow");
        $(".month").fadeIn("slow");
        $("nav").fadeIn("slow");
        $("footer").fadeIn("slow");
        $("#nav01").fadeIn("slow");
        $("#nav02").fadeOut("slow");
        $("#close").fadeOut("slow");
    });
    
    $('#close').bind('click touchend',function() {
        mode_=0;
        $(".today").fadeIn("slow");
        $(".month").fadeOut("slow");
        $("#timer").fadeOut("slow");
        $("nav").fadeIn("slow");
        $("footer").fadeIn("slow");
        $("#nav01").fadeOut("slow");
        $("#nav02").fadeIn("slow");
        $("#close").fadeOut("slow");
    });
    
    });
    
    //to Mode03
    function changeMode2(){
        navigator.accelerometer.getCurrentAcceleration(onSuccess, onError);        
    }
    function onSuccess(acceleration){
        
        if(acceleration.y<-9){
        upSideDown++;
        }else{
        upSideDown=0;
        }
        
        if(upSideDown>2){
        mode_=2;
        }
        
        if(mode_ ==2){
        $(".today").fadeOut("slow");
        $(".month").fadeOut("slow");
        $("#nav01").fadeOut("slow");
        $("#nav02").fadeOut("slow");
        $("#close").fadeIn("slow");
        $("footer").fadeOut("slow");
        $("#timer").fadeIn("slow");        
        setInterval('remSeconds()',500);//タイマー発火
        }
    }
    
    function onError(acceleration){
        alert("Error");
    }
    function remSeconds(){
        document.getElementById('timer').innerHTML =dateZellFill(remMin_) + ":" + dateZellFill(remSec_) ;    
    }

   
    
    
