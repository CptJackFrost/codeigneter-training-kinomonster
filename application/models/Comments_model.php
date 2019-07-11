<?php 
	
	class Comments_model extends CI_model {
		public function __construct() {
			$this->load->database();
		}
		
		public function getComments($movie_id, $limit){
			$query = $this->db
				->where('movie_id', $movie_id)
				->limit($limit)
				->get('comments');
				
			return $query->result_array();
		}
		
		public function addComments($user_id, $movie_id, $comments_text){
			$data = array(
				'user_id' => $user_id,
				'movie_id' => $movie_id,
				'comments_text' => $comments_text
			);
			return $this->db->insert('comments', $data);
		}
		
	}