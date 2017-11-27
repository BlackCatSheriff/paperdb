var selectUls=new Array();
var pageArray=new Array();//每页实际文章数
var pageSize=3;//每页可放的最多文章数
function appendArticle(data,nowPage,firstSearch)
{
	$(".advanced-search .search-number p").text("共搜索到"+data.totalCnt+"条结果");
	//统计总共搜索到的数据数
	$(".search-result").empty();
	if(firstSearch)
	{
		for(var i=0;i<Math.floor(data.totalCnt/pageSize);i++)
		{
			pageArray[i]=pageSize;
		}
		pageArray[Math.floor(data.totalCnt/pageSize)]=data.totalCnt-i*pageSize;
		//计算每页实际的文章数
		var buttonNumber=0;
		//设置翻页处container长度
		if(data.totalCnt>pageSize)
		{
			$(".change-article-page button").css({"display":"block"});
			buttonNumber=2;
		}
		for(var i=1;i<Math.ceil(data.totalCnt/pageSize);i++)
		{
			$("<p>").text(i+1).appendTo($(".page-number-in"));
		}
		$(".page-number").width(i*40);
		$(".change-article-page").width(81*buttonNumber+i*40);
	}
	for(var i=0;i<Math.ceil(pageArray[nowPage]/2);i++){
		//创建每一行container并改变颜色
		var everyLine=$("<div>").addClass("every-line").appendTo($(".search-result"));
		if(i%2)
			everyLine.css({"background":"rgb(248,248,248)"});
		var everyLineIn=$("<div>").addClass("every-line-in").addClass("clearfix").appendTo(everyLine);
	}
	//创建每一页的文章并添加
	for(var i=0;i<pageArray[nowPage];i++)
	{
		var lineIndex=Math.floor(i/2);
		var everyArticle=$("<div>").addClass("every-article").appendTo($(".every-line-in:eq("+lineIndex+")"));
			var h1=$("<h1>").text(data.info[i].title).appendTo(everyArticle);
			var author=$("<div>").addClass("article-author").addClass("clearfix").appendTo(everyArticle);
				var authorLabel=$("<h2>").text("作者").appendTo(author);
				var authorauthor=$("<p>").text(data.info[i].author).appendTo(author);
			var keyword=$("<div>").addClass("article-keyword").addClass("clearfix").appendTo(everyArticle);
				var keywordLabel=$("<h2>").text("关键词").appendTo(keyword);
				var keywordk=$("<p>").text(data.info[i].keyword).appendTo(keyword);
			var summary=$("<div>").addClass("article-summary").addClass("clearfix").appendTo(everyArticle);
				var summaryLabel=$("<h2>").text("摘要").appendTo(summary);
				var summarysummary=$("<p>").text(data.info[i].summary).appendTo(summary);
			var a=$("<a>").text("阅读全文").addClass("read-article").attr("href",data.info[i].link).appendTo(everyArticle);
	}
}
function getGeneral(a,b,c,firstSearch)
{
	$.ajax({ 
	    type: "POST",    
	    url: "../Ajax/querySingle.ashx",
	    dataType: "JSON",
	    async : false,
    	data:{searchKey:a,searchValue:b,currntPage:c},
	    success: function(data) {
            appendArticle(data,c,firstSearch);
	    }
	});
}
function getAdvanced(a,b,c,firstSearch)
{
	$.ajax({ 
	    type: "POST",    
	    url: "../Ajax/queryMulti.ashx",
	    dataType: "JSON",
	    async : false,
        data:{searchKey:a,time:b,currntPage:c},
	    success: function(data) {
            appendArticle(data,c,firstSearch);
	    }
	});
}
$(function(){
	var searchkey="keyword";
	var generalSearch=new Array("keyword","title","author");
	var timer;
	var liHeight=32;
	var ulObject=new Array();
	initialPage();
	//高级搜索页和搜索结果页创建下拉框选项
	if(!$(".container").hasClass("general-search-container"))
		getAndCreate();
	function initialPage()
	{
		$(".general-search-container").css({
			"height":$(window).height()
		});
		$(".advanced-search-container").css({
			"height":$(window).height()
		});
		$(".footer").css({
			"display":"block",
			"left":($(".container").width()-$(".footer").width())/2
		});
	}
	$(window).resize(function(){
		initialPage();
	})

	//以下为普通搜素页的事件
	$(".general-search-search ul").hover(function(){
		$(this).addClass("search-ul-hover");
		$(".select-keyword img").attr("src","images/select-white.png");
		$(this).stop(false,false).animate({"height":"166px"},300);
	},function(){
		$(this).stop(false,false).animate({"height":"56px"},300,function(){
			$(this).removeClass("search-ul-hover");
			$(".select-keyword img").attr("src","images/select-blue.png");
		});
	})
	$(".general-search-search>img").hover(function(){
		$(this).attr("src","images/searching-hover.png");
	},function(){
		$(this).attr("src","images/searching.png");
	})
	$(".search-ul li").click(function(){
		var theIndex=$(".search-ul li").index(this);
		var forChange;
		var changeText;
		if(theIndex==0) return;
		forChange=generalSearch[0];
		generalSearch[0]=generalSearch[theIndex];
		generalSearch[theIndex]=forChange;
		changeText=$(".search-ul li:eq(0) p").text();
		$(".search-ul li:eq(0) p").text($(".search-ul li:eq("+theIndex+")").text());
		$(".search-ul li:eq("+theIndex+")").text(changeText);
		searchkey=generalSearch[0];
	})
	//点击搜索按钮时跳页并传送数据
	$(".general-search-search>img").click(function(){
		var searchContent=$(".general-search-search input").val();
		if(!searchContent) return;
		var url="search-result.html?searchKey="+escape(searchkey);
		url+="&searchValue="+escape(searchContent);
		url+="&currntPage="+escape("0");
		window.location.href=url;
	})

	//以下为高级搜索页的事件
	$(".advanced-search-search ul").hover(function(){
		var ulHeight;
		//判断各个下拉框有多少li数量并计算ul长度
		if($(this).parents("div").hasClass("select-time"))
			ulHeight=160;
		if($(this)[0].liNumber)
			ulHeight=$(this)[0].liNumber*liHeight;
		else
		{
			for(var i=0;i<ulObject.length;i++)
				if($(this).attr("id")==ulObject[i].id)
				{
					ulHeight=ulObject[i].liNumber*liHeight;
					break;
				}
		}
		showOption($(this),"blue",ulHeight);
	},function(){
		if(!$(this).hasClass("oppo-style"))
			hideOption($(this),"white",liHeight);
		else
			hideOption($(this),"blue",liHeight);
	})
	//选择一级菜单
	$(".select-level1").delegate(".select-option","click",function(){  
     	for(var i=0;i<selectUls.length;i++)
		{
			if(selectUls[i].name==$(this).parents("ul").attr("id"))
			{
				selectUls[i].setSelected($(this).attr("id"));
			}
		}
		$(this).parent("ul").find(".select-title p").text($(this).text());
	});  
	//选择二级菜单的一级标题
	$(".select-level2 .first-title .select-option").click(function(){
		var optionIndex=$(this).parents(".select-level2").find(".first-title .select-option").index(this);
		$(this).parent("ul").find(".select-title p").text($(this).text());
		$(this).parents(".select-level2").find(".second-title").css({"display":"none"});
		var secondUl=$(this).parents(".select-level2").find(".second-title:eq("+optionIndex+")");
		secondUl.css({"display":"block"});
		if($(this).parent(".first-title").attr("id")=="documentType")
			selectUls[0].setSelected(secondUl.find(".select-title").attr("id"));	
		else
			selectUls[1].setSelected(secondUl.find(".select-title").attr("id"));	
	})
	//选择二级菜单的二级标题
	$(".select-level2 .second-title .select-option").click(function(){
		for(var i=0;i<selectUls.length;i++)
		{
			if(selectUls[i].name==$(this).parents(".select-level2").find(".first-title").attr("id"))
				selectUls[i].setSelected($(this).attr("id"));
		}
		var changeLi;
		var changeId;
		changeLi=$(this).text();
		$(this).text($(this).parent("ul").find(".select-title p").text());
		$(this).parent("ul").find(".select-title p").text(changeLi);
		changeId=$(this).attr("id");
		$(this).attr("id",$(this).parent("ul").find(".select-title").attr("id"));
		$(this).parent("ul").find(".select-title").attr("id",changeId);
	})
	//选择年份
	$(".select-time .select-option").click(function(){
		$(this).parents("ul").find(".select-title p").text($(this).text());
	})
	//高级搜索页点击高级搜索时跳页并传送数据
	$(".search-choice button").click(function(){
		var advancedKey=getAdvancedKey();
		var time=getTime();
		if(advancedKey)
			postMultiData(advancedKey,time);
	})
	//搜索结果页点击搜索效果
	$(".advanced-search-search .advanced-button").click(function(){
		var advancedKey=getAdvancedKey();
		var time=getTime();
		if(advancedKey)
			postMultiData(advancedKey,time);
	})
	//跳回一般搜素
	$(".advanced-search-search .search-button").click(function(){
		window.location.href="general-search.html";
	})
	//高级搜索传送数据
	function postMultiData(advancedKey,time){
		var url="search-result.html?searchKey="+escape(advancedKey);
		url+="&time="+escape(time);
		url+="&currntPage="+escape("0");
		window.location.href=url;
	}
	//获取页面上选中的时间
	function getTime()
	{
		var time="";
		var startTime=$(".select-time .first-title .select-title p").text();
		var lastTime=$(".select-time .second-title .select-title p").text();
		if(startTime-0>lastTime-0)
		{
			var changeTime=startTime;
			startTime=lastTime;
			lastTime=changeTime;
		}
		//如果前者比后者小交换位置
		time+=startTime+";";
		time+=lastTime;
		return time;
	}
	//获取页面选择的搜索条件
	function getAdvancedKey()
	{
		var advancedKey="";
		for(var i=0;i<selectUls.length;i++)
		{
			if(selectUls[i].selectedId)
			{
				advancedKey+=selectUls[i].selectedId;
				advancedKey+=";";
			}
		}
		advancedKey=advancedKey.substring(0,advancedKey.length-1);
		return advancedKey;
	}
	function showOption(obj,changeTo,ulHeight)
	{
		obj.addClass("search-ul-hover");
		if(changeTo=="white")
			obj.find(".select-title img").attr("src","images/select-white.png");
		else if(changeTo=="blue")
			obj.find(".select-title img").attr("src","images/select-blue.png");
		//if(!$(".advanced-search-search ul").is(":animated"))
			timer=setTimeout(function(){
				obj.addClass("search-ul-hover");
				obj.stop()
				.animate({"height":ulHeight,"borderBottomLeftRadius":0,"borderBottomRightRadius":0},200,scroll);
				$(".advanced-search-search ul").height(32);
			},50);
		function scroll()
		{
			//时间下拉框加载完后显示滚动条
			if(obj.parents("div").hasClass("select-time")){
				//obj.css({"overflowY":"scroll"});
				obj.find(".options").mCustomScrollbar({
	    			theme:"light",
	    			asix:"y"
				});
			}
		}			
	}
	function hideOption(obj,changeTo,ulHeight)
	{
		clearTimeout(timer);
		if(obj.parents("div").hasClass("select-time"))
		{
			obj.scrollTop(0);
			obj.css({"overflowY":"hidden"});
		}
		obj.stop().animate({"height":ulHeight},200,function(){
			obj.removeClass("search-ul-hover");
			if(obj.hasClass("second-title"))
				obj.css({"borderBottomRightRadius":16});
			else if(obj.hasClass("first-title")){
				if(!obj.parent("div").parent("div").hasClass("select-time"))
					obj.css({"borderBottomLeftRadius":16});
			}
			else
				obj.css({"borderBottomLeftRadius":16,"borderBottomRightRadius":16});
			if(changeTo=="white")
				obj.find(".select-title img").attr("src","images/select-white.png");
			else if(changeTo=="blue")
				obj.find(".select-title img").attr("src","images/select-blue.png");
		});
	}
	function getAndCreate()
	{
		setEverySelect();
		initializeSelect();
		var json=getOptionData();
		createSelectTime();
		for(var i=0;i<json.length;i++)
		{
			var selectTitle=json[i].firstType;
			if(selectTitle=="文献综述"||selectTitle=="一级评估"||selectTitle=="二级评估")
			{
				selectUls[0].getType(json[i]);
				continue;
			}
			else if(selectTitle=="使用价值"||selectTitle=="非使用价值")
			{
				selectUls[1].getType(json[i]);
				continue;
			}
			for(var j=0;j<selectUls.length;j++)
			{
				if(selectTitle==selectUls[j].firstT)
				{
					selectUls[j].getType(json[i].secondType);
					selectUls[j].createOption();
				}
			}
		}
		selectUls[0].createOption();
		selectUls[1].createOption();
	}
	function createSelectTime(){
		var nowYear=new Date().getFullYear();
		for(var i=0;i<2;i++)
		{
			var timeUl=$(".select-time ul:eq("+i+")");
			var optionContainer=$("<div>").addClass("options").height(128).appendTo(timeUl);
			for(var j=0;j<nowYear-2000+1;j++)
			{
				$("<li>").text(j+2000).addClass("select-option").appendTo(optionContainer);
			}
		}
		
	}
	function getOptionData()
	{
		var json=[];
		$.ajax({ 
	        type: "GET",    
	        url: "../Ajax/getOptions.ashx",
	        dataType: "JSON",
	        async : false,
	        success: function(data) {
                json=data;
	        }
	    });
	    return json;
	}
	function initializeSelect()
	{
		selectUls[0]=new everySelect("documentType","文献类型",true);
		selectUls[1]=new everySelect("valueType","非市场价值类型",true);
		selectUls[2]=new everySelect("place","地区",false);
		selectUls[3]=new everySelect("ecoSystem","生态系统类型",false);
		selectUls[4]=new everySelect("ecoService","生态系统服务类型",false);
		selectUls[5]=new everySelect("model","模型",false);
	}
	function everySelect(id,firstType,twolevels)
	{
		this.name=id;
		this.selectedId=0;
		this.obj=$(document.getElementById(id));
		this.twolevels=twolevels;
		//获取该id对象并转化为jquery对象
		this.firstT=firstType;
		this.secondT=new Array();
		/*this.serverIds=[];*/
	}
	function setEverySelect(){
		everySelect.prototype.setSelected=function(number)
		{
			this.selectedId=number;
		}
		everySelect.prototype.getType=function(jsonObj){
			if(!this.twolevels)
				this.secondT=jsonObj;
			//获得sencondType
			else
			{
				this.secondT.push(jsonObj);
				//获得json数组
			}
		}
		everySelect.prototype.createOption=function(){
			ulObject.push({"id":this.name,"liNumber":this.secondT.length+1});
			if(!this.twolevels)
			{
				for(var i=0;i<this.secondT.length;i++)
				{
					$("<li>").attr("id",this.secondT[i].id).addClass("select-option").text(this.secondT[i].name).appendTo(this.obj);			
				}
			}else{
				for(var i=0;i<this.secondT.length;i++)
				{
					$("<li>").text(this.secondT[i].firstType).addClass("select-option").appendTo(this.obj);
					var ulObj=$("<ul>").addClass("second-title").appendTo(this.obj.parent(".select-level2"));
					ulObj[0].liNumber=this.secondT[i].secondType.length;
					for(j=0;j<this.secondT[i].secondType.length;j++)
					{
						var liObj=this.secondT[i].secondType[j];
						var option=$("<li>").attr("id",liObj.id).appendTo(ulObj);
						if(j!=0){
							option.text(liObj.name).addClass("select-option");
						}else{
							option.addClass("select-title");
							var div=$("<div>").addClass("clearfix").appendTo(option);
							var p=$("<p>").text(liObj.name).appendTo(div);
							var img=$("<img>").attr("src","images/select-white.png").appendTo(div);
						}
					}
				}
			}
		}
	}
})