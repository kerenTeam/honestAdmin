<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');

// 客户挂历
class Contract extends Public_Controller
{

    //  
    public $category = "category";
    public $customer = "customer";
    public $contract = "contract";

    function __construct() {
        parent::__construct();
    }

    //
    function index(){
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
        
        $total = count($this->public_model->select($this->contract,''));
            $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_page($this->contract,$current_page,$config['per_page'],'');
        $this->pagination->initialize($config);

            //获取行业类别
            $industry = $this->public_model->select_where($this->category,'type','1','');
            $service = $this->public_model->select_where($this->category,'type','2','');
            $technology = $this->public_model->select_where($this->category,'type','3','');
            //获取客户信息
            $customer = $this->public_model->select($this->customer,'');
        
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'industry'=>$industry,'service'=>$service,'technology'=>$technology,'customer'=>$customer);

        
        $this->load->view('cont/contractAdmin.html',$data);
    }


}