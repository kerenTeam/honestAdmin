<?php 
/* 用户模型 */

class member_model extends CI_Model
{
    //返回用户详情
    function userinfo($where,$data){
        $query = $this->db->where($where,$data)->get('h_user_member');
        return $query->row_array();
    }


}








?>