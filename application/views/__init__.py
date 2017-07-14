from .user import CheckUserAuthenticatedMixin, Base, Index, Login, Logout, ChangePassword
from .user import UserInfo
from .course import CourseView 
from .grade import GradeTableView, GradeGraphView

__all__ = [
    CheckUserAuthenticatedMixin,
    Base,
    Index,
    Login,
    Logout,
    ChangePassword,
    #Our Views
	UserInfo,
	CourseView,
	GradeTableView,
	GradeGraphView,
]
