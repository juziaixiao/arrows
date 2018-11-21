<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/12 0012
 * Time: 23:02
 */

namespace app\api\service;


use app\lib\exception\TokenException;
use think\facade\Cache;

class JApi
{
    private $sendUrl = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi";

    function __construct()
    {
        $accessToken = new AccessToken();
        $token = $accessToken->get();
        $this->sendUrl = sprintf($this->sendUrl, $token);
    }
        /*
         * 获取jsapiticket
         */
    public function getJapi($uid){
        $api_ticket=$this->getFromcache($uid);
        if(!$api_ticket){
            $api_ticket=  $this->getFromserver($uid);
        }
        return $api_ticket;
    }
    /*
     * 重新生成jsapiticket
     */
    public function getFromserver($uid)
    {

        $result=curl_get( $this->sendUrl);
        //dump(curl_get( $this->sendUrl));exit;
        $result = json_decode($result, true);
       if($result['errmsg']=='ok'){
           Cache::set($uid.'jsapi',$result['ticket'],$result['expires_in']);
           return $result['ticket'];
       }else{
           throw new TokenException([
               'code'=>500,
               'msg'=>'获取jsticket失败',
               'errorCode'=>20001
           ]);
       }

    }
        /*
         * 缓存中获取jsapiticket
         */
    public function getFromcache($uid)
    {

     $api_ticket= Cache::get($uid.'jsapi');
     return $api_ticket;
    }
}