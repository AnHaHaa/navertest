<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" layout:decorate="layout/basic">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <th:block layout:fragment="title">
        <title>리스트 페이지</title>
    </th:block>

    <th:block layout:fragment="content">
        <div class="page_tits">
            <h3>게시판 관리</h3>
            <p class="path"><strong>현재 위치 :</strong> <span>게시판 관리</span> <span>리스트형</span> <span>리스트</span></p>
        </div>

        <div class="content">
            <section>
                <!--/* 검색 */-->
			    <div class="search_box">
			        <form id="searchForm" onsubmit="return false;" autocomplete="off">
			            <div class="sch_group fl">
			                <select id="searchType" name="searchType" title="검색 유형 선택">
			                    <option value="" <c:if test="${param.searchType == ''}"> selected="selected" </c:if>>전체 검색</option>
			                    <option value="title" <c:if test="${param.searchType == 'title'}"> selected="selected" </c:if>>제목</option>
			                    <option value="content" <c:if test="${param.searchType == 'content'}"> selected="selected" </c:if>>내용</option>
			                    <option value="writer" <c:if test="${param.searchType == 'writer'}"> selected="selected" </c:if>>작성자</option>
			                </select>
			                <c:if test="${param.keyword == ''}">
			                	<input type="text" id="keyword" name="keyword" placeholder="키워드를 입력해 주세요." title="키워드 입력" />
			                </c:if>
			                <c:if test="${!param.keyword != ''}">
			                	<input type="text" id="keyword" name="keyword" value="${param.keyword}"/> 
			                </c:if>
				            <button class="bt_search" id="searchbtn">검색</button>			                
			            </div>
			        </form>
			    </div>
                
                <!--/* 리스트 */-->
                <table class="tb tb_col" border=1>
                    <colgroup>
                        <col style="width:50px;"/><col style="width:7.5%;"/><col style="width:auto;"/><col style="width:10%;"/><col style="width:15%;"/><col style="width:7.5%;"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col"><input type="checkbox"/></th>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">등록일</th>
                            <th scope="col">조회</th>
                        </tr>
                    </thead>

                    <!--/* 리스트 데이터 렌더링 영역 */-->
                    <tbody id="list">
                    	<c:if test="${fn:length(response.list) == 0}">
                    		<td colspan="6"><div className="no_data_msg">검색된 결과가 없습니다.</div></td>
                    	</c:if>
                    
						<c:forEach var="row" items="${response.list}">
							<tr>
	                            <td><input type="checkbox" /></td>
	                            <td>${row.seq}</td>
	                            <td>${row.title}</td>
	                            <td>${row.writer}</td>
	                            <td></td>
	                            <td></td>
	                        </tr>
						</c:forEach>
                    </tbody>
                </table>

                <!--/* 페이지네이션 렌더링 영역 */-->
                <div class="paging">
	                <c:if test="${response.pagination.existPrevPage}">
						<a id="page_bt_first">첫 페이지</a>
        				<a id="page_bt_prev">이전 페이지</a>
	                </c:if>
	                <c:forEach begin="${response.pagination.startPage}" end="${response.pagination.endPage}" varStatus="vs">
        				<c:if test="${vs.index == param.page}">
	        				<a style="color:red" class="page_bt">${vs.index}</a>
        				</c:if>
        				<c:if test="${vs.index != param.page}">
        				<a class="page_bt">${vs.index}</a>
        				</c:if>
	                </c:forEach>
        			<c:if test="${response.pagination.existNextPage}">
						<a id="page_bt_next">다음 페이지</a>
        				<a id="page_bt_last">마지막 페이지</a>
	                </c:if>	
                
                </div>

                <!--/* 버튼 */-->
                <p class="btn_set tr">
                    <a th:href="#" class="btns btn_st3 btn_mid">글쓰기</a>
                </p>
            </section>
        </div> <!--/* .content */-->
    </th:block>
    
    <script type="text/javascript">
    $(document).ready(function(){
    	$("#searchbtn").on('click',function(){
	    	const queryParams = {
	            page: 1,
	            searchType: $("#searchType").val(),
	            keyword: $("#keyword").val()
	        }
	    	location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
    	});
	    
    	$(".page_bt").on('click',function(e){
    		const queryParamsPage = {
	            page: $(this).text(),
	            searchType: $("#searchType").val(),
	            keyword: $("#keyword").val()
	        }
	    	$(this).attr("href",location.pathname + '?' + new URLSearchParams(queryParamsPage).toString());
    	});
    	
    	$("#page_bt_first").on('click',function(){
	    	const queryParamsPage = {
	            page: 1,
	            searchType: $("#searchType").val(),
	            keyword: $("#keyword").val()
	        }
	    	location.href = location.pathname + '?' + new URLSearchParams(queryParamsPage).toString();
    	});
    	
    	$("#page_bt_prev").on('click',function(){
	    	const queryParamsPage = {
	            page:"${response.pagination.endPage-10}",
	            searchType: $("#searchType").val(),
	            keyword: $("#keyword").val()
	        }
	    	location.href = location.pathname + '?' + new URLSearchParams(queryParamsPage).toString();
    	});
    	
    	$("#page_bt_next").on('click',function(){
	    	const queryParamsPage = {
	            page:"${response.pagination.startPage+10}",
	            searchType: $("#searchType").val(),
	            keyword: $("#keyword").val()
	        }
	    	location.href = location.pathname + '?' + new URLSearchParams(queryParamsPage).toString();
    	});
    	
    	$("#page_bt_last").on('click',function(){
	    	const queryParamsPage = {
	            page:"${response.pagination.totalPageCount}",
	            searchType: $("#searchType").val(),
	            keyword: $("#keyword").val()
	        }
	    	location.href = location.pathname + '?' + new URLSearchParams(queryParamsPage).toString();
    	});
	    
	    
	    
    });
    
    </script>
    
    <!-- 
    <th:block layout:fragment="script">
        <script th:inline="javascript">
            window.onload = () => {
                // 페이지가 로드되었을 때, 딱 한 번만 함수를 실행
                findAllPost();
            }


            // 게시글 리스트 조회
            function findAllPost() {
                // 1. PagingResponse의 멤버인 List<T> 타입의 list를 의미
                var list = ${response.list} ;

                // 2. 리스트가 비어있는 경우, 행에 "검색 결과가 없다"는 메시지를 출력하고, 페이지 번호(페이지네이션) HTML을 제거(초기화)한 후 로직을 종료
                if ( !list.length ) {
                    document.getElementById('list').innerHTML = '<td colspan="6"><div className="no_data_msg">검색된 결과가 없습니다.</div></td>';
                    drawPage();
                };

                // 3. PagingResponse의 멤버인 pagination을 의미
                const pagination = ${response.pagination};

                // 4. @ModelAttribute를 이용해서 뷰(HTML)로 전달한 SearchDto 타입의 객체인 params를 의미
                const params = ${params};

                // 5. 리스트에 출력되는 게시글 번호를 처리하기 위해 사용되는 변수 (리스트에서 번호는 페이지 정보를 이용해서 계산해야 함)
                let num = pagination.totalRecordCount - ((params.page - 1) * params.recordSize);

                // 6. 리스트 데이터 렌더링
                drawList(list, num);

                // 7. 페이지 번호 렌더링
                drawPage(pagination, params);
            }


            /* // 리스트 HTML draw
            function drawList(list, num) {

                // 1. 렌더링 할 HTML을 저장할 변수
                let html = '';

                /*
                 * 2. 기존에 타임리프(Thymeleaf)를 이용해서 리스트 데이터를 그리던 것과 유사한 로직
                 *    기존에는 게시글 번호를 (전체 데이터 수 - loop의 인덱스 번호)로 처리했으나, 현재는 (전체 데이터 수 - ((현재 페이지 번호 - 1) * 페이지당 출력할 데이터 개수))로 정밀히 계산
                 */
                list.forEach(row => {
                    html += `
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td></td>
                            <td>${row.title}</td>
                            <td>${row.writer}</td>
                            <td></td>
                            <td></td>
                        </tr>
                    `;
                })

                // 3. id가 "list"인 요소를 찾아 HTML을 렌더링
                document.getElementById('list').innerHTML = html;
            } */


            // 페이지 HTML draw
            function drawPage(pagination, params) {

                // 1. 필수 파라미터가 없는 경우, 페이지 번호(페이지네이션) HTML을 제거(초기화)한 후 로직 종료
                if ( !pagination || !params ) {
                    document.querySelector('.paging').innerHTML = '';
                    throw new Error('Missing required parameters...');
                }

                // 2. 렌더링 할 HTML을 저장할 변수
                let html = '';

                // 3. 이전 페이지가 있는 경우, 즉 시작 페이지(startPage)가 1이 아닌 경우 첫 페이지 버튼과 이전 페이지 버튼을 HTML에 추가
                if (pagination.existPrevPage) {
                    html += `
                        <a href="javascript:void(0);" onclick="movePage(1)" class="page_bt first">첫 페이지</a>
                        <a href="javascript:void(0);" onclick="movePage(${pagination.startPage - 1})" class="page_bt prev">이전 페이지</a>
                    `;
                }

                /*
                 * 4. 시작 페이지(startPage)와 끝 페이지(endPage) 사이의 페이지 번호(i)를 넘버링 하는 로직
                 *    페이지 번호(i)와 현재 페이지 번호(params.page)가 동일한 경우, 페이지 번호(i)를 활성화(on) 처리
                 */
                html += '<p>';
                for (let i = pagination.startPage; i <= pagination.endPage; i++) {
                    html += (i !== params.page)
                        ? `<a href="javascript:void(0);" onclick="movePage(${i});">${i}</a>`
                        : `<span class="on">${i}</span>`
                }
                html += '</p>';

                // 5. 현재 위치한 페이지 뒤에 데이터가 더 있는 경우, 다음 페이지 버튼과 끝 페이지 버튼을 HTML에 추가
                if (pagination.existNextPage) {
                    html += `
                        <a href="javascript:void(0);" onclick="movePage(${pagination.endPage + 1});" class="page_bt next">다음 페이지</a>
                        <a href="javascript:void(0);" onclick="movePage(${pagination.totalPageCount});" class="page_bt last">마지막 페이지</a>
                    `;
                }

                // 6. class가 "paging"인 요소를 찾아 HTML을 렌더링
                document.querySelector('.paging').innerHTML = html;
            }


            // 페이지 이동
            function movePage(page) {

                // 1. drawPage( )의 각 버튼에 선언된 onclick 이벤트를 통해 전달받는 page(페이지 번호)를 기준으로 객체 생성
                const queryParams = {
                    page: (page) ? page : 1,
                    recordSize: 10,
                    pageSize: 10
                }

                /*
                 * 2. location.pathname : 리스트 페이지의 URI("/post/list.do")를 의미
                 *    new URLSearchParams(queryParams).toString() : queryParams의 모든 프로퍼티(key-value)를 쿼리 스트링으로 변환
                 *    URI + 쿼리 스트링에 해당하는 주소로 이동
                 *    (해당 함수가 리턴해주는 값을 브라우저 콘솔(console)에 찍어보시면 쉽게 이해하실 수 있습니다.)
                 */
                location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
            }
        </script>
    </th:block>
    -->
</html>