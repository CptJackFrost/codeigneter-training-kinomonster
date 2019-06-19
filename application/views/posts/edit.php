<form action="/posts/edit/" method="post">
	<input class="form-control input-lg" type="input" name="slug" value="<?php echo $slug_posts; ?>"  placeholder="slug"><br>
	<input class="form-control input-lg" type="input" name="title" value="<?php echo $title_posts; ?>" placeholder="название новости"><br>
	<textarea class="form-control input-lg" name="text" placeholder="текст новости"><?php echo $content_posts; ?></textarea><br>
	<input class="btn btn-default" type="submit" name="submit" value="Редактировать пост">
	
</form>