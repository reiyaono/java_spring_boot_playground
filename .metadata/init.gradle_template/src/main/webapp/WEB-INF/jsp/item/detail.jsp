<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://unpkg.com/simpledotcss/simple.min.css">
<link rel="stylesheet" href="${ctx}/static/common.css">
<title>タイトル</title>
</head>
<body>
<header onclick="location.href='${ctx}'">
	<h1>${form.id == 0 ? '登録' : '変更'}画面</h1>
	<p>Servlet JSP CRUD サンプル</p>
</header>
<main>
	<c:if test="${request.remoteUser != null}"><%-- Servlet API の認証情報 (ShiroFilter 使用時) --%>
		<aside><p>${request.remoteUser}<br><a href="${ctx}/logout">ログアウト</a></p></aside>
	</c:if>
	<blockquote id="_message">${fn:escapeXml(MESSAGE)}</blockquote>
	<form id="_form" method="post" onsubmit="_submitButton.disabled = true"><%-- 二度押し防止 --%>
		<input type="hidden" name="id" value="${form.id}"/>
		<p>
			<label>製品名 <mark>必須</mark></label>
			<input type="text" name="name" value="${fn:escapeXml(form.name)}"
				onkeyup="validate()" required autofocus onfocus="this.setSelectionRange(99,99)" size="40">
		</p>
		<p>
			<label>発売日</label>
			<input type="date" name="releaseDate" value="${fn:escapeXml(form.releaseDate)}"
				onchange="validate()">
		</p>
		<p>
			<label>顔認証</label>
			<input type="checkbox" name="faceAuth" ${form.faceAuth ? 'checked' : ''}
				onchange="validate()">
		</p>
		<p>
			<label>メーカー</label>
			<select name="companyId">
	<c:forEach var="com" items="${form.companySelectOptions}">
				<option value="${com.id}" ${form.companyId == com.id ? 'selected' : ''}>${com.companyName}</option>
	</c:forEach>
			</select>
		</p>
		<button type="button" onclick="location.href='${lastQueryUrl == null ? 'list' : lastQueryUrl}'">戻る</button>
		<input id="_submitButton" type="submit" value=
			${form.id == 0
				? '"登録" formaction="create"' 
				: '"更新" formaction="update"'
			}/>
	</form>
</main>
<footer>
	<p>Generated by Pleiades All in One New Gradle Project Wizard</p>
</footer>
</body>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
<%-- 入力中のリアルタイム API チェック結果を文字列で取得 (form が post のため _csrf が含まれる) --%>
const validate = async() => {
	_message.textContent = (await axios.post('api', new URLSearchParams(new FormData(_form)))).data;
};
</script>
</html>
