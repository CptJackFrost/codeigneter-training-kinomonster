<form action="/movies/create/" method="post">
	<p><input type="radio" name="category_id" value="1"> Фильм</p><br>
	<p><input type="radio" name="category_id" value="2"> Сериал</p><br>
	<input class="form-control input-lg" type="input" name="slug" placeholder="slug"><br>
	<input class="form-control input-lg" type="input" name="name" placeholder="название фильма"><br>
	<input class="form-control input-lg" type="input" name="year" placeholder="год выхода"><br>
	<input class="form-control input-lg" type="input" name="poster" placeholder="ссылка на постер"><br>
	<input class="form-control input-lg" type="input" name="director" placeholder="режиссер"><br>
	<input class="form-control input-lg" type="input" name="rating" placeholder="рейтинг" value="0"><br>
	<input class="form-control input-lg" type="input" name="player_code" placeholder="видео"><br>
	<textarea class="form-control input-lg" name="descriptions" placeholder="описание фильма"></textarea><br>
	<input class="btn btn-default" type="submit" name="submit" value="Добавить фильм">
	
</form>