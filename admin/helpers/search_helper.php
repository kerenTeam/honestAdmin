<?php 
//搜索客户
function search_customer($industry,$sear){
	  $CI = &get_instance();
	  $res = '';
	  if(!empty($industry) && empty($sear)){
	  	$query = $CI->db->where('industry',$industry)->where('state','1')->order_by('addtime','desc')->get('h_customer');
	  	$res = $query->result_array();
	  }else if(empty($industry) && !empty($sear)){
	  	$query = $CI->db->where('state','1')->like('title',$sear,'both')->or_like('phone1',$sear,'both')->order_by('addtime','desc')->get('h_customer');
	  	$res = $query->result_array();
	  }else if(!empty($industry) && !empty($sear)){
	  	$query = $CI->db->where('state','1')->where('industry',$industry)->like('title',$sear,'both')->or_like('phone1',$sear,'both')->order_by('addtime','desc')->get('h_customer');
	  	$res = $query->result_array();
	  }else if(empty($industry) && empty($sear)){
	  	$query = $CI->db->where('state','1')->order_by('addtime','desc')->get('h_customer');
	  	$res = $query->result_array();
	  }
	  return $res; 
}
function search_customer_page($industry,$sear,$size,$page){
	  $CI = &get_instance();
	  $res = '';
	  if(!empty($industry) && empty($sear)){
	  	$query = $CI->db->where('industry',$industry)->where('state','1')->order_by('addtime','desc')->limit($size,$page)->get('h_customer');
	  	$res = $query->result_array();
	  }else if(empty($industry) && !empty($sear)){
	  	$query = $CI->db->where('state','1')->like('title',$sear,'both')->or_like('phone1',$sear,'both')->order_by('addtime','desc')->limit($size,$page)->get('h_customer');
	  	$res = $query->result_array();
	  }else if(!empty($industry) && !empty($sear)){
	  	$query = $CI->db->where('state','1')->where('industry',$industry)->like('title',$sear,'both')->or_like('phone1',$sear,'both')->order_by('addtime','desc')->limit($size,$page)->get('h_customer');
	  	$res = $query->result_array();
	  }else if(empty($industry) && empty($sear)){
	  	$query = $CI->db->where('state','1')->order_by('addtime','desc')->limit($size,$page)->get('h_customer');
	  	$res = $query->result_array();
	  }
	  return $res; 
}


//职员搜索
function search_member($gid,$sear){
	 $CI = &get_instance();
	 $res = '';
	 if(!empty($gid) && empty($sear)){
	 	$query = $CI->db->where('gid',$gid)->order_by('addtime','desc')->get('h_user_member');
	 	$res = $query->result_array();
	 }elseif(empty($gid) && !empty($sear)){
	 	$query = $CI->db->like('username',$sear,"both")->order_by('addtime','desc')->get('h_user_member');
	 	$res = $query->result_array();
	 }elseif(!empty($gid) && !empty($sear)){
	 	$query = $CI->db->where('gid',$gid)->like('username',$sear,"both")->order_by('addtime','desc')->get('h_user_member');
	 	$res = $query->result_array();

	 }elseif(empty($gid) && empty($sear)){
	 	$query = $CI->db->order_by('addtime','desc')->get('h_user_member');
	 	$res = $query->result_array();
	 }
	 return $res;
}
function search_member_page($gid,$sear,$size,$page){
	 $CI = &get_instance();
	 $res = '';
	 if(!empty($gid) && empty($sear)){
	 	$query = $CI->db->where('gid',$gid)->order_by('addtime','desc')->limit($size,$page)->get('h_user_member');
	 	$res = $query->result_array();
	 }elseif(empty($gid) && !empty($sear)){
	 	$query = $CI->db->like('username',$sear,"both")->order_by('addtime','desc')->limit($size,$page)->get('h_user_member');
	 	$res = $query->result_array();
	 }elseif(!empty($gid) && !empty($sear)){
	 	$query = $CI->db->where('gid',$gid)->like('username',$sear,"both")->order_by('addtime','desc')->limit($size,$page)->get('h_user_member');
	 	$res = $query->result_array();

	 }elseif(empty($gid) && empty($sear)){
	 	$query = $CI->db->order_by('addtime','desc')->limit($size,$page)->get('h_user_member');
	 	$res = $query->result_array();
	 }
	 return $res;
}

//搜索合同
function search_contract($sear){
	$CI = &get_instance();
	$res = '';
	$query = $CI->db->where('del_state','0')->like('contract_number',$sear,'both')->or_like('title',$sear,'both')->or_like('contract_price',$sear)->order_by('addtime','desc')->get('h_contract');
	$res = $query->result_array();
	return $res;
}
function search_contract_page($sear,$size,$page){
	$CI = &get_instance();
	$res = '';
	$query = $CI->db->where('del_state','0')->like('contract_number',$sear,'both')->or_like('title',$sear,'both')->or_like('contract_price',$sear)->order_by('addtime','desc')->limit($size,$page)->get('h_contract');
	$res = $query->result_array();
	return $res;
}

//项目搜索
function search_project($sear){
	$CI = &get_instance();
	 $CI->db->select('a.*, b.*');
        $CI->db->from('h_project a');
        $CI->db->join('h_contract b', 'b.contract_id = a.c_id','left');
        $query = $CI->db->where('a.del_state','0')->like('a.c_number',$sear,'both')->or_like('a.title',$sear,'both')->order_by('a.addtime','desc')->get();
	//$query = $CI->db->where('del_state','0')->like('c_number',$sear,'both')->or_like('title',$sear,'both')->order_by('addtime','desc')->get('h_project');
	$res = $query->result_array();
	return $res;
}

function search_project_page($sear,$size,$page){
	$CI = &get_instance();
	 $CI->db->select('a.*, b.*');
     $CI->db->from('h_project a');
     $CI->db->join('h_contract b', 'b.contract_id = a.c_id','left');
     $query = $CI->db->where('a.del_state','0')->like('a.c_number',$sear,'both')->or_like('a.title',$sear,'both')->order_by('a.addtime','desc')->limit($size,$page)->get();
	// $query = $CI->db->where('del_state','0')->like('c_number',$sear,'both')->or_like('title',$sear,'both')->order_by('addtime','desc')->limit($size,$page)->get('h_project');
	$res = $query->result_array();
	return $res;
	
}


//任务搜索
function search_task($sear,$state){
	$CI = &get_instance();
	$res= '';
	if(!empty($sear) && empty($state)){
	  $CI->db->select('a.*, b.title');
      $CI->db->from('h_project_task a');
      $CI->db->join('h_project b', 'b.id = a.project_id','left');
      $query = $CI->db->where('a.state !=','0')->like('contract_number',$sear,'both')->order_by('a.addtime','desc')->get();
      $res = $query->result_array();

	}else if(empty($sear) && !empty($state)){
		if($state == '2'){
			$s = '0';
		}else{
			$s = '1';
		}
	  $CI->db->select('a.*, b.title');
      $CI->db->from('h_project_task a');
      $CI->db->join('h_project b', 'b.id = a.project_id','left');
      $query = $CI->db->where('a.state !=','0')->where('a.task_status',$s)->order_by('a.addtime','desc')->get();
      $res = $query->result_array();
	}else if(!empty($sear) && !empty($state)){
		if($state == '2'){
			$s = '0';
		}else{
			$s = '1';
		}
	  $CI->db->select('a.*, b.title');
      $CI->db->from('h_project_task a');
      $CI->db->join('h_project b', 'b.id = a.project_id','left');
      $query = $CI->db->where('a.state !=','0')->like('contract_number',$sear,'both')->where('a.task_status',$s)->order_by('a.addtime','desc')->get();
      $res = $query->result_array();
	}else if(empty($sear) && empty($state)){
	  $CI->db->select('a.*, b.title');
      $CI->db->from('h_project_task a');
      $CI->db->join('h_project b', 'b.id = a.project_id','left');
      $query = $CI->db->where('a.state !=','0')->order_by('a.addtime','desc')->get();
      $res = $query->result_array();
	}
	return $res; 
}
function search_task_page($sear,$state,$size,$page){
	$CI = &get_instance();
	$res= '';
	if(!empty($sear) && empty($state)){
	  $CI->db->select('a.*, b.title');
      $CI->db->from('h_project_task a');
      $CI->db->join('h_project b', 'b.id = a.project_id','left');
      $query = $CI->db->where('a.state !=','0')->like('contract_number',$sear,'both')->order_by('a.addtime','desc')->limit($size,$page)->get();
      $res = $query->result_array();

	}else if(empty($sear) && !empty($state)){
		if($state == '2'){
			$s = '0';
		}else{
			$s = '1';
		}
	  $CI->db->select('a.*, b.title');
      $CI->db->from('h_project_task a');
      $CI->db->join('h_project b', 'b.id = a.project_id','left');
      $query = $CI->db->where('a.state !=','0')->where('task_status',$s)->order_by('a.addtime','desc')->limit($size,$page)->get();
      $res = $query->result_array();
	}else if(!empty($sear) && !empty($state)){
		if($state == '2'){
			$s = '0';
		}else{
			$s = '1';
		}
	  $CI->db->select('a.*, b.title');
      $CI->db->from('h_project_task a');
      $CI->db->join('h_project b', 'b.id = a.project_id','left');
      $query = $CI->db->where('a.state !=','0')->like('contract_number',$sear,'both')->where('task_status',$s)->order_by('a.addtime','desc')->limit($size,$page)->get();
      $res = $query->result_array();
	}else if(empty($sear) && empty($state)){
	  $CI->db->select('a.*, b.title');
      $CI->db->from('h_project_task a');
      $CI->db->join('h_project b', 'b.id = a.project_id','left');
      $query = $CI->db->where('a.state !=','0')->order_by('a.addtime','desc')->limit($size,$page)->get();
      $res = $query->result_array();
	}
	return $res; 
}

 ?>