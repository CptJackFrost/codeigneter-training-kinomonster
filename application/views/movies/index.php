<h1>Фильмы</h1>

<p><a href="movies/create">Добавить фильм</a></p>

<?php 

	foreach ($movie_data as $key => $value): ?>
	<p><a href="movies/view/<?php echo $value['slug']; ?>"><?php echo $value['name']; ?></a> | <a href="movies/edit/<?php echo $value['slug']; ?>">edit</a> </p> | <a href="movies/delete/<?php echo $value['slug']; ?>">X</a></p>
	
	

<?php endforeach   ?>
