package tk.dntree.filter;

import tk.dntree.constant.SystemConstant;
import tk.dntree.model.TreeModel;
import tk.dntree.model.UserModel;
import tk.dntree.utils.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthorizationFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        // TODO Auto-generated method stub
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();
        if (url.startsWith("/TreeManager/admin")) {
            UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
            if (model != null) {
            	//da dang nhap
                if (model.getRole().getCode().equals(SystemConstant.ADMIN)) {
                    filterChain.doFilter(servletRequest, servletResponse);
                } else if (model.getRole().getCode().equals(SystemConstant.USER)) {
                    response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=not_permission&alert=danger");
                }
            } 
            // chua dang nhap
            else {
                response.sendRedirect(
                        request.getContextPath() + "/dang-nhap?action=login&message=not_login&alert=danger");
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
//        if (url.startsWith("/TreeManager/admin")) {
//            TreeModel treeModel = (TreeModel) SessionUtil.getInstance().getValue(request, "TREEMODEL");
//            if(treeModel!=null) {
//            	//da dang nhap
//            }
//        }
    }

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

}
