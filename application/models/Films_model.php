<?php 
	class Films_model extends CI_model {
		public function __construct() {
			$this->load->database();
		}
		
		public function getAllFilms($slug = false) {
			
			if ($slug === false) {
				$query = $this->db->order_by('add_date', 'desc')->get('movie');
							
				return $query->result_array();
			}
			
			$query = $this->db->get_where('movie', array('slug' => $slug));
			return $query->row_array();
			
		}
		
		public function getFilms($slug = false, $limit, $type = 1) {
			
			if ($slug === false) {
				$query = $this->db
							->where('category_id', $type)
							->order_by('add_date', 'desc')
							->limit($limit)
							->get('movie');
							
				return $query->result_array();
			}
			
			$query = $this->db->get_where('movie', array('slug' => $slug));
			return $query->row_array();
			
		}
		
		public function getFilmsByRating($limit) {
			if($limit !== null) {
			$query = $this->db
				->order_by('rating', 'desc')
				->where('category_id', 1)
				->where('rating>', 0)
				->limit($limit)
				->get('movie');
			}
			$query = $this->db
				->order_by('rating', 'desc')
				->where('category_id', 1)
				->where('rating>', 0)
				->get('movie');
				
			return $query->result_array();
		}
		
		public function getMoviesOnPage($row_count, $offset, $type = 1){
			$query = $this->db
						->where('category_id', $type)
						->order_by('add_date', 'desc')
						->get('movie', $row_count, $offset);
			
			return $query->result_array();
		}
		
		public function getForRatingPage($row_count, $offset) {
			$query = $this->db
						->order_by('rating', 'desc')
						->where('category_id', 1)
						->where('rating>', 0)
						->get('movie', $row_count, $offset);
			
			return $query->result_array();
		}
		
		public function addFilm($slug, $name, $descriptions, $director, $year, $rating, $poster, $player_code, $category_id) {
			$data = array(
				'slug' => $slug,
				'name' => $name,
				'descriptions' => $descriptions,
				'director' => $director,
				'year' => $year,
				'rating' => $rating,
				'poster' => $poster,
				'player_code' => $player_code,
				'category_id' => $category_id
			);
			
			return $this->db->insert('movie', $data);
		}
		
		public function updateFilm($slug, $name, $descriptions, $director, $year, $rating, $poster, $player_code, $category_id) {
			$data = array(
				'slug' => $slug,
				'name' => $name,
				'descriptions' => $descriptions,
				'director' => $director,
				'year' => $year,
				'rating' => $rating,
				'poster' => $poster,
				'player_code' => $player_code,
				'category_id' => $category_id
			);
			
			return $this->db->update('movie', $data, array('slug' => $slug));
		}
		
		public function deleteFilm($slug){
			return $this->db->delete('movie', array('slug' => $slug));
		}
		
	}