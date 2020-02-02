# ************************************************************
# Migration Down File for goadmin
#  The creation code has been removed from the following files:
#  https://raw.githubusercontent.com/GoAdminGroup/go-admin/master/data/admin.sql
# ************************************************************
DROP TABLE IF EXISTS `goadmin_menu`;
DROP TABLE IF EXISTS `goadmin_operation_log`;
DROP TABLE IF EXISTS `goadmin_permissions`;
DROP TABLE IF EXISTS `goadmin_role_menu`;
DROP TABLE IF EXISTS `goadmin_role_permissions`;
DROP TABLE IF EXISTS `goadmin_role_users`;
DROP TABLE IF EXISTS `goadmin_roles`;
DROP TABLE IF EXISTS `goadmin_session`;
DROP TABLE IF EXISTS `goadmin_user_permissions`;
DROP TABLE IF EXISTS `goadmin_users`;