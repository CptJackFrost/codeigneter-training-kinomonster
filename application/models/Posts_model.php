<?php 

	class Posts_model extends CI_model {
		
		public function __construct(){
			$this->load->database();			
		}
		
		public function getPosts($slug = false) {
			if ($slug === false) {
				$query = $this->db->get('posts');
				return $query->result_array();
			}
			
			$query = $this->db->get_where('posts', array('slug' => $slug));
			return $query->row_array();
		}
		
		public function setPosts($slug, $title, $text) {
			
			$data = array (
				'slug' => $slug,
				'title' => $title,
				'text' => $text
			);
			
			return $this->db->insert('posts', $data);
			
		}
		
		public function updatePosts($slug, $title, $text) {
			
			$data = array (
				'slug' => $slug,
				'title' => $title,
				'text' => $text
			);
			
			return $this->db->update('posts', $data, array('slug' => $slug));
		}
		
		public function deletePosts($slug){
			
			return $this->db->delete('posts', array('slug' => $slug));
			
		}
		
		public function showPosts($slug = false, $limit){
			$query = $this->db
						->order_by('id', 'desc')
						->limit($limit)
						->get('posts');
						
			return $query->result_array();
		}
		
	}