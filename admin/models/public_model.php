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
    function select_page_sort($table,$page,$size,$sort){
        $sql = "select * from h_contract where del_state ='0' order by $sort desc,completion_status desc,addtime desc limit $page,$size";
        $query = $this->db->query($sql);
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
    //多条件编辑
    function updata_where($table,$where,$id,$where1,$id1,$data){
        return $this->db->where($where,$id)->where($where1,$id1)->update($table,$data);
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

    //返回合同列表
    function contract_page_where($table,$where,$data,$page,$size,$sort){
        $query = $this->db->where($where,$data)->order_by($sort,'desc')->order_by('addtime','desc')->limit($size,$page)->get($table);
        return $query->result_array();
    }
    
    //返回项目列表
    function ret_select_project($page,$size){
        $this->db->select('a.*,b.contract_number,b.sign_user,b.sign_date');
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

    //多条件查询
    function select_where_many($table,$where,$id,$where1,$data1){
        $query = $this->db->where($where,$id)->where($where1,$data1)->get($table);
        return $query->result_array();
    }
    //多条件排序查询
    function select_where_many_sort($table,$where,$id,$where1,$data1,$sort){
        $query = $this->db->where($where,$id)->where($where1,$data1)->order_by($sort,'desc')->get($table);
        return $query->result_array();
    }

    //多条件分页查询
    function select_page_many($table,$where,$data,$where1,$data1,$page,$size,$sort){
        $query = $this->db->where($where,$data)->where($where1,$data1)->order_by($sort,'desc')->limit($size,$page)->get($table);
        return $query->result_array();
    }

    //新增记录返回id
        // function insert_id($table,$data){
        //     $this->db->insert($table,$data);
        //     return $this->db->insert_id();
        // }
    //新增返回id
    function insert_id($table,$data){
        $this->db->insert($table,$data);
        return $this->db->insert_id();
    }

    //多个where条件
    function select_maywhere_info($table,$where,$id,$where2,$id2){
        $query = $this->db->where($where,$id)->where($where2,$id2)->get($table);
        return $query->row_array();
    }

    //返回合同明细
    function contract_info($number){
        $this->db->select('a.*, b.*');
        $this->db->from('h_contract as a');
        $this->db->join('h_project as b', 'b.c_number = a.contract_number','left');
        // $this->db->join('h_project_task as c', 'b.id = c.project_id','left');
        $query = $this->db->where('a.contract_number',$number)->get();
        return $query->row_array(); 
    }

    //返回个人任务列表
    function ret_userTask($userId){
        $this->db->select('a.*,b.*,c.entrust_file,c.contract_number,c.sign_user');
        $this->db->from('h_project_group as a');
        $this->db->join('h_project as b', 'b.id = a.project_id','left');
        $this->db->join('h_contract as c', 'c.contract_number = b.c_number','left');
        $query = $this->db->where('a.user_id',$userId)->where('a.state','1')->order_by('a.addtime','desc')->get();
        return $query->result_array();
    }

    //返回任务类型进度
    function ret_task_type($table,$where,$id,$where1,$id1){
        $query = $this->db->where($where,$id)->where($where1,$id1)->get($table);
        return $query->row_array();
    }

    //返回回访纪录
    function retVisit($page,$size){
        $this->db->select('a.*,b.title,b.industry,b.phone1,b.linkman');
        $this->db->from('h_customer_visit as a');
        $this->db->join('h_customer as b', 'b.id = a.c_id','inner');
        $query = $this->db->order_by('a.visit_time','desc')->limit($page,$size)->get();
        return $query->result_array();
    }

    //获取客户列表标题等
    function customerList(){
        $query = $this->db->select('title,id')->order_by('id','desc')->get('h_customer');
        return $query->result_array();
    }
    

    
}






?> 