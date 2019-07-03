<form action="/movies/edit/<?php echo $film_slug; ?>" method="post">
	<p><input type="radio" name="category_id" value="1" <?php if($film_category_id == 1){echo "checked";} ?>> Фильм</p><br>
	<p><input type="radio" name="category_id" value="2" <?php if($film_category_id == 2){echo "checked";} ?>> Сериал</p><br>
	<input class="form-control input-lg" type="input" name="slug" placeholder="slug" value ="<?php echo $film_slug; ?>"><br>
	<input class="form-control input-lg" type="input" name="name" placeholder="название фильма" value ="<?php echo $film_name; ?>"><br>
	<input class="form-control input-lg" type="input" name="year" placeholder="год выхода" value ="<?php echo $film_year; ?>"><br>
	<input class="form-control input-lg" type="input" name="poster" placeholder="ссылка на постер" value ="<?php echo $film_poster; ?>"><br>
	<input class="form-control input-lg" type="input" name="director" placeholder="режиссер" value ="<?php echo $film_director; ?>"><br>
	<input class="form-control input-lg" type="input" name="rating" placeholder="рейтинг" value ="<?php echo $film_rating; ?>"><br>
	<input class="form-control input-lg" type="input" name="player_code" placeholder="видео"  value ="<?php echo $film_player; ?>"><br>
	<textarea class="form-control input-lg" name="descriptions" placeholder="описание фильма"><?php echo $film_descriptions; ?></textarea><br>
	<input class="btn btn-default" type="submit" name="submit" value="Редактировать фильм">
	
</form>