
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>天气大数据分析平台后台管理系统</title>
    <jsp:include page="../common_css.jsp"/>

</head>
<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <jsp:include page="../top.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <jsp:include page="../left.jsp"/>
        <!-- partial -->
        <div class="main-panel" >
            <div class="row">
                <div class="col-md-12 stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-title">近十年西藏天气数据管理</p>
                            <div class="table-responsive">
                                <%--                                <input type="button" value="添加" onclick="window.location.href='add.jsp'">--%>
                                <%--                                &nbsp;&nbsp;&nbsp;编号：<input type="text" id="code" value="${pageInfo.search1}">--%>
                                <%--                                &nbsp;&nbsp;&nbsp;姓名：<input type="text" id="name" value="${pageInfo.search2}">--%>
                                <%--                                &nbsp;&nbsp;&nbsp;<input type="button" onclick="doSearch(1)" value="查询">--%>
                                <table id="recent-purchases-listing" class="table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>数</th>
                                        <th>日期</th>
                                        <th>最高温</th>
                                        <th>最低温</th>
                                        <th>天气</th>
                                        <th>风力风向</th>
                                        <th>空气质量</th>
                                        <%--                    <th>操作</th>--%>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${pageInfo.list}">
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>${item.id}</td>
                                            <td>${item.date}</td>
                                            <td>${item.max}</td>
                                            <td>${item.min}</td>
                                            <td>
                                                    ${item.type}
                                            </td>
                                            <td>${item.windpower}</td>
                                            <td>${item.point}</td>
                                                <%--                      <td>--%>

                                                <%--                        <a href="/admin/fang/openEdit/${item.id}" >编辑</a>--%>
                                                <%--                        <a href="#" onclick="if (confirm('确认要删除选中的记录吗？')){window.location.href='/admin/fang/delete/${item.id}'}">删除</a>--%>
                                                <%--                      </td>--%>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                                <jsp:include page="../page.jsp"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="../footer.jsp"/>
    </div>
    <!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<jsp:include page="../common_js.jsp"/>
</body>

</html>

<script>
    function doSearch(pageNum) {
        var code=$("#code").val();
        var name=$("#name").val();
        window.location.href="/admin/fang/list_xz?pageNum="+pageNum+"&code="+code+"&name="+name;
    }
</script>
