/**
 * 페이징 처리
 * [주의사항] 해당 화면에 searchValue 히든 태그와 changePage() 함수가 존재해야 한다.
 * @author 경성구
 * @since 2023-01-19
 * @param pagenation
 * @param formId
 * @sample
 * 	makePagenation(result.pagenation, null);
 *  makePagenation(result.pagenation, "agentSP");
 */
function makePagenation(pagenation, formId){
	var prefix = (formId ? formId + "-" : "");
	var numbering = pagenation.pageCount;
	var pageNum = pagenation.num;
	var pagePer = 10;

	var numberingMin = pageNum%pagePer == 0 ? (((Math.floor(pageNum / pagePer)-1) * pagePer) + 1) : ((Math.floor(pageNum / pagePer) * pagePer) + 1);
	var numberingMax = pageNum%pagePer == 0 ? (((Math.floor(pageNum / pagePer)-1) + 1) * pagePer) : ((Math.floor(pageNum / pagePer) + 1) * pagePer);
	if (numbering < numberingMax)numberingMax = numbering;

	var buttonStr = "<button type='button' class='btn " + prefix + "pagenation-btn " + (pageNum <= pagePer ? "disabled" : "")+"' data-page='prev'>&lt;</button>";
	for (var i=numberingMin; i <= numberingMax; i++) {
		buttonStr += "<button type='button' class='btn " + prefix + "pagenation-btn " + (pageNum == i ? "active" : "") + "' data-page='"+i+"'>" + i + "</button>";
	}
	buttonStr += "<button type='button' class='btn " + prefix + "pagenation-btn " + ((numbering <= pagePer || numberingMax * pagenation.per >= pagenation.total) ? "disabled" : "")+"' data-page='next'>&gt;</button>";
	
	/* 2022-12-26 양종문 - 부모창과 팝업창 모두 페이징이 있는 경우에 class값이 중복되어 부모창에 페이징이 그려지는 문제가 발생
	                       팝업창의 페이징인 경우 페이징 div class에 formId-pagenationArea 추가해서 사용해야함
	                       formId-pagenationArea : selector 용도로 사용 / pagenation-area : css 적용 필수값 
	                       
	                       ex) <div class="btn-toolbar employeeSP-pagenationArea pagenation-area"></div> */
	if (typeof(formId) != "undefined") {
		$("." + prefix + "pagenationArea>.btn-group").html(buttonStr);
		$("." + prefix + "pagenationArea>.total-cnt-area").html("총 건수 : " + numberWithCommas(pagenation.total) + "건");
	}
	else {
		$(".pagenation-area>.btn-group").html(buttonStr);
		$(".pagenation-area>.total-cnt-area").html("총 건수 : " + numberWithCommas(pagenation.total) + "건");
	}
	
	$("." + prefix + "pagenation-btn").click(function(e){
		e.preventDefault();
		var page = $(this).attr("data-page");
		if (!$(this).hasClass("disabled")) {
			if (page != 'next' && page != 'prev'){
				var searchValue = $("#" + prefix + "searchValue").val();
				if (searchValue == "") {
					$("#" + prefix + "searchValue").val("num=" + page)
				}
				else{
					if (searchValue.indexOf("num=") != -1) {
						if (searchValue.indexOf("&num=") != -1) {
							var repValue = searchValue.substring(0, searchValue.indexOf("&num=")) + "&num=" + page;
							$("#" + prefix + "searchValue").val(repValue);
						}
						else {
							$("#" + prefix + "searchValue").val("num=" + page);
						}
					}
					else {
						$("#" + prefix + "searchValue").val(searchValue + "&num=" + page);
					}
				}
				changePage();
			}
			else if (page == 'next') {
				pagenation.num = Number(pagenation.num) + 10 + "";
				makePagenation(pagenation, formId);	// TODO formId 확인필요
			}
			else if (page == 'prev') {
				pagenation.num = Number(pagenation.num) - 10 + "";
				makePagenation(pagenation, formId);	// TODO formId 확인필요
			}
		}
	});
};