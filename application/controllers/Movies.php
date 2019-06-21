<?php

	defined('BASEPATH') or exit('no direct script access allowed');
	
	class Movies extends MY_Controller {
		
		public function __construct() {
			parent::__construct();
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
		&& $this->input->post('rating')
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
		
	}