<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<span class="page_info"> 总记录数：${pageInfo.total},总页数：${pageInfo.pageTotal} &nbsp;&nbsp;&nbsp;&nbsp;
    当前页：${pageInfo.pageNum}</span>
<nav aria-label="Page navigation example">
    <ul class="pagination">
        <c:if test="${pageInfo.pageNum>1}">
            <li class="page-item"><a class="page-link" onclick="doSearch(${pageInfo.pageNum-1})">上一页</a></li>
        </c:if>
        <c:forEach begin="1" end="${pageInfo.pageTotal}" var="num">
            <c:if test="${num==pageInfo.pageNum}">
                <li class="page-item"><a class="page-link" href="javascript:void(0);"> ${num}</a></li>
            </c:if>
            <c:if test="${num!=pageInfo.pageNum}">
                <li class="page-item"><a class="page-link" onclick="doSearch(${num})">${num}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${pageInfo.pageNum<pageInfo.pageTotal}">
            <li class="page-item"><a class="page-link" onclick="doSearch(${pageInfo.pageNum+1})">下一页</a></li>
        </c:if>

    </ul>
</nav>
