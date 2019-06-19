<?php

	defined('BASEPATH') or exit('no direct script access allowed');
	
	class Main extends MY_Controller {
		
		public function __construct() {
			parent::__construct();
		}
		
		public function index() {
			$this->data['title'] = "Главная страница";
			
			$this->load->model('films_model');
			$this->data['movie'] = $this->films_model->getFilms(false, 8, 1);
			$this->data['serials'] = $this->films_model->getFilms(false, 4, 2);
			$this->data['posts'] = $this->posts_model->showPosts(false, 2);
			
			$this->load->view('templates/header', $this->data);
			$this->load->view('main/index', $this->data);
			$this->load->view('templates/footer');
		} 
		
	}