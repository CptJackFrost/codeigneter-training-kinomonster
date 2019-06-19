<!-- CONTENT (index) start -->

          <h2>Новые фильмы</h2>
          <hr>
          <div class="row">

			
			<?php foreach ($movie as $key => $value): ?>			
				<div class="films_block col-lg-3 col-md-3 col-sm-3 col-xs-6">
				  <a href="/movies/view/<?php echo $value['slug']; ?>"><img src="<?php echo $value['poster']; ?>" alt="<?php echo $value['name']; ?>"></a> 
				  <div class="film_label"><a href="show.html"><?php echo $value['name']; ?></a></div>
				</div>			
			<?php endforeach ?>


          </div>

          <div class="margin-8"></div>

         <h2>Новые сериалы</h2>
         <hr>
          <div class="row">

            <?php foreach ($serials as $key => $value): ?>			
				<div class="films_block col-lg-3 col-md-3 col-sm-3 col-xs-6">
				  <a href="/movies/view/<?php echo $value['slug']; ?>"><img src="<?php echo $value['poster']; ?>" alt="<?php echo $value['name']; ?>"></a> 
				  <div class="film_label"><a href="show.html"><?php echo $value['name']; ?></a></div>
				</div>			
			<?php endforeach ?>


          </div>

          <div class="margin-8"></div>

        		<?php foreach ($posts as $key => $value): ?>	
		
		<div class="margin-8"></div>
          <a href="/posts/view/<?php echo $value['slug']; ?>"><h3><?php echo $value['title']; ?></h3></a>
          <hr>
          <p>
            <?php echo $value['text']; ?>
          </p>
          <a href="/posts/view/<?php echo $value['slug']; ?>" class="btn btn-warning pull-right">читать</a>
		  
		  <?php endforeach ?>

          <div class="margin-8 clear"></div>

          <!-- CONTENT (index) end -->