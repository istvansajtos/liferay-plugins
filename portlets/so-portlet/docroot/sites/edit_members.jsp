<%
/**
 * Copyright (c) 2008-2010 Liferay, Inc. All rights reserved.
 *
 * This file is part of Liferay Social Office. Liferay Social Office is free
 * software: you can redistribute it and/or modify it under the terms of the GNU
 * Affero General Public License as published by the Free Software Foundation,
 * either version 3 of the License, or (at your option) any later version.
 *
 * Liferay Social Office is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License
 * for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Liferay Social Office. If not, see http://www.gnu.org/licenses/agpl-3.0.html.
 */
%>

<%@ include file="/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");

long groupId = ParamUtil.getLong(request, "groupId");
%>

<liferay-ui:search-container>
	<liferay-ui:search-container-results
		results="<%= UserLocalServiceUtil.getGroupUsers(groupId) %>"
		total="<%= UserLocalServiceUtil.getGroupUsersCount(groupId) %>"
	/>

	<liferay-ui:search-container-row
		className="com.liferay.portal.model.User"
		keyProperty="userId"
		modelVar="curUser"
	>
		<liferay-ui:search-container-column-text
			name="user"
			value="<%= curUser.getFullName() %>"
		/>

		<liferay-ui:search-container-column-text
			name="screenname"
			value="<%= curUser.getScreenName() %>"
		/>

		<liferay-ui:search-container-column-text
			name="email"
			value="<%= curUser.getEmailAddress() %>"
		/>

		<liferay-ui:search-container-column-jsp
			align="right"
			path="/sites/user_action.jsp"
		/>
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<br />

<aui:button onClick="<%= redirect %>" value="back" />