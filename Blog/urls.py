from django.urls import path
from . import views

urlpatterns = [
    path('trang-chu/',views.Home,name='trang-chu'),
    path('chi-tiet/<slug>',views.BlogDetails,name="chi-tiet"),
    path('danh-muc/<slug>',views.Category,name="danh-muc"),
    path('ajax/',views.ajax,name="ajax"),
    path('dang-nhap/',views.login,name="login"),
    path('dang-xuat/',views.logout,name="logout"),
    path('dang-ki/',views.register,name="register"),
    path('AjaxRegister/',views.AjaxRegister,name="AjaxRegister"),
    path('AjaxLogin/',views.AjaxLogin,name="AjaxLogin"),
    path('them-bai-viet/',views.AddBlog,name="addblog"),
    path('sua-bai-viet/<slug>',views.EditBlog,name="editblog"),
    path('xoa-bai-viet/',views.DeleteBlog,name="deleteblog"),
    path('bai-viet/',views.MyBlog,name="myblog"),
    path('loi-duong-dan/',views.error404,name="error404"),
    path('ajaxcheckinfo/',views.AjaxCheckInfo,name="ajaxcheckinfo"),
    path('thong-tin-ca-nhan/',views.Profile,name="profile"),
    path('chinh-sua-thong-tin/',views.UpdateProfile,name="updateprofile"),
    path('auth-user/',views.AuthUser,name="authuser"),
    path('quen-mat-khau/',views.ForgotPassword,name="forgotpass"),
    path('danh-sach-bai-viet/<username>',views.BlogList,name="bloglist"),
    path('gioi-thieu/',views.About,name="about"),
    path('lien-he/',views.Contact,name="contact"),
]