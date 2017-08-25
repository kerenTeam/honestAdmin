<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');

// 项目管理
class Project extends Public_Controller
{


        public $project = "project";
        public $category = "category";
        public $customer = "customer";

        function __construct() {
            parent::__construct();
        }


        function index(){
            //
            $config['per_page'] = 10;

		//获取页码

		    $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        
            //var_dump($current_page);
    
                //配置
    
            $config['base_url'] = site_url('/Project/index');
    
            //分页配置
    
            $config['full_tag_open'] = '<ul class="am-pagination tpl-pagination">';
    
            $config['full_tag_close'] = '</ul>';
    
            $config['first_tag_open'] = '<li>';
    
            $config['first_tag_close'] = '</li>';
    
            $config['prev_tag_open'] = '<li>';
    
            $config['prev_tag_close'] = '</li>';
    
            $config['next_tag_open'] = '<li>';
    
            $config['next_tag_close'] = '</li>';
    
            $config['cur_tag_open'] = '<li class="am-active"><a>';
    
            $config['cur_tag_close'] = '</a></li>';
    
            $config['last_tag_open'] = '<li>';
    
            $config['last_tag_close'] = '</li>';
    
            $config['num_tag_open'] = '<li>';
    
            $config['num_tag_close'] = '</li>';
    
            $config['first_link']= '首页';
    
            $config['next_link']= '»';
    
            $config['prev_link']= '«';
    
            $config['last_link']= '末页';
            $config['num_links'] = 4;
            
            $total = count($this->public_model->select($this->project,''));
                $config['total_rows'] = $total;
        
            $this->load->library('pagination');//加载ci pagination类
            $listpage =  $this->public_model->select_page($this->project,$current_page,$config['per_page'],'');
            $this->pagination->initialize($config);

             //获取行业类别
             $industry = $this->public_model->select_where($this->category,'type','1','');
             $service = $this->public_model->select_where($this->category,'type','2','');
             $technology = $this->public_model->select_where($this->category,'type','3','');
             //获取客户信息
             $customer = $this->public_model->select($this->customer,'');
           
            $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'industry'=>$industry,'service'=>$service,'technology'=>$technology,'customer'=>$customer);

            $this->load->view('project/projectAdmin.html',$data);

        }

        //新增项目
        function add_project(){
            if($_POST){
                $data= $this->input->post();
                $data['year'] = date('Y');
                if($this->public_model->insert($this->project,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增项目成功,项目名称为".$data['title'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Project/index')."'</script>";

                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"新增项目失败,项目名称为".$data['title'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.location.href='".site_url('/Project/index')."'</script>";
                }

            }else{
                $this->load->view('404.html');
            }
        }



        //新增项目
        function edit_project(){
            if($_POST){
                $data= $this->input->post();
                if($this->public_model->updata($this->project,'id',$data['id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"编辑项目成功,项目名称为".$data['title'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Project/index')."'</script>";

                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"编辑项目失败,项目名称为".$data['title'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.location.href='".site_url('/Project/index')."'</script>";
                }
            }else{

                //获取项目信息
                $id = intval($this->uri->segment(3));
                var_dump($id);

                //获取行业类别
                $data['industry'] = $this->public_model->select_where($this->category,'type','1','');
                $data['service'] = $this->public_model->select_where($this->category,'type','2','');
                $data['technology'] = $this->public_model->select_where($this->category,'type','3','');
                //获取客户信息
                $data['customer'] = $this->public_model->select($this->customer,'');
                
               
                $this->load->view('project/editProject.html',$data);
            }
        }

        //删除合同
        function del_project(){
            $id = $this->input->post('id');
            $data = $this->input->post('state');
            if($this->public_model->updata($this->project,'id',$data['id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除项目到回收站成功,项目名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Project/index')."'</script>";

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"删除项目到回收站失败,项目名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Project/index')."'</script>";
            }
        }


        //修改深审核
        function edit_project_state(){
            $id = $this->input->post('id');
            $data = $this->input->post('type');
            if($this->public_model->updata($this->project,'id',$data['id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除项目到回收站成功,项目名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Project/index')."'</script>";

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"删除项目到回收站失败,项目名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Project/index')."'</script>";
            }
        }

}