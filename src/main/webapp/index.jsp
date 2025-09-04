<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서관 메인페이지</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            line-height: 1.4;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
        }
        
        /* 헤더 영역 */
        .header {
            border: 2px solid #333;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
        }
        .user-menu div:last-child {
        padding: 6px 10px;
        font-size: 12px;
        color: #666;
        }
        .logo {
            border: 1px solid #666;
            padding: 10px 20px;
            font-weight: bold;
            cursor: pointer;
        }
        
        .user-menu {
            display: flex;
            gap: 10px;
        }
        
        .user-menu div {
            border: 1px solid #666;
            padding: 8px 15px;
            cursor: pointer;
        }
        
        /* 검색 영역 */
        .search-section {
            border: 2px solid #333;
            padding: 30px;
            text-align: center;
            background-color: #f9f9f9;
        }
        
        .search-title {
            border: 1px solid #666;
            padding: 10px;
            margin-bottom: 20px;
            display: inline-block;
        }
        
        .search-box {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .search-input {
            border: 2px solid #333;
            padding: 12px;
            width: 400px;
        }
        
        .search-btn {
            border: 2px solid #333;
            padding: 12px 25px;
            background-color: white;
            cursor: pointer;
        }
        
        .search-options {
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        
        .search-options div {
            border: 1px solid #666;
            padding: 8px 15px;
        }
        
        /* 메인 컨텐츠 */
        .main-content {
            display: flex;
            gap: 20px;
            padding: 20px;
        }
        
        /* 왼쪽 사이드바 */
        .sidebar {
            width: 200px;
            border: 2px solid #333;
            padding: 20px;
            height: fit-content;
        }
        
        .login-section {
            margin-bottom: 20px;
        }
        
        .login-form {
            margin-top: 10px;
        }
        
        .sidebar-title {
            border: 1px solid #666;
            padding: 10px;
            margin-bottom: 15px;
            text-align: center;
            font-weight: bold;
        }
        
        .menu-item {
            border: 1px solid #666;
            padding: 10px;
            margin-bottom: 8px;
            cursor: pointer;
        }
        
        /* 중앙 콘텐츠 */
        .content {
            flex: 1;
        }
        
        .section {
            border: 2px solid #333;
            margin-bottom: 20px;
            padding: 20px;
        }
        
        .section-title {
            border: 1px solid #666;
            padding: 10px;
            margin-bottom: 15px;
            font-weight: bold;
        }
        
        .book-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
        }
        
        .book-item {
            border: 1px solid #666;
            padding: 15px;
            text-align: center;
            height: 120px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            cursor: pointer;
        }
        
        .book-item:hover {
            background-color: #f0f0f0;
        }
        
        /* 우측 사이드바 */
        .right-sidebar {
            width: 250px;
        }
        
        .widget {
            border: 2px solid #333;
            padding: 15px;
            margin-bottom: 20px;
        }
        
        .widget-title {
            border: 1px solid #666;
            padding: 8px;
            margin-bottom: 10px;
            font-weight: bold;
            text-align: center;
        }
        
        .stats-item {
            border: 1px solid #666;
            padding: 10px;
            margin-bottom: 8px;
            display: flex;
            justify-content: space-between;
        }
        
        .quick-menu-item {
            border: 1px solid #666;
            padding: 12px;
            margin-bottom: 8px;
            text-align: center;
            cursor: pointer;
        }
        
        /* 공지사항 위젯 스타일 */
        .notice-item {
            border: 1px solid #666;
            padding: 8px;
            margin-bottom: 8px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 12px;
        }
        
        .notice-item:hover {
            background-color: #f0f0f0;
        }
        
        .notice-title {
            flex: 1;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            margin-right: 5px;
        }
        
        .notice-date {
            font-size: 10px;
            color: #666;
            white-space: nowrap;
        }
        
        /* 푸터 */
        .footer {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 헤더 -->
        <div class="header">
            <div class="logo" onclick="location.href='index.jsp'">도서관 로고</div>
            <div class="user-menu">
                <%
                    // 세션에서 로그인 정보 확인
                    String loginUser = (String)session.getAttribute("loginUser");
                    if(loginUser != null) {
                %>
                    <!-- 로그인 상태 -->
                    <div onclick="location.href='member/mypage'"><%=loginUser%>님</div>
                    <div onclick="location.href='member/rentals'">내 대여현황</div>
                    <div onclick="location.href='member/logout'">로그아웃</div>
                <%
                    } else {
                %>
                    <!-- 비로그인 상태 -->
                    <div onclick="location.href='member/login'">로그인</div>
                    <div onclick="location.href='member/join.jsp'">회원가입</div>
                <%
                    }
                %>
                <div onclick="location.href='admin/adminLogin.jsp'">관리자 로그인</div>
            </div>
        </div>
        
        <!-- 성공 메시지 표시 -->
        <%
            String successMsg = (String)session.getAttribute("successMsg");
            if(successMsg != null) {
                // 메시지 표시 후 세션에서 제거 (한 번만 표시되도록)
                session.removeAttribute("successMsg");
        %>
        <div style="background-color: #d4edda; color: #155724; padding: 15px; border: 1px solid #c3e6cb; margin: 20px; text-align: center;">
            <%= successMsg %>
        </div>
        <%
            }
        %>
        
        <!-- 검색 영역 -->
        <div class="search-section">
            <div class="search-title">도서 검색</div>
            <form action="book/search" method="get">
                <div class="search-box">
                    <input type="text" name="keyword" class="search-input" placeholder="도서명, 저자, 출판사를 입력하세요">
                    <button type="submit" class="search-btn">검색</button>
                </div>
                <div class="search-options">
                    <div><input type="radio" name="searchType" value="all" checked> 전체</div>
                    <div><input type="radio" name="searchType" value="title"> 도서명</div>
                    <div><input type="radio" name="searchType" value="author"> 저자</div>
                    <div><input type="radio" name="searchType" value="publisher"> 출판사</div>
                </div>
            </form>
        </div>
        
        <!-- 메인 컨텐츠 -->
        <div class="main-content">
            <!-- 왼쪽 사이드바 -->
            <div class="sidebar">
                <!-- 로그인 영역 -->
                <%
                    if(loginUser == null) {
                %>
                <div class="login-section">
                    <div class="sidebar-title">로그인</div>
                    <form class="login-form" action="member/login" method="post">
                        <input type="text" name="userId" placeholder="아이디" style="width: 100%; padding: 8px; margin-bottom: 8px; border: 1px solid #666;" required>
                        <input type="password" name="password" placeholder="비밀번호" style="width: 100%; padding: 8px; margin-bottom: 10px; border: 1px solid #666;" required>
                        <button type="submit" style="width: 100%; padding: 10px; border: 1px solid #666; background-color: white; cursor: pointer;">로그인</button>
                    </form>
                    <div style="text-align: center; margin-top: 10px; font-size: 12px;">
                        <a href="member/join.jsp" style="text-decoration: none; color: #666;">회원가입</a> | 
                        <a href="member/findPassword.jsp" style="text-decoration: none; color: #666;">비밀번호 찾기</a>
                    </div>
                </div>
                <%
                    } else {
                %>
                <!-- 로그인 후 사용자 메뉴 -->
                <div class="login-section">
                    <div class="sidebar-title"><%=loginUser%>님 환영합니다</div>
                    <div class="menu-item" onclick="location.href='member/mypage.jsp'">개인정보 수정</div>
                    <div class="menu-item" onclick="location.href='member/myRentals.jsp'">내 대여현황</div>
                    <div class="menu-item" onclick="location.href='member/logout'">로그아웃</div>
                </div>
                <%
                    }
                %>
                
                <!-- 도서 카테고리 -->
                <div style="margin-top: 30px;">
                    <div class="sidebar-title">도서 카테고리</div>
                    <div class="menu-item" onclick="searchByCategory('소설')" style="padding-left: 25%;">소설 / 문학</div>
                    <div class="menu-item" onclick="searchByCategory('인문')" style="padding-left: 25%;">인문 / 사회</div>
                    <div class="menu-item" onclick="searchByCategory('과학')" style="padding-left: 20%;">자연과학 / 기술</div>
                    <div class="menu-item" onclick="searchByCategory('예술')" style="padding-left: 25%;">예술 / 취미</div>
                    <div class="menu-item" onclick="searchByCategory('아동')" style="padding-left: 20%;">아동 / 청소년</div>
                </div>
            </div>
            
            <!-- 중앙 콘텐츠 -->
            <div class="content">
                <!-- 인기 도서 섹션 -->
                <div class="section">
                    <div class="section-title">인기 도서</div>
                    <div class="book-grid">
                        <%
                        // 실제로는 서블릿에서 DB 데이터를 받아와야 함
                        // 임시 데이터로 처리
                        String[] popularBooks = {"Java 프로그래밍", "웹 개발 완전정복", "데이터베이스 설계", "알고리즘 기초", "HTML/CSS 기초", "JavaScript 완벽가이드", "Python 데이터분석", "AI 프로그래밍"};
                        String[] authors = {"김자바", "박웹개발", "이디비", "최알고", "홍HTML", "정자바스크립트", "이파이썬", "박AI"};
                        
                        for(int i = 0; i < popularBooks.length; i++) {
                        %>
                        <div class="book-item" onclick="location.href='book/detail?bookId=<%=i+1%>'">
                            <div>도서 이미지</div>
                            <div><%=popularBooks[i]%></div>
                            <div><%=authors[i]%></div>
                        </div>
                        <%
                        }
                        %>
                    </div>
                </div>
                
                <!-- 신간 도서 섹션 -->
                <div class="section">
                    <div class="section-title">신간 도서</div>
                    <div class="book-grid">
                        <%
                        String[] newBooks = {"Spring Boot 실전", "React 개발 가이드", "머신러닝 입문", "클라우드 컴퓨팅", "Docker & Kubernetes", "Vue.js 시작하기", "블록체인 개발", "모바일 앱 개발"};
                        String[] newAuthors = {"김스프링", "박리액트", "이머신", "최클라우드", "도커킴", "뷰개발자", "블록체인박", "모바일이"};
                        
                        for(int i = 0; i < newBooks.length; i++) {
                        %>
                        <div class="book-item" onclick="location.href='book/detail?bookId=<%=i+9%>'">
                            <div>도서 이미지</div>
                            <div><%=newBooks[i]%></div>
                            <div><%=newAuthors[i]%></div>
                        </div>
                        <%
                        }
                        %>
                    </div>
                </div>
            </div>
            
            <!-- 우측 사이드바 -->
            <div class="right-sidebar">
                <!-- 통계 정보 -->
                <div class="widget">
                    <div class="widget-title">도서관 현황</div>
                    <%
                    // 실제로는 서블릿에서 DB 통계를 가져와야 함
                    int totalBooks = 12543;
                    int availableBooks = 9821;
                    int rentedBooks = 2722;
                    int totalMembers = 1456;
                    %>
                    <div class="stats-item">
                        <span>전체 도서</span>
                        <span><%=String.format("%,d", totalBooks)%>권</span>
                    </div>
                    <div class="stats-item">
                        <span>대여 가능</span>
                        <span><%=String.format("%,d", availableBooks)%>권</span>
                    </div>
                    <div class="stats-item">
                        <span>대여 중</span>
                        <span><%=String.format("%,d", rentedBooks)%>권</span>
                    </div>
                    <div class="stats-item">
                        <span>등록 회원</span>
                        <span><%=String.format("%,d", totalMembers)%>명</span>
                    </div>
                </div>
                
                <!-- 공지사항 위젯 -->
                <div class="widget">
                    <div class="widget-title">공지사항</div>
                    <div class="notice-item" onclick="location.href='notice/noticeDetail.jsp?noticeId=1'">
                        <span class="notice-title">도서관 휴관 안내</span>
                        <span class="notice-date">09-02</span>
                    </div>
                    <div class="notice-item" onclick="location.href='notice/noticeDetail.jsp?noticeId=2'">
                        <span class="notice-title">신간 도서 입고 안내</span>
                        <span class="notice-date">09-01</span>
                    </div>
                    <div class="notice-item" onclick="location.href='notice/noticeDetail.jsp?noticeId=3'">
                        <span class="notice-title">대여 규정 변경 사항</span>
                        <span class="notice-date">08-30</span>
                    </div>
                    <div class="notice-item" onclick="location.href='notice/noticeDetail.jsp?noticeId=4'">
                        <span class="notice-title">시설 보수 공사 안내</span>
                        <span class="notice-date">08-28</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 푸터 -->
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>

    <script>
        function searchByCategory(category) {
            location.href = 'book/search?searchType=category&keyword=' + encodeURIComponent(category);
        }
    </script>
</body>
</html>