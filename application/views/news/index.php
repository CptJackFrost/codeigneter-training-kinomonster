<h1>Все новости</h1>

<p><a href="news/create">Добавить новость</a></p>

<?php 

	foreach ($news as $key => $value): ?>
	<p><a href="news/view/<?php echo $value['slug']; ?>"><?php echo $value['title']; ?></a> | <a href="news/edit/<?php echo $value['slug']; ?>">edit</a> </p> | <a href="news/delete/<?php echo $value['slug']; ?>">X</a></p>

<?php endforeach   ?>