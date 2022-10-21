## AOP用語

Advice ... AOPで実行する処理のこと
Pointcut ... 処理を実行する場所(クラスやメソッド)のこと
JoinPoint...処理を実行するタイミングのこと


## AOP実行タイミング(JoinPoint)
Before メソッドが実行される前
After メソッドが実行された後
AfterReturning メソッドが正常終了した時だけ、AOPの処理を実行します
Around メソッド実行の前後に、AOPの処理を実行します
AfterThrowing メソッドが異常終了した場合だけ、AOPの処理を実行


## @PathVariable
@PathVariableアノテーションを付けると、渡されてきたパス（URL）の値を引数の変数に入れることができます。
上記のコードでいうと、http://localhost:8080/userDetail/yamada@xxx.co.jpというURLでリクエストが来た場合、yamada@xxx.co.jpという値が引数のuserIdという変数に入れられます。


## BeanPropertyRowMapper

データベースから取得してきたカラム名と同一のフィールド名がクラスにあれば、自動でマッピングをしてくれます

ただし、自動でマッピングするためには、以下のようなカラム名とフィールド名にする必要があります。

■カラム名は単語をアンダースコアで区切る（スネークケース）例：user_id
■フィールド名は２つ目の単語から大文字にする（キャメルケース）例：String userId;
