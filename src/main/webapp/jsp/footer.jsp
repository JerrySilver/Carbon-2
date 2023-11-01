<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!-- content-wrapper ends -->
<!-- partial:partials/_footer.html -->
<%--            <footer class="footer">--%>
<%--                <div class="d-sm-flex justify-content-center justify-content-sm-between">--%>
<%--                    <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>--%>
<%--                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard template</a> from Bootstrapdash.com</span>--%>
<%--                </div>--%>
<%--            </footer>--%>
<!-- partial -->
<script>
    function doSearch(pageNum) {
        var code=$("#code").val();
        var name=$("#name").val();
        window.location.href="/admin/fang/list_heb?pageNum="+pageNum+"&code="+code+"&name="+name;
    }

    function transBj() {
        $.ajax({
            type: "GET", // 使用GET方法获取内容
            url: "/admin/fang/list_bj",
            success: function (response) {
                // 将新内容插入到内容容器中
                setTimeout(window.location.href="/admin/fang/list_bj",1000);
            },
            error: function (xhr, status, error) {
                // 处理错误
                console.error("Error loading new content:", error);
            }
        });
    }

    function transCd() {
        $.ajax({
            type: "GET", // 使用GET方法获取内容
            url: "/admin/fang/list",
            success: function (response) {
                // 将新内容插入到内容容器中
                setTimeout(window.location.href="/admin/fang/list",1000);
            },
            error: function (xhr, status, error) {
                // 处理错误
                console.error("Error loading new content:", error);
            }
        });
    }
    function transHeb() {
        $.ajax({
            type: "GET", // 使用GET方法获取内容
            url: "/admin/fang/list_heb",
            success: function (response) {
                // 将新内容插入到内容容器中
                setTimeout(window.location.href="/admin/fang/list_heb",1000);
            },
            error: function (xhr, status, error) {
                // 处理错误
                console.error("Error loading new content:", error);
            }
        });
    }

    function transXz() {
        $.ajax({
            type: "GET", // 使用GET方法获取内容
            url: "/admin/fang/list_xz",
            success: function (response) {
                // 将新内容插入到内容容器中
                setTimeout(window.location.href="/admin/fang/list_xz",1000);
            },
            error: function (xhr, status, error) {
                // 处理错误
                console.error("Error loading new content:", error);
            }
        });
    }

    function transTlf() {
        $.ajax({
            type: "GET", // 使用GET方法获取内容
            url: "/admin/fang/list_tlf",
            success: function (response) {
                // 将新内容插入到内容容器中
                setTimeout(window.location.href="/admin/fang/list_tlf",1000);
            },
            error: function (xhr, status, error) {
                // 处理错误
                console.error("Error loading new content:", error);
            }
        });
    }

</script>