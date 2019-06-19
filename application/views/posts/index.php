<h1>Все посты</h1>

<p><a href="posts/create">Добавить пост</a></p>

<?php 

	foreach ($posts as $key => $value): ?>
	<p><a href="posts/view/<?php echo $value['slug']; ?>"><?php echo $value['title']; ?></a> | <a href="posts/edit/<?php echo $value['slug']; ?>">edit</a> </p> | <a href="posts/delete/<?php echo $value['slug']; ?>">X</a></p>

<?php endforeach   ?>