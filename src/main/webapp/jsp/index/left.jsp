<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="/admin/info">
                <i class="mdi mdi-home menu-icon"></i>
                <span class="menu-title">个人信息设置</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="/admin/fang/list" aria-expanded="false" aria-controls="ui-basic">
                <i class="mdi mdi-circle-outline menu-icon"></i>
                <span class="menu-title">近十年天气数据管理</span>
                <i class="menu-arrow"></i>
            </a>
        </li>
        <%--        <li class="nav-item">--%>
        <%--            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">--%>
        <%--                <i class="mdi mdi-circle-outline menu-icon"></i>--%>
        <%--                <span class="menu-title">各个城市气温数据可视化</span>--%>
        <%--                <i class="menu-arrow"></i>--%>
        <%--            </a>--%>
        <%--            <div class="collapse" id="ui-basic">--%>
        <%--                <ul class="nav flex-column sub-menu">--%>
        <%--                    <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>--%>
        <%--                    <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>--%>
        <%--                </ul>--%>
        <%--            </div>--%>
        <%--        </li>--%>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui" aria-expanded="false" aria-controls="ui">
                <i class="mdi mdi-view-headline menu-icon"></i>
                <span class="menu-title">数据管理</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="transCd()">
                            <i class="mdi mdi-city menu-icon"></i>
                            <span class="menu-title">成都近十年气温数据展示</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="transBj()">
                            <i class="mdi mdi-city menu-icon"></i>
                            <span class="menu-title">北京近十年气温数据展示</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="transHeb()">
                            <i class="mdi mdi-city menu-icon"></i>
                            <span class="menu-title">哈尔滨近十年气温数据展示</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="transXz()">
                            <i class="mdi mdi-city menu-icon"></i>
                            <span class="menu-title">西藏近十年气温数据展示</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="transTlf()">
                            <i class="mdi mdi-city menu-icon"></i>
                            <span class="menu-title">吐鲁番近十年气温数据展示</span>
                        </a>
                    </li>
                </ul>
            </div>

        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <i class="mdi mdi-chart-pie menu-icon"></i>
                <span class="menu-title">图表管理</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="/jsp/index/pic.jsp">成都近十年气温变化</a></li>
                    <li class="nav-item"> <a class="nav-link" href="/jsp/index/picBJ.jsp">北京近十年气温变化</a></li>
                    <li class="nav-item"> <a class="nav-link" href="/jsp/index/picHeb.jsp">哈尔滨近十年气温变化</a></li>
                    <li class="nav-item"> <a class="nav-link" href="/jsp/index/picXz.jsp">西藏近十年气温变化</a></li>
                    <li class="nav-item"> <a class="nav-link" href="/jsp/index/picTlf.jsp">吐鲁番近十年气温变化</a></li>
                </ul>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/html/case25/index.html">
                <i class="mdi mdi-file-document-box-outline menu-icon"></i>
                <span class="menu-title">大屏展示</span>
            </a>
        </li>
    </ul>
</nav>