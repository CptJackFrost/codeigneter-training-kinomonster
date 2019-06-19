<?php 
	
defined ('BASEPATH') or exit('no direc script accsess allowed');

class Posts extends MY_Controller {
	
	public function __construct() {
		parent::__construct();
		$this->load->model('posts_model');
	}
	
	public function index() {
		$this->data['title'] = 'Все посты';
		$this->data['posts'] = $this->posts_model->getPosts();
		
		$this->load->view('templates/header', $this->data);
		$this->load->view('posts/index', $this->data);
		$this->load->view('templates/footer');
	}
	
	public function view($slug = null) {
		$this->data['posts_item'] = $this->posts_model->getPosts($slug);
		if (empty($this->data['posts_item'])) {
			show_404();
		}
		
		$this->data['title'] = $this->data['posts_item']['title'];
		$this->data['content'] = $this->data['posts_item']['text'];
		
		$this->load->view('templates/header', $this->data);
		$this->load->view('posts/view', $this->data);
		$this->load->view('templates/footer');
		
	}
	
	public function create() {
		$this->data['title'] = 'Добавить пост';
		
		if ($this->input->post('slug') && $this->input->post('title') && $this->input->post('text')) {
			
			$slug = $this->input->post('slug');
			$title = $this->input->post('title');
			$text = $this->input->post('text');
			
			if ($this->posts_model->setPosts($slug, $title, $text)) {
				$this->load->view('templates/header', $this->data);
				$this->load->view('posts/success', $this->data);
				$this->load->view('templates/footer');
			}
		}
			
		else {
				$this->load->view('templates/header', $this->data);
				$this->load->view('posts/create', $this->data);
				$this->load->view('templates/footer');
			}
	}
		
	public function edit($slug = null){
		$this->data['title'] = 'Редактировать пост';
		$this->data['posts_item'] = $this->posts_model->getPosts($slug);
		
		if (empty($this->data['posts_item']) && $slug !== null) {
			show_404();
		}
		
		$this->data['title_posts'] = $this->data['posts_item']['title'];
		$this->data['content_posts'] = $this->data['posts_item']['text'];
		$this->data['slug_posts'] = $this->data['posts_item']['slug'];
		
		if ($this->input->post('slug') && $this->input->post('title') && $this->input->post('text')) {
			$slug = $this->input->post('slug');
			$title = $this->input->post('title');
			$text = $this->input->post('text');
			
			if ($this->posts_model->updatePosts($slug, $title, $text)){
				echo "пост отредактирован";
			}
			
		}
		
		$this->load->view('templates/header', $this->data);
		$this->load->view('posts/edit', $this->data);
		$this->load->view('templates/footer');
	
	}
	
	public function delete($slug = null){		
		$this->data['posts_delete'] = $this->posts_model->getPosts($slug);
		if (empty($this->data['posts_delete'])) {
			show_404();
		}
		
		$this->data['title'] = "удалить пост";
		$this->data['result'] = "ошибка удаления ".$this->data['posts_delete']['title'];
		
		if ($this->posts_model->deletePosts($slug)){
			$this->data['result'] = $this->data['posts_delete']['title']." успешно удален";
		}
		
		$this->load->view('templates/header', $this->data);
		$this->load->view('posts/delete', $this->data);
		$this->load->view('templates/footer');
		
	}
	
}

