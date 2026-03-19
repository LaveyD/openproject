const PROXY_CONFIG = [
  {
    context: [
      '/api',
      '/v3', 
      '/oauth',
      '/login',
      '/logout',
      '/session',
      '/work_packages',
      '/projects',
      '/users',
      '/admin',
      '/attachments',
      '/rails'
    ],
    target: 'http://localhost:3000',
    secure: false,
    changeOrigin: true,
    logLevel: 'debug'
  },
  {
    context: (pathname, req) => {
      // 前端资源不代理
      if (pathname.startsWith('/assets/frontend')) return false;
      if (pathname.includes('hot-update')) return false;
      if (pathname.includes('sockjs-node')) return false;
      // 其他请求都代理到 Rails
      return true;
    },
    target: 'http://localhost:3000',
    secure: false,
    changeOrigin: true
  }
];

module.exports = PROXY_CONFIG;
