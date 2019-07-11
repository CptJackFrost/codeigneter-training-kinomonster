<h1><?php echo $title; ?></h1>
  <hr>

  <div class="embed-responsive embed-responsive-16by9">
	<iframe class="embed-responsive-item" src="<?php echo $player; ?>" frameborder="0" allowfullscreen></iframe>
  </div>
  <div class="well info-block text-center">
	Год: <span class="badge"><?php echo $year; ?></span>
	Рейтинг: <span class="badge"><?php echo $rating; ?></span>
	Режиссер: <span class="badge"><?php echo $director; ?></span>
  </div>

  <div class="margin-8"></div>

  <h2>Описание <?php echo $title; ?></h2>
  <hr>

  <div class="well">
	<?php echo $descriptions_movie; ?>
  </div>

  <div class="margin-8"></div>

  <h2>Отзывы об <?php echo $title; ?></h2>
  <hr>
  
 <?php foreach($comments as $key => $value): ?>

   <div class="panel panel-info">
	 <div class="panel-heading"><i class="glyphicon glyphicon-user"></i> <span><?php echo getUserNameById($value['user_id'])->username; ?></span> </div>
	 <div class="panel-body">
	   <?php echo $value['comments_text']; ?>
	 </div>
   </div>
  
  <?php endforeach ?>

  <?php if($this->dx_auth->is_logged_in()): ?>
  <form method="post">
	<div class="form-group">
	  <textarea class="form-control" name="commentary"></textarea>
	</div>
	<button class="btn btn-lg btn-warning pull-right">отправить</button>	
  </form>
  <?php else: ?>
  Только зарегистрированные пользователи могут оставлять комментарии
  <?php endif ?>