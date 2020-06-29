<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<!-- Sidebar -->
<div class="bg-light border-right" id="sidebar-wrapper">
	<div class="sidebar-heading">Quản Lý Cây Xanh</div>
	<div class="list-group list-group-flush">
		<c:choose>
			<%-- Khi user la nhan vien --%>
			<c:when test="${USERMODEL.role.code=='ADMIN'}">
				<a href="<c:url value='/admin-home'/>"
					class="list-group-item list-group-item-action bg-light">Bản đồ</a>
			</c:when>

			<%-- Khi user la quan ly --%>
			<c:when test="${USERMODEL.role.code=='USER'}">
				<a href="<c:url value='/home'/>"
					class="list-group-item list-group-item-action bg-light">Bản đồ</a>
			</c:when>

			<%-- Các trường hợp khác --%>
			<c:otherwise>
				<a href="<c:url value='/home'/>"
					class="list-group-item list-group-item-action bg-light">Bản đồ</a>
			</c:otherwise>
		</c:choose>
		<a href="<c:url value='/list-tree'/>"
			class="list-group-item list-group-item-action bg-light">Danh sách
			cây</a>
		<c:if test="${not empty USERMODEL && USERMODEL.status==1}">
			<c:choose>
				<%-- Khi user la quan ly --%>
				<c:when test="${USERMODEL.role.code=='ADMIN'}">
					<a href="#" class="list-group-item list-group-item-action bg-light">Công
						việc</a>
					<a href="<c:url value='/admin-menu-charts'/>"
						class="list-group-item list-group-item-action bg-light"> Thống
						kê</a>
					<a href="<c:url value='/admin-menu-charts'/>"
						class="list-group-item list-group-item-action bg-light"> ${USERMODEL.role.code}</a>
				</c:when>

				<%-- Khi user la nhan vien--%>
				<c:when test="${USERMODEL.role.code=='USER'}">
					<a href="#" class="list-group-item list-group-item-action bg-light">Công
						việc</a>
					<a href="#" class="list-group-item list-group-item-action bg-light">CCCC</a>
				</c:when>

				<%-- Các trường hợp khác --%>
				<c:otherwise>
					<a href="<c:url value='/menu-charts'/>"
						class="list-group-item list-group-item-action bg-light"> Thống
						kê</a>
				</c:otherwise>
			</c:choose>

		</c:if>

	</div>
</div>
<!-- /#sidebar-wrapper -->
<!-- Menu Toggle Script -->
<script>
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
</script>