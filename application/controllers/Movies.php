<?php

	defined('BASEPATH') or exit('no direct script access allowed');
	
	class Movies extends MY_Controller {
		
		public function __construct() {
			parent::__construct();
		}
		
		public function index(){
			$this->data['title'] = "Все фильмы";
			$this->data['movie_data'] = $this->films_model->getAllFilms();
			
			$this->load->view('templates/header', $this->data);
			$this->load->view('movies/index', $this->data);
			$this->load->view('templates/footer');
		}
	
		public function view($slug = null){
			
			$movie_slug = $this->films_model->getFilms($slug, false, false);
			
			if(empty($movie_slug)){
				show_404();
			}
			

			$this->data['title'] = $movie_slug['name'];
			$this->data['year'] = $movie_slug['year'];
			$this->data['rating'] = $movie_slug['rating'];
			$this->data['director'] = $movie_slug['director'];
			$this->data['player'] = $movie_slug['player_code'];
			$this->data['descriptions_movie'] = $movie_slug['descriptions'];
			
			//вывод комментариев
			$this->load->model('comments_model');
			$this->data['comments'] = $this->comments_model->getComments($movie_slug['id'], 100);
			
			//данные для нового комментария
			if($this->input->post('commentary')){
				$comments_text = $this->input->post('commentary');
				$user_id = $this->dx_auth->get_user_id();
				$movie_id = $movie_slug['id'];			
				if($this->comments_model->addComments($user_id, $movie_id, $comments_text)){
					redirect($this->uri->uri_string());
				}
			}			
			
			
			$this->load->view('templates/header', $this->data);
			$this->load->view('movies/view', $this->data);
			$this->load->view('templates/footer');
			
		}
		
		public function type($slug = null) {
			
			$this->load->library('pagination');
			
			$this->data['movie_data'] = null;
			
			$offset = (int)$this->uri->segment(4);
			
			$row_count = 2;
			
			$count = 0;
			
			
			if($slug == 'films'){
				$count = count($this->films_model->getFilms(0, 1));
				$p_config['base_url'] = '/movies/type/films/';
				$this->data['title'] = 'Фильмы';
				$this->data['movie_data'] = $this->films_model->getMoviesOnPage($row_count, $offset, 1);
			}
			
			if($slug == 'serials'){
				$count = count($this->films_model->getFilms(0, 2));
				$p_config['base_url'] = '/movies/type/serials/';
				$this->data['title'] = 'Сериалы';
				$this->data['movie_data'] = $this->films_model->getMoviesOnPage($row_count, $offset, 2);
			}
			
			if($this->data['movie_data'] === null){
				show_404();
			}
			
			//pagination config
			
			$p_config['total_rows'] = $count;
			$p_config['per_page'] = $row_count;
			
			$p_config['full_tag_open'] = "<ul class='pagination'>";
			$p_config['full_tag_close'] ="</ul>";
			$p_config['num_tag_open'] = '<li>';
			$p_config['num_tag_close'] = '</li>';
			$p_config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
			$p_config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
			$p_config['next_tag_open'] = "<li>";
			$p_config['next_tagl_close'] = "</li>";
			$p_config['prev_tag_open'] = "<li>";
			$p_config['prev_tagl_close'] = "</li>";
			$p_config['first_tag_open'] = "<li>";
			$p_config['first_tagl_close'] = "</li>";
			$p_config['last_tag_open'] = "<li>";
			$p_config['last_tagl_close'] = "</li>";
			
			//init pagination
			
			$this->pagination->initialize($p_config);
			$this->data['pagination'] = $this->pagination->create_links();
			
			$this->load->view('templates/header', $this->data);
			$this->load->view('movies/type', $this->data);
			$this->load->view('templates/footer');
			
			
		}
		
		public function create() {
		
		if(!$this->dx_auth->is_admin()){
			show_404();
			//redirect('/', location);
		}
		
		$this->data['title'] = "Добавить фильм";
		
		if($this->input->post('slug') 
		&& $this->input->post('name') 
		&& $this->input->post('descriptions')
		&& $this->input->post('year')
		//&& $this->input->post('rating')
		&& $this->input->post('director')
		&& $this->input->post('poster')
		&& $this->input->post('player_code')
		&& $this->input->post('category_id')) {
			
			$slug = $this->input->post('slug');
			$name = $this->input->post('name');
			$descriptions = $this->input->post('descriptions');
			$year = $this->input->post('year');
			$rating = $this->input->post('rating');
			$director = $this->input->post('director');
			$poster = $this->input->post('poster');
			$player_code = $this->input->post('player_code');
			$category_id = $this->input->post('category_id');
			
			if ($this->films_model->addFilm($slug, $name, $descriptions, $director, $year, $rating, $poster, $player_code, $category_id)) {
				$this->load->view('templates/header', $this->data);
				$this->load->view('movies/success', $this->data);
				$this->load->view('templates/footer');
			}
		}
		
			else {
				$this->load->view('templates/header', $this->data);
				$this->load->view('movies/create', $this->data);
				$this->load->view('templates/footer');
			}
		}
		
		public function edit($slug = NULL) {
			
		if(!$this->dx_auth->is_admin()){
		show_404();
		//redirect('/', location);
		}
			
		$this->data['title'] = "Редактировать фильм";
		$this->data['movie_item'] = $this->films_model->getAllFilms($slug);
		
		if (empty($this->data['movie_item']) && $slug !== null) {
			show_404();
		}
		
		$this->data['film_slug'] = $this->data['movie_item']['slug'];
		$this->data['film_name'] = $this->data['movie_item']['name'];
		$this->data['film_descriptions'] = $this->data['movie_item']['descriptions'];
		$this->data['film_year'] = $this->data['movie_item']['year'];
		$this->data['film_rating'] = $this->data['movie_item']['rating'];
		$this->data['film_director'] = $this->data['movie_item']['director'];
		$this->data['film_poster'] = $this->data['movie_item']['poster'];
		$this->data['film_player'] = $this->data['movie_item']['player_code'];
		$this->data['film_category_id'] = $this->data['movie_item']['category_id'];
		
		if($this->input->post('slug') 
		&& $this->input->post('name') 
		&& $this->input->post('descriptions')
		&& $this->input->post('year')
		//&& $this->input->post('rating')
		&& $this->input->post('director')
		&& $this->input->post('poster')
		&& $this->input->post('player_code')
		&& $this->input->post('category_id')) {
			
			$slug = $this->input->post('slug');
			$name = $this->input->post('name');
			$descriptions = $this->input->post('descriptions');
			$year = $this->input->post('year');
			$rating = $this->input->post('rating');
			$director = $this->input->post('director');
			$poster = $this->input->post('poster');
			$player_code = $this->input->post('player_code');
			$category_id = $this->input->post('category_id');
			
			if ($this->films_model->updateFilm($slug, $name, $descriptions, $director, $year, $rating, $poster, $player_code, $category_id)) {
				echo "Страница фильма отредактирована";
			}
		}
		
			else {
				$this->load->view('templates/header', $this->data);
				$this->load->view('movies/edit', $this->data);
				$this->load->view('templates/footer');
			}		
		}
		
		public function delete($slug = null){
			if(!$this->dx_auth->is_admin()){
				show_404();
				//redirect('/', location);
			}
			
			$this->data['movie_delete'] = $this->films_model->getAllFilms($slug);
			
			if (empty($this->data['movie_delete'])) {
				show_404();
			}
			
			$this->data['title'] = "удалить фильм";
			$this->data['result'] = "ошибка удаления ".$this->data['movie_delete']['name'];
		
			if ($this->films_model->deleteFilm($slug)) {
				$this->data['result'] = $this->data['movie_delete']['name']." успешно удален";
				$slug = null;
			}
		
			$this->load->view('templates/header', $this->data);
			$this->load->view('movies/delete', $this->data);
			$this->load->view('templates/footer');
		
		}
		
	}