class ApiSettings{

  static const _BASE_url = 'https://studentucas.awamr.com/';
  static const _API_RUI = _BASE_url + 'api/';

static const LOGIN = _API_RUI + 'auth/login/user';
static const REGISTER = _API_RUI + 'auth/register/user';
static const LOGOUT = _API_RUI + 'auth/logout';
static const ALLWORKS = _API_RUI + 'all/works';
static const CREATEORDER = _API_RUI + 'create/order';
static const  UNCOMPLETORDER= _API_RUI + 'order/un/complete/user';
static const  ABOUTAPP= _API_RUI + '/information/app';

}