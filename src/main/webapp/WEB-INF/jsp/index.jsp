<%@ page pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/base.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>基于Redis实现排行榜Demo</title>
    <link rel="stylesheet" href="${ctxsta}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctxsta}/css/styles.min.css"/>
</head>

<body>
<div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center" style="height:107px;background-color:#aaaaaa;">基于Redis实现排行榜Demo        <a class="btn btn-primary" href="/clear">重置</a>
                </h1>

                <c:choose>
                    <c:when test="${empty dynamicList}">
                        <div class="alert alert-success" role="alert">
                            <span><strong>暂时还没有销售情况！</strong><br></span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${dynamicList}" var="item">
                            <div class="alert alert-success" role="alert">
                                <span><strong>${item.time}成功售出一台${item.phone}！</strong><br></span>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
        <div class="row" style="height:350px;">
            <div class="col-md-6">
                <h1 class="text-center">商品列表</h1>
                <ul class="list-group">
                    <c:forEach items="${phones}" var="phone">
                        <li class="list-group-item">
                            <span>${phone.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>${phone.ranking}</span>
                            <a class="btn btn-primary btn-sm" style="float: right;" href="/buy/${phone.id}">购买</a>
                        </li>
                    </c:forEach>
                    <%--<li class="list-group-item"><span>小米</span>
                        <button class="btn btn-primary btn-sm" type="button" style="float: right;">购买</button>
                    </li>
                    <li class="list-group-item"><span>华为</span>
                        <button class="btn btn-primary btn-sm" type="button" style="float: right;">购买</button>
                    </li>
                    <li class="list-group-item"><span>一加</span>
                        <button class="btn btn-primary btn-sm" type="button" style="float: right;">购买</button>
                    </li>
                    <li class="list-group-item"><span>vivo</span>
                        <button class="btn btn-primary btn-sm" type="button" style="float: right;">购买</button>
                    </li>--%>
                </ul>
            </div>
            <div class="col-md-6 col-xl-6 offset-xl-0">
                <h1 class="text-center">销量排行榜</h1>
                <ul class="list-group">
                    <c:choose>
                        <c:when test="${empty phbList}">
                            <h4 class="text-center">暂无商品上榜</h4>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${phbList}" var="item">
                                <li class="list-group-item"><span>${item.name}</span>
                                    <span style="float: right;">已售：${item.sales} 台</span>
                                </li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    <%--<li class="list-group-item"><span>小米</span> <span style="float: right;">已售：4 台</span>
                    </li>
                    <li class="list-group-item"><span>华为</span> <span style="float: right;">已售：4 台</span>
                    </li>
                    <li class="list-group-item"><span>一加</span> <span style="float: right;">已售：4 台</span>
                    </li>
                    <li class="list-group-item"><span>vivo</span> <span style="float: right;">已售：4 台</span>
                    </li>--%>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="footer-basic">
    <footer>
        <p class="copyright"><a href="https://github.com/mosiki">WeJan</a> © 2018</p>
    </footer>
</div>
<script src="${ctxsta}/js/jquery.min.js"></script>
<script src="${ctxsta}/js/bootstrap.min.js"></script>
</body>

</html>