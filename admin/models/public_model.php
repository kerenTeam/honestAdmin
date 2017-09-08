<?php 
/* 
*   公用model
 */
class public_model extends CI_Model
{
    //查询
    function select($table,$sort){
        $query = $this->db->order_by($sort,'desc')->get($table);
        return $query->result_array();
    }
    //分页查询
    function select_page($table,$page,$size,$sort){
        $query = $this->db->order_by($sort,'desc')->limit($size,$page)->get($table);
        return $query->result_array();
    }

    //新增
    function insert($table,$data){
        return $this->db->insert($table,$data);
    }

    //编辑
    function updata($table,$where,$id,$data){
        return $this->db->where($where,$id)->update($table,$data);
    }
    //删除
    function delete($table,$where,$id){
        return $this->db->where($where,$id)->delete($table);
    }

    //查询详情
    function select_info($table,$where,$id){
        $query = $this->db->where($where,$id)->get($table);
        return $query->row_array();
    }


    //根据某些条件查询数据
    function select_where($table,$where,$data,$sort){
        $query = $this->db->where($where,$data)->order_by($sort,'desc')->get($table);
        return $query->result_array();
    }

    //返回不等于的条件
    function select_where_no($table,$data,$sort){
          $query = $this->db->where('gid !=',$data)->order_by($sort,'desc')->get($table);
        return $query->result_array();
    }

    //带条件的分页查询
    function select_page_where($table,$where,$data,$page,$size,$sort){
        $query = $this->db->where($where,$data)->order_by($sort,'desc')->limit($size,$page)->get($table);
        return $query->result_array();
    }

    
    //返回项目列表
    function ret_select_project($page,$size){
        $this->db->select('a.*, b.*');
        $this->db->from('h_project a');
        $this->db->join('h_contract b', 'b.contract_id = a.c_id','left');
        $query = $this->db->where('a.del_state','0')->order_by('a.addtime','desc')->limit($size,$page)->get();
        return $query->result_array(); 
    }

    //返回任务
    function select_task(){
        $this->db->select('a.*, b.title');
        $this->db->from('h_project_task a');
        $this->db->join('h_project b', 'b.id = a.project_id','left');
        $query = $this->db->where('a.state !=','0')->order_by('a.addtime','desc')->get();
        return $query->result_array(); 
    }

    //根据分页返回任务
    function select_task_page($page,$size){
        $this->db->select('a.*, b.title');
        $this->db->from('h_project_task a');
        $this->db->join('h_project b', 'b.id = a.project_id','left');
        $query = $this->db->where('a.state !=','0')->order_by('a.addtime','desc')->limit($size,$page)->get();
        return $query->result_array(); 
    }

}






?> 